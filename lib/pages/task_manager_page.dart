import 'package:flutter/material.dart';

import '../services/task_manager.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/empty_state.dart';
import '../widgets/statistics_card.dart';
import '../widgets/task_filter.dart';
import '../widgets/task_item.dart';

class TaskManagerPage extends StatefulWidget {
  const TaskManagerPage({super.key});

  @override
  State<TaskManagerPage> createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerPage> {
  final TaskManager _taskManager = TaskManager();
  TaskFilterType _currentFilter = TaskFilterType.all;

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          onTaskAdded: (title, description) {
            _taskManager.addTask(title, description);
            setState(() {});
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tarefa adicionada com sucesso!')),
            );
          },
        );
      },
    );
  }

  void _deleteTask(String taskId) {
    _taskManager.deleteTask(taskId);
    setState(() {});
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Tarefa deletada')));
  }

  void _toggleTask(String taskId) {
    _taskManager.toggleTask(taskId);
    setState(() {});
  }

  List get _filteredTasks {
    switch (_currentFilter) {
      case TaskFilterType.all:
        return _taskManager.tasks;
      case TaskFilterType.completed:
        return _taskManager.tasks.where((task) => task.isCompleted).toList();
      case TaskFilterType.pending:
        return _taskManager.tasks.where((task) => !task.isCompleted).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciador de Tarefas'), elevation: 2),
      body: _taskManager.tasks.isEmpty
          ? const EmptyState()
          : Column(
              children: [
                StatisticsCard(taskManager: _taskManager),
                TaskFilter(
                  initialFilter: _currentFilter,
                  onFilterChanged: (filter) {
                    setState(() {
                      _currentFilter = filter;
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: _filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = _filteredTasks[index];
                      return TaskItem(
                        task: task,
                        onToggle: () => _toggleTask(task.id),
                        onDelete: () => _deleteTask(task.id),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        tooltip: 'Adicionar tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
