import 'package:flutter/material.dart';
import 'dart:math'; // For pi
import 'chart.dart';

// Sample data for transactions
final List<Map<String, dynamic>> transactionsData = [
  {
    'color': Colors.blue,
    'icon': const Icon(Icons.food_bank, color: Colors.white),
    'name': 'Groceries',
    'date': '2023-06-01',
    'totalAmount': '\$50.00'
  },
  {
    'color': Colors.green,
    'icon': const Icon(Icons.shopping_cart, color: Colors.white),
    'name': 'Shopping',
    'date': '2023-06-01',
    'totalAmount': '\$100.00'
  },
  {
    'color': Colors.red,
    'icon': const Icon(Icons.medical_services, color: Colors.white),
    'name': 'Health',
    'date': '2023-06-01',
    'totalAmount': '\$150.00'
  },
  {
    'color': Colors.purple,
    'icon': const Icon(Icons.flight, color: Colors.white),
    'name': 'Travel',
    'date': '2023-06-01',
    'totalAmount': '\$200.00'
  },
  {
    'color': Colors.orange,
    'icon': const Icon(Icons.house, color: Colors.white),
    'name': 'Buy Home',
    'date': '2023-06-01',
    'totalAmount': '\$250.00'
  },
  // Add more transactions here
];

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: MyChart(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "From 01-06-2024",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactionsData.length,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.tertiary,
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.primary,
                          ],
                          transform: const GradientRotation(pi / 4),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: transactionsData[i]['color']),
                                    ),
                                    transactionsData[i]['icon'],
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  transactionsData[i]['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  transactionsData[i]['date'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  transactionsData[i]['totalAmount'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
