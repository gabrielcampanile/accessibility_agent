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
    final String taskStatus =
        task.isCompleted ? 'Tarefa concluída' : 'Tarefa pendente';

    return Semantics(
      label: '${task.title}. $taskStatus. Deslize para a esquerda para excluir.',
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
            leading: Semantics(
              label: task.isCompleted
                  ? 'Marcar ${task.title} como não concluída'
                  : 'Marcar ${task.title} como concluída',
              child: Checkbox(
                value: task.isCompleted,
                onChanged: (value) {
                  onToggle();
                },
              ),
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
                color: task.isCompleted ? Colors.grey[700] : Colors.black,
              ),
            ),
            subtitle: task.description.isNotEmpty
                ? Text(
                    task.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                          task.isCompleted ? Colors.grey[600] : Colors.grey[700],
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
