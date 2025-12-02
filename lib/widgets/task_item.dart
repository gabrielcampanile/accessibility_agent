import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final String taskStatus = task.isCompleted ? 'concluída' : 'pendente';

    return Semantics(
      label: 'Tarefa: ${task.title}, $taskStatus. Deslize para a esquerda para excluir.',
      child: Dismissible(
        key: Key(task.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            semanticLabel: 'Excluir tarefa',
          ),
        ),
        onDismissed: (direction) {
          onDelete();
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                onToggle();
              },
              semanticLabel: task.isCompleted
                  ? 'Marcar tarefa ${task.title} como pendente'
                  : 'Marcar tarefa ${task.title} como concluída',
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                color: task.isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            subtitle: task.description.isNotEmpty
                ? Text(
                    task.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: task.isCompleted
                          ? Colors.grey[400]
                          : Colors.grey[600],
                    ),
                  )
                : null,
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDelete,
              tooltip: 'Excluir tarefa ${task.title}',
            ),
          ),
        ),
      ),
    );
  }
}
