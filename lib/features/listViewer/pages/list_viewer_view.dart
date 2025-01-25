import 'package:copackr/features/listViewer/widgets/list_viewer_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ListViewerView extends StatelessWidget {
  const ListViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: ListViewerBody());
  }
}
