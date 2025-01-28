import 'package:copackr/features/createPackingList/widgets/create_packing_list_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CreatePackingListView extends StatelessWidget {
  const CreatePackingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: CreatePackingListBody());
  }
}
