import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Test Firestore connection
  Future<bool> testConnection() async {
    try {
      print('🔍 Testing Firestore connection...');

      // Try to get a document that doesn't exist (this should work)
      await _firestore.collection('test').doc('test').get();

      print('✅ Firestore connection successful!');
      return true;
    } catch (e) {
      print('❌ Firestore connection failed: $e');
      return false;
    }
  }

  /// Saves a packing list to Firestore
  ///
  /// Returns the document ID of the created packing list
  /// Throws an exception if the user is not authenticated or if the save fails
  Future<String> savePackingList(Map<String, dynamic> packingListData) async {
    try {
      // Get the current user
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User must be authenticated to save a packing list');
      }

      // Add the user ID to the packing list data
      final dataWithUserId = {
        ...packingListData,
        'userId': currentUser.uid,
      };

      // Save to Firestore
      final docRef =
          await _firestore.collection('packing_lists').add(dataWithUserId);

      print('✅ Packing list saved successfully with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      print('❌ Error saving packing list: $e');
      throw Exception('Failed to save packing list: $e');
    }
  }

  /// Gets all packing lists for the current user
  Future<List<Map<String, dynamic>>> getUserPackingLists() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User must be authenticated to fetch packing lists');
      }

      final querySnapshot = await _firestore
          .collection('packing_lists')
          .where('userId', isEqualTo: currentUser.uid)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data(),
              })
          .toList();
    } catch (e) {
      print('❌ Error fetching user packing lists: $e');
      throw Exception('Failed to fetch packing lists: $e');
    }
  }

  /// Gets a specific packing list by ID
  Future<Map<String, dynamic>?> getPackingList(String listId) async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User must be authenticated to fetch packing list');
      }

      final doc =
          await _firestore.collection('packing_lists').doc(listId).get();

      if (!doc.exists) {
        return null;
      }

      final data = doc.data()!;

      // Verify the list belongs to the current user
      if (data['userId'] != currentUser.uid) {
        throw Exception(
            'Access denied: Packing list does not belong to current user');
      }

      return {
        'id': doc.id,
        ...data,
      };
    } catch (e) {
      print('❌ Error fetching packing list: $e');
      throw Exception('Failed to fetch packing list: $e');
    }
  }

  /// Updates an existing packing list
  Future<void> updatePackingList(
      String listId, Map<String, dynamic> updatedData) async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User must be authenticated to update packing list');
      }

      // Add updated timestamp
      final dataWithTimestamp = {
        ...updatedData,
        'updatedAt': DateTime.now().toIso8601String(),
      };

      await _firestore
          .collection('packing_lists')
          .doc(listId)
          .update(dataWithTimestamp);

      print('✅ Packing list updated successfully: $listId');
    } catch (e) {
      print('❌ Error updating packing list: $e');
      throw Exception('Failed to update packing list: $e');
    }
  }

  /// Deletes a packing list
  Future<void> deletePackingList(String listId) async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User must be authenticated to delete packing list');
      }

      await _firestore.collection('packing_lists').doc(listId).delete();

      print('✅ Packing list deleted successfully: $listId');
    } catch (e) {
      print('❌ Error deleting packing list: $e');
      throw Exception('Failed to delete packing list: $e');
    }
  }
}
