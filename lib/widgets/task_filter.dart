import 'package:flutter/material.dart';

enum TaskFilterType { all, completed, pending }

class TaskFilter extends StatefulWidget {
  final TaskFilterType initialFilter;
  final Function(TaskFilterType) onFilterChanged;

  const TaskFilter({
    super.key,
    required this.initialFilter,
    required this.onFilterChanged,
  });

  @override
  State<TaskFilter> createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  late TaskFilterType selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtrar tarefas',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                FilterChip(
                  label: const Text('Todas'),
                  selected: selectedFilter == TaskFilterType.all,
                  onSelected: (selected) {
                    setState(() {
                      selectedFilter = TaskFilterType.all;
                    });
                    widget.onFilterChanged(TaskFilterType.all);
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Completas'),
                  selected: selectedFilter == TaskFilterType.completed,
                  onSelected: (selected) {
                    setState(() {
                      selectedFilter = TaskFilterType.completed;
                    });
                    widget.onFilterChanged(TaskFilterType.completed);
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Pendentes'),
                  selected: selectedFilter == TaskFilterType.pending,
                  onSelected: (selected) {
                    setState(() {
                      selectedFilter = TaskFilterType.pending;
                    });
                    widget.onFilterChanged(TaskFilterType.pending);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
