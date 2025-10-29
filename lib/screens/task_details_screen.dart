import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text('Детали задания'),
        backgroundColor: const Color(0xFF6C63FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Математика', style: TextStyle(color: Colors.green)),
            ),
            const SizedBox(height: 16),
            const Text('Решить задачи 15–20',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                SizedBox(width: 6),
                Text('30 октября 2025 г.', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.flag, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Высокий', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Описание', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Учебник стр. 45, все задачи с решением.',
                style: TextStyle(color: Colors.black87)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, minimumSize: const Size.fromHeight(45)),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Отметить как выполненное'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(45)),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('Редактировать'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(45)),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Удалить задание'),
            ),
          ],
        ),
      ),
    );
  }
}