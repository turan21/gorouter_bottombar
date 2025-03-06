import 'package:flutter/material.dart';

class TaskCalendarPage extends StatelessWidget {
  static const String route = '/taskcalendar';
  const TaskCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2D3752)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF2D3752)),
            onPressed: () {},
          ),
        ],
        title: const Text(''), // Empty title
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: const Text(
              'Feb, 2025',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3752),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Locations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3752),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                LocationCard(
                  title: 'Кулатова 2/15',
                  subtitle: '2 Days ago',
                ),
                SizedBox(height: 16),
                LocationCard(
                  title: 'Юнусалиева 25',
                  subtitle: 'Ololo planet',
                ),
                SizedBox(height: 16),
                LocationCard(
                  title: 'Проспект Манаса 17/1',
                  subtitle: 'Azia Mall Coworking center',
                ),
                SizedBox(height: 16),
                LocationCard(
                  title: 'Чуй 171',
                  subtitle: 'ГУМ Чынар Coworking center',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const LocationCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF8255FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3752),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
