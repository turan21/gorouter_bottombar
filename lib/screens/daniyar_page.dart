import 'package:flutter/material.dart';

class DaniyarPage extends StatelessWidget {
  static const String route = '/daniyar';
  const DaniyarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black54),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Hello!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF303846),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildNewsCard(
                  'Загрязнение воздуха в Бишкеке на 30 января. Что показывают датчики',
                  'https://placehold.co/600x400.jpg',
                ),
                const SizedBox(height: 16),
                _buildNewsCard(
                  'Народ возмущается по поводу налогов',
                  'https://placehold.co/600x400.jpg',
                ),
                const SizedBox(height: 16),
                _buildNewsCard(
                  '', // The third card doesn't have visible text in the image
                  'https://placehold.co/600x400.jpg',
                ),
              ],
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.network(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          if (title.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.deepPurple),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
