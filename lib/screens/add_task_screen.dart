import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleCtrl = TextEditingController();
  String? _subject;
  String _priority = 'Средний';
  DateTime? _picked;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final res = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 5),
    );
    if (res != null) setState(() => _picked = res);
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar с градиентом
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.black87), onPressed: () => Navigator.pop(context)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF7B5CFF), Color(0xFF8C2BFF)]),
          ),
          padding: const EdgeInsets.only(top: 36),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
            child: Text('Новое задание', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(controller: _titleCtrl, decoration: const InputDecoration(labelText: 'Название задания *', hintText: 'Например: Домашнее задание по алгебре', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Предмет *', border: OutlineInputBorder()),
              value: _subject,
              items: const [
                DropdownMenuItem(value: 'Математика', child: Text('Математика')),
                DropdownMenuItem(value: 'История', child: Text('История')),
                DropdownMenuItem(value: 'Физика', child: Text('Физика')),
              ],
              onChanged: (v) => setState(() => _subject = v),
            ),
            const SizedBox(height: 12),
            TextField(maxLines: 4, decoration: const InputDecoration(labelText: 'Описание', hintText: 'Добавьте детали задания...', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: _pickDate,
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Срок сдачи *',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: const OutlineInputBorder(),
                    hintText: _picked != null ? '${_picked!.day}.${_picked!.month}.${_picked!.year}' : 'Выберите дату',
                    suffixIcon: IconButton(icon: const Icon(Icons.date_range), onPressed: _pickDate),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Приоритет', border: OutlineInputBorder()),
              value: _priority,
              items: const [
                DropdownMenuItem(value: 'Высокий', child: Text('Высокий')),
                DropdownMenuItem(value: 'Средний', child: Text('Средний')),
                DropdownMenuItem(value: 'Низкий', child: Text('Низкий')),
              ],
              onChanged: (v) => setState(() => _priority = v ?? 'Средний'),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: в этом месте добавить сохранение задачи
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C63FF)),
                    child: const Text('Добавить'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}