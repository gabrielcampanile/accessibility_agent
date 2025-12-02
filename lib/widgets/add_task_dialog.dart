import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(String title, String description) onTaskAdded;

  const AddTaskDialog({super.key, required this.onTaskAdded});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  String? _titleError;

  @override
  void initState() {
    super.initState();
    // Focus on title field when dialog opens for better accessibility
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _titleFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  void _addTask() {
    if (_titleController.text.isEmpty) {
      setState(() {
        _titleError = 'Por favor, insira um título';
      });
      _titleFocusNode.requestFocus();
      return;
    }

    setState(() {
      _titleError = null;
    });

    widget.onTaskAdded(_titleController.text, _descriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Diálogo para adicionar nova tarefa',
      child: AlertDialog(
        title: const Text('Nova Tarefa'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                focusNode: _titleFocusNode,
                decoration: InputDecoration(
                  labelText: 'Título da tarefa',
                  hintText: 'Digite o título da tarefa',
                  border: const OutlineInputBorder(),
                  errorText: _titleError,
                ),
                textInputAction: TextInputAction.next,
                onChanged: (_) {
                  if (_titleError != null) {
                    setState(() {
                      _titleError = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  hintText: 'Descrição da tarefa (opcional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _addTask(),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: _addTask,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
