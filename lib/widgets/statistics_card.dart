import 'package:flutter/material.dart';

import '../services/task_manager.dart';
import 'statistic_column.dart';

class StatisticsCard extends StatelessWidget {
  final TaskManager taskManager;

  const StatisticsCard({super.key, required this.taskManager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Semantics(
        label: 'Estatísticas de tarefas',
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatisticColumn(
                  value: '${taskManager.totalCount}',
                  label: 'Total',
                  color: Colors.blue,
                ),
                StatisticColumn(
                  value: '${taskManager.completedCount}',
                  label: 'Concluídas',
                  color: Colors.green,
                ),
                StatisticColumn(
                  value: '${taskManager.totalCount - taskManager.completedCount}',
                  label: 'Pendentes',
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
