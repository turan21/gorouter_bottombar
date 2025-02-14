import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF212121), // Тёмный фон
      body: SafeArea(
        child: Stack(
          children: [
            // Опционально: фон или градиент
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF212121),
                      Color(0xFF1A1A1A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Верхняя панель (приветствие и иконки)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Приветствие
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi Vincent,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Let's keep a note of all the kicks.",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        // Иконки поиска и переключателя вида
                        Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.grid_view_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    // Заголовок Matches
                    const Text(
                      'Matches',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Линия или кастомная вкладка
                    Container(
                      width: 50,
                      height: 3,
                      color: const Color(0xFFB6FF40), // Пример светло-зелёного
                    ),
                    const SizedBox(height: 16),

                    // Горизонтальный список лиг (с иконками)
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildLeagueItem(
                            label: 'UEFA Champions\nleague',
                            // Здесь можно поставить настоящую иконку / лого
                            iconData: Icons.sports_soccer,
                            isSelected: true,
                          ),
                          _buildLeagueItem(
                            label: 'MLS',
                            iconData: Icons.sports_soccer_outlined,
                          ),
                          _buildLeagueItem(
                            label: 'Premier League',
                            iconData: Icons.sports_volleyball,
                          ),
                          _buildLeagueItem(
                            label: 'NBA',
                            iconData: Icons.sports_basketball,
                          ),
                        ],
                      ),
                    ),

                    // -----------------------------
                    // (Убрали блок Live Matches)
                    // -----------------------------

                    const SizedBox(height: 16),

                    // Upcoming Matches
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'UPCOMING MATCHES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Переход или действие "View All"
                          },
                          child: const Text(
                            'VIEW ALL',
                            style: TextStyle(
                              color: Color(0xFFB6FF40),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildUpcomingMatchCard(
                      leagueLogo: 'assets/arsenal.png', // пример
                      matchTitle: 'Aersenal VS Dortmund',
                      matchDate: 'Tuesday, 9 Mar 2021, 05.00 am',
                    ),
                    const SizedBox(height: 8),
                    _buildUpcomingMatchCard(
                      leagueLogo: 'assets/bayern.png', // пример
                      matchTitle: 'Bayem VS Man United',
                      matchDate: 'Tuesday, 16 Mar 2021, 05.00 am',
                    ),

                    const SizedBox(height: 24),

                    // Feed
                    const Text(
                      'Feed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 50,
                      height: 3,
                      color: const Color(0xFFB6FF40),
                    ),
                    const SizedBox(height: 16),

                    // Пример карточек новостей
                    _buildFeedCard(
                      tag: 'Women’s League',
                      title: 'As it happened: Spain win final',
                      subtitle:
                          'Details and reaction after Spain beat France 2-0 in the first women’s national league final',
                      imageUrl: 'assets/women_league.jpg', // заглушка
                    ),
                    const SizedBox(height: 16),
                    _buildFeedCard(
                      tag: 'World Soccer',
                      title: 'Quarter - Finals ties set',
                      subtitle:
                          'Details and reaction after Spain beat France 2-0 in the first women’s national league final',
                      imageUrl: 'assets/world_soccer.jpg', // заглушка
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Виджет для горизонтальной прокрутки лиг
  Widget _buildLeagueItem({
    required String label,
    required IconData iconData,
    bool isSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB6FF40) : Colors.white24,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: isSelected ? Colors.black : Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Виджет карточки Upcoming Match
  Widget _buildUpcomingMatchCard({
    required String leagueLogo,
    required String matchTitle,
    required String matchDate,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Лого лиги / команды
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(leagueLogo), // Placeholder
            backgroundColor: Colors.white24, // На случай отсутствия изображения
          ),
          const SizedBox(width: 16),
          // Текст
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  matchTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  matchDate,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Виджет карточки новостей (Feed)
  Widget _buildFeedCard({
    required String tag,
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Изображение сверху
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Контент карточки
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Тег / категория
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Заголовок новости
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Подзаголовок
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
