import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Пример модели "Заказ"
class Order {
  final String orderNumber;
  final String recipientName;
  final String recipientLastName;
  final DateTime orderedDate;
  final DateTime deliveryDate;
  final String deliveryAddress;
  final int itemsCount;

  /// Текущий статус
  String status;

  /// Флаг, развернута ли доп. информация
  bool isExpanded;

  Order({
    required this.orderNumber,
    required this.recipientName,
    required this.recipientLastName,
    required this.orderedDate,
    required this.deliveryDate,
    required this.deliveryAddress,
    required this.itemsCount,
    required this.status,
    this.isExpanded = false,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Table Example',
      theme: ThemeData.light(),
      home: const OrdersPage(),
    );
  }
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // Пример списка заказов
  final List<Order> _orders = [
    Order(
      orderNumber: '#LUNA101',
      recipientName: 'Erkebek',
      recipientLastName: 'Abdrakhman uulu',
      orderedDate: DateTime(2023, 5, 11, 1, 35),
      deliveryDate: DateTime(2023, 5, 10),
      deliveryAddress: 'Self pick up',
      itemsCount: 1,
      status: 'placed',
    ),
    Order(
      orderNumber: '#LUNA99',
      recipientName: 'Erkebek',
      recipientLastName: 'Abdrakhman uulu',
      orderedDate: DateTime(2022, 6, 18, 11, 4),
      deliveryDate: DateTime(2022, 2, 17),
      deliveryAddress: 'Zoo Drive San Diego 92101',
      itemsCount: 1,
      status: 'placed',
    ),
    Order(
      orderNumber: '#LUNA98',
      recipientName: 'Erkebek',
      recipientLastName: 'Abdrakhman uulu',
      orderedDate: DateTime(2022, 6, 18, 22, 45),
      deliveryDate: DateTime(2022, 6, 23),
      deliveryAddress: 'Zoo Drive San Diego 92101',
      itemsCount: 1,
      status: 'placed',
    ),
    Order(
      orderNumber: '#LUNA83',
      recipientName: 'Test Luna Flowers',
      recipientLastName: '',
      orderedDate: DateTime(2022, 3, 14, 1, 50),
      deliveryDate: DateTime(2022, 2, 28),
      deliveryAddress: '160 Will Orchard Suite 722',
      itemsCount: 1,
      status: 'processing',
    ),
    Order(
      orderNumber: '#LUNA79',
      recipientName: 'Test Luna Flowers',
      recipientLastName: '',
      orderedDate: DateTime(2022, 3, 14, 1, 50),
      deliveryDate: DateTime(2022, 3, 10),
      deliveryAddress: '639 Francesco Passage Suite 378 App 5',
      itemsCount: 3,
      status: 'processing',
    ),
    Order(
      orderNumber: '#LUNA73',
      recipientName: 'Test Luna Flowers',
      recipientLastName: '',
      orderedDate: DateTime(2022, 3, 14, 1, 50),
      deliveryDate: DateTime(2022, 2, 26),
      deliveryAddress: 'Self pick up',
      itemsCount: 1,
      status: 'out_for_delivery',
    ),
    Order(
      orderNumber: '#LUNA72',
      recipientName: 'Erkebek',
      recipientLastName: 'Abdrakhman uulu',
      orderedDate: DateTime(2022, 3, 14, 1, 50),
      deliveryDate: DateTime(2022, 2, 14),
      deliveryAddress: 'Self pick up',
      itemsCount: 4,
      status: 'ready_for_pick_up',
    ),
    Order(
      orderNumber: '#LUNA71',
      recipientName: 'Test Luna Flowers',
      recipientLastName: '',
      orderedDate: DateTime(2022, 3, 14, 1, 50),
      deliveryDate: DateTime(2022, 3, 11),
      deliveryAddress: '8380 Norberto Parkway Apt. 597 App 8',
      itemsCount: 1,
      status: 'delivered',
    ),
  ];

