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

  String _getFilterLabel(TaskFilterType filter) {
    switch (filter) {
      case TaskFilterType.all:
        return 'Todas as tarefas';
      case TaskFilterType.completed:
        return 'Tarefas completas';
      case TaskFilterType.pending:
        return 'Tarefas pendentes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Filtro de tarefas',
      child: Card(
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
                    tooltip: _getFilterLabel(TaskFilterType.all),
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
                    tooltip: _getFilterLabel(TaskFilterType.completed),
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
                    tooltip: _getFilterLabel(TaskFilterType.pending),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
