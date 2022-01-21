import 'package:flutter/material.dart';

import '../constants.dart';
import '../services/models/types/opening_hours.dart';

class ScheduleTable extends StatelessWidget {
  final OpeningHours openingHours;

  const ScheduleTable(this.openingHours, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {0: FlexColumnWidth(1.0), 1: FlexColumnWidth(2.0)},
      children: _createRows(),
    );
  }

  List<TableRow> _createRows() {
    return openingHours.weekdayText
            ?.map((entry) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 8,
                      ),
                      child: Text(
                        entry.split(': ')[0],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: defaultPadding,
                        ),
                      ),
                    ),
                    Text(
                      entry.split(': ')[1],
                      style: const TextStyle(
                        color: textColor,
                        fontSize: defaultPadding,
                      ),
                    ),
                  ],
                ))
            .toList() ??
        [
          const TableRow(children: [Text('No data available.')])
        ];
  }
}
