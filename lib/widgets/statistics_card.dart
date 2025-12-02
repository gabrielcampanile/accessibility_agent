import 'package:flutter/material.dart';

import '../services/task_manager.dart';
import 'statistic_column.dart';

class StatisticsCard extends StatelessWidget {
  final TaskManager taskManager;

  const StatisticsCard({super.key, required this.taskManager});

  @override
  Widget build(BuildContext context) {
    final total = taskManager.totalCount;
    final completed = taskManager.completedCount;
    final pending = total - completed;

    return Semantics(
      label:
          'Estatísticas de tarefas. Total: $total, Concluídas: $completed, Pendentes: $pending',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatisticColumn(
                  value: '$total',
                  label: 'Total',
                  color: Colors.blue,
                ),
                StatisticColumn(
                  value: '$completed',
                  label: 'Concluídas',
                  color: Colors.green,
                ),
                StatisticColumn(
                  value: '$pending',
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
