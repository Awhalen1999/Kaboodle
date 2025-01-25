import 'package:copackr/features/calendar/widgets/calendar_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: CalendarBody());
  }
}
