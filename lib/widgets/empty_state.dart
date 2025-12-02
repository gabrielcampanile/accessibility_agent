import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Lista de tarefas vazia. Clique no botão adicionar para criar uma nova tarefa.',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task_alt,
              size: 64,
              color: Colors.grey[600],
              semanticLabel: 'Ícone de lista de tarefas',
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhuma tarefa adicionada',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Clique no botão + para adicionar uma nova tarefa',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
