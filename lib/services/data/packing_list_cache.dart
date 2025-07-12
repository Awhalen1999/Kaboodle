import 'package:flutter/material.dart';
import 'package:kaboodle/services/data/firestore.dart';

class PackingListCache extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  List<Map<String, dynamic>> _cachedLists = [];
  bool _isLoading = false;
  String? _error;
  bool _hasLoaded = false;

  // Getters
  List<Map<String, dynamic>> get lists => List.unmodifiable(_cachedLists);
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasLoaded => _hasLoaded;
  int get count => _cachedLists.length;

  /// Get lists from cache or fetch if needed
  Future<List<Map<String, dynamic>>> getLists(
      {bool forceRefresh = false}) async {
    // Return cached data if available and not forcing refresh
    if (_hasLoaded && !forceRefresh && _error == null) {
      return _cachedLists;
    }

    // Fetch from Firestore
    await _fetchLists();
    return _cachedLists;
  }

  /// Fetch lists from Firestore
  Future<void> _fetchLists() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final lists = await _firestoreService.getUserPackingLists();

      _cachedLists = lists;
      _hasLoaded = true;
      _isLoading = false;
      notifyListeners();

      debugPrint('📦 Cache updated: ${lists.length} lists loaded');
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      debugPrint('❌ Cache fetch error: $e');
    }
  }

  /// Force refresh the cache
  Future<void> refresh() async {
    await _fetchLists();
  }

  /// Add a new list to cache
  void addList(Map<String, dynamic> newList) {
    _cachedLists.insert(0, newList); // Add to beginning (newest first)
    notifyListeners();
    debugPrint('📦 Added new list to cache: ${newList['title']}');
  }

  /// Remove a list from cache
  void removeList(String listId) {
    _cachedLists.removeWhere((list) => list['id'] == listId);
    notifyListeners();
    debugPrint('📦 Removed list from cache: $listId');
  }

  /// Update a list in cache
  void updateList(String listId, Map<String, dynamic> updatedList) {
    final index = _cachedLists.indexWhere((list) => list['id'] == listId);
    if (index != -1) {
      _cachedLists[index] = updatedList;
      notifyListeners();
      debugPrint('📦 Updated list in cache: ${updatedList['title']}');
    }
  }

  /// Clear the cache
  void clearCache() {
    _cachedLists.clear();
    _hasLoaded = false;
    _error = null;
    _isLoading = false;
    notifyListeners();
    debugPrint('📦 Cache cleared');
  }

  /// Get a specific list by ID
  Map<String, dynamic>? getListById(String listId) {
    try {
      return _cachedLists.firstWhere((list) => list['id'] == listId);
    } catch (e) {
      return null;
    }
  }

  /// Delete a list from Firestore and refresh cache
  Future<void> deleteList(String listId) async {
    await _firestoreService.deletePackingList(listId);
    await refresh();
  }
}
