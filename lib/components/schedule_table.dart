import 'package:flutter/material.dart';

import '../constants.dart';

class ScheduleTable extends StatelessWidget {
  final Map<String, String> schedule;

  const ScheduleTable(this.schedule, {Key? key})
      : assert(schedule.length == 7),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {0: FlexColumnWidth(1.0), 1: FlexColumnWidth(2.0)},
      children: _createRows(),
    );
  }

  List<TableRow> _createRows() {
    return schedule.entries
        .map((entry) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding / 8,
                  ),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: defaultPadding,
                    ),
                  ),
                ),
                Text(
                  entry.value,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: defaultPadding,
                  ),
                ),
              ],
            ))
        .toList();
  }
}
