// lib/pages/diabetes_dashboard_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiabetesDashboardPage extends StatefulWidget {
  const DiabetesDashboardPage({Key? key}) : super(key: key);

  @override
  State<DiabetesDashboardPage> createState() => _DiabetesDashboardPageState();
}

class _DiabetesDashboardPageState extends State<DiabetesDashboardPage> {
  final DateTime _currentDate = DateTime.now();
  int _selectedDayIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is just a page—you can Navigator.push to it.
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile + Notifications
                    Row(
                      children: [
                        Container(
                          width: 36, height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 1),
                          ),
                          child: ClipOval(child: Image.asset('assets/doctor_team.png', fit: BoxFit.cover)),
                        ),
                        const SizedBox(width: 8),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow.shade200,
                              ),
                              child: const Icon(Icons.notifications, size: 20, color: Colors.orange),
                            ),
                            Positioned(
                              right: 0, top: 0,
                              child: Container(
                                width: 12, height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text('1', style: TextStyle(color: Colors.white, fontSize: 8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Welcome text + menu
                    Row(
                      children: [
                        const Text('Welcome, John Doe !',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 8),
                        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),

              // --- Search Bar ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Find records, doctors, advice...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),

              // --- Week Calendar ---
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.chevron_left), onPressed: () {}),
                    Expanded(child: ListView(scrollDirection: Axis.horizontal, children: _buildWeekCalendar())),
                    IconButton(icon: const Icon(Icons.chevron_right), onPressed: () {}),
                  ],
                ),
              ),

             
              // --- Main Content Cards ---
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                     // --- Health Summary Title ---
                     Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                       child: Row(
                       children: [
                       Container(
                        width: 25, height: 20,
                       decoration: const BoxDecoration(color: Color(0xFF00C2CB), shape: BoxShape.circle),
                       child: const Center(child: Icon(Icons.play_arrow, color: Colors.white, size: 14)),
                      ),
                    const SizedBox(width: 8),
                    const Text("Today's Health Summary",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00C2CB))),
                  ],
                ),
              ),

                    // With this horizontal scroller:
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      // First Blood-Sugar Card
      Container(
        width: 300,              // fixed width so you can scroll
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Today's Blood Sugar Levels",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 16),
            Row(children: const [
              Icon(Icons.trending_up, color: Colors.grey),
              SizedBox(width: 8),
              Text("Current Blood Sugar Level",
                style: TextStyle(fontSize: 16, color: Colors.black87)),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 8.0),
              child: Row(children: [
                Image.asset('assets/doctor_team.png', width: 24, height: 24, color: Colors.red),
                const SizedBox(width: 8),
                const Text("112 mg/dL",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text("status : Normal",
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ]),
            ),
            const SizedBox(height: 16),
            Row(children: const [
              Icon(Icons.access_time, color: Colors.black),
              SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Time of Last Measurement",
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
                Text("Last checked: 9:30 AM",
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
              ]),
            ]),
            const SizedBox(height: 16),
            Row(children: [
              Icon(Icons.water_drop, color: Colors.blue.shade400),
              const SizedBox(width: 8),
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Water Intake Tracker",
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
                Text("You've only had 2 glasses today.",
                  style: TextStyle(fontSize: 12, color: Colors.redAccent)),
              ]),
            ]),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Log a New Reading"),
              ),
            ),
          ],
        ),
      ),

      // You can clone that Container to add more cards:
      Container(
        width: 300,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          // … same content or different …
        ),
      ),
    ],
  ),
),

                    const SizedBox(height: 16),

                    // Healthy Meals
                    Row(children: [
                      Container(
                        width: 20, height: 20,
                        decoration: const BoxDecoration(color: Color(0xFF00C2CB), shape: BoxShape.circle),
                        child: const Center(child: Icon(Icons.play_arrow, color: Colors.white, size: 14)),
                      ),
                      const SizedBox(width: 8),
                      const Text("Discover Healthy Meals",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00C2CB))),
                    ]),

                    const SizedBox(height: 16),

                    Row(children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset('assets/doctor_team.png', height: 120, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset('assets/doctor_team.png', height: 120, fit: BoxFit.cover),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),

              // --- Bottom Navigation Bar ---
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, -3))],
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  _buildNavItem(Icons.home, true),
                  _buildNavItem(Icons.add_circle_outline, false),
                  _buildNavItem(Icons.favorite_border, false),
                  _buildNavItem(Icons.settings, false),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade200 : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, color: isSelected ? Colors.blue : Colors.grey, size: 28),
    );
  }

  List<Widget> _buildWeekCalendar() {
    final List<String> days = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
    final DateTime startOfWeek = _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
    return List.generate(7, (i) {
      final date = startOfWeek.add(Duration(days: i));
      final isSelected = i+1 == _selectedDayIndex;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(days[i], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Container(
            width: 26, height: 26,
            decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? Colors.red : Colors.transparent),
            child: Center(child: Text((i+1).toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : Colors.black))),
          ),
        ]),
      );
    });
  }
}
