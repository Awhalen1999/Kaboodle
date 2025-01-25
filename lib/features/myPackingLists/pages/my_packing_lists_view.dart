import 'package:copackr/features/myPackingLists/widgets/my_packing_lists_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class MyPackingListsView extends StatelessWidget {
  const MyPackingListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: MyPackingListsBody());
  }
}
