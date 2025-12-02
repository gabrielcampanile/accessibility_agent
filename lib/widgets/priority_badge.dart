import 'package:flutter/material.dart';

enum TaskPriority { low, medium, high }

class PriorityBadge extends StatelessWidget {
  final TaskPriority priority;

  const PriorityBadge({
    super.key,
    required this.priority,
  });

  Color _getPriorityColor() {
    switch (priority) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.high:
        return Colors.red;
    }
  }

  String _getPriorityLabel() {
    switch (priority) {
      case TaskPriority.low:
        return 'Baixa';
      case TaskPriority.medium:
        return 'Média';
      case TaskPriority.high:
        return 'Alta';
    }
  }

  @override
  Widget build(BuildContext context) {
    final label = _getPriorityLabel();
    return Semantics(
      label: 'Prioridade: $label',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _getPriorityColor(),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
