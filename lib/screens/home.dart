import 'package:flutter/material.dart';
import 'package:mero_samaya/provider/timer_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<TimerProvider>(
          builder: (context, timer, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(timer.phase),
              SizedBox(height: 20),
              CircularPercentIndicator(
                radius: 150.0,
                circularStrokeCap: CircularStrokeCap.round,
                lineWidth: 30.0,
                arcBackgroundColor: Colors.grey.shade100,
                arcType: ArcType.FULL,
                percent: timer.progress,
                center: Text(
                  timer.formattedTime,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                progressColor: Colors.orange,
              ),
              const SizedBox(height: 20),
              IconButton(
                onPressed: timer.toggleTimer,
                icon: Icon(timer.isRunning ? Icons.pause : Icons.play_arrow),
                iconSize: 64,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/settings');
          }
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
        ],
      ),
    );
  }
}