  // Пример возможных статусов
  final List<String> _allStatuses = [
    'placed',
    'processing',
    'out_for_delivery',
    'ready_for_pick_up',
    'delivered',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Table'),
      ),
      body: Scrollbar(
        thumbVisibility: true, // для десктопа
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1200, // Задайте нужную ширину, чтобы таблица влезала
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _buildHeaderRow(),
                    const Divider(height: 1),
                    // Генерируем строки:
                    for (int i = 0; i < _orders.length; i++) ...[
                      _buildOrderRow(_orders[i]),
                      // при развернутом состоянии — показать дополнительную инфу
                      if (_orders[i].isExpanded)
                        _buildExpandedContent(_orders[i]),
                      const Divider(height: 1),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Шапка таблицы
  Widget _buildHeaderRow() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Пустой отступ под стрелку
          _headerCell('', flex: 1),
          _headerCell('Order number', flex: 3),
          _headerCell('Recipient', flex: 3),
          _headerCell('Ordered date', flex: 3, canSort: true),
          _headerCell('Delivery date', flex: 3),
          _headerCell('Delivery address', flex: 4),
          _headerCell('Items count', flex: 2),
          _headerCell('Status', flex: 2),
          // Кнопка(и) справа
          _headerCell('', flex: 1),
        ],
      ),
    );
  }

  Widget _headerCell(String text, {required int flex, bool canSort = false}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            if (canSort) ...[
              const SizedBox(width: 4),
              const Icon(Icons.arrow_upward, size: 16),
            ],
          ],
        ),
      ),
    );
  }

  /// Строка таблицы (с данными)
  Widget _buildOrderRow(Order order) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Иконка "развернуть"
          Expanded(
            flex: 1,
            child: IconButton(
              iconSize: 20,
              icon: Icon(
                order.isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
              ),
              onPressed: () {
                setState(() {
                  order.isExpanded = !order.isExpanded;
                });
              },
            ),
          ),
          _cellText(order.orderNumber, flex: 3),
          _cellText('${order.recipientName} ${order.recipientLastName}',
              flex: 3),
          _cellText(_formatDateTime(order.orderedDate), flex: 3),
          _cellText(_formatDate(order.deliveryDate), flex: 3),
          _cellText(order.deliveryAddress, flex: 4),
          _cellText(order.itemsCount.toString(), flex: 2),
          _buildStatusDropdown(order, flex: 2),
          // Кнопка "троеточие"
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Меню или другое действие
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Детальная часть, которая появляется при развернутом состоянии
  /// Можно кастомизировать, например, историю статусов, комментарии и пр.
  Widget _buildExpandedContent(Order order) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Additional info for ${order.orderNumber}...',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(
            'Here you can place any extra details, such as payment info, shipping logs, etc.',
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  /// Ячейка с простым текстом
  Widget _cellText(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  /// Ячейка со статусом (Dropdown + цветной бэйдж)
  Widget _buildStatusDropdown(Order order, {required int flex}) {
    // Цвет заливки для каждого статуса
    final statusColors = <String, Color>{
      'placed': Colors.blue[100]!,
      'processing': Colors.orange[100]!,
      'out_for_delivery': Colors.lightBlueAccent.withOpacity(0.3),
      'ready_for_pick_up': Colors.lightGreenAccent.withOpacity(0.5),
      'delivered': Colors.greenAccent.withOpacity(0.4),
    };

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          // фон «бэйджа» вокруг выпадашки
          decoration: BoxDecoration(
            color: statusColors[order.status] ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: order.status,
              isDense: true,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              items: _allStatuses.map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (String? newVal) {
                if (newVal != null) {
                  setState(() {
                    order.status = newVal;
                  });
                }
              },
              icon: const Icon(Icons.keyboard_arrow_down, size: 18),
            ),
          ),
        ),
      ),
    );
  }

  /// Форматирование даты и времени
  String _formatDateTime(DateTime dt) {
    // Пример: 11, May 2023 at 01:35 AM
    final day = dt.day.toString().padLeft(2, '0');
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final monthStr = monthNames[dt.month - 1];
    final year = dt.year;
    // Часы, минуты
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final ampm = dt.hour < 12 ? 'AM' : 'PM';
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$day, $monthStr $year at $hour:$minute $ampm';
  }

  /// Форматирование только даты
  String _formatDate(DateTime dt) {
    // Пример: 10, May 2023
    final day = dt.day.toString().padLeft(2, '0');
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final monthStr = monthNames[dt.month - 1];
    final year = dt.year;
    return '$day, $monthStr $year';
  }
}
