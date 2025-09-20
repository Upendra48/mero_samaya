import 'package:flutter/material.dart';
import 'package:mero_samaya/provider/timer_provider.dart';
import 'package:mero_samaya/screens/home.dart';
import 'package:mero_samaya/screens/onboarding.dart';
import 'package:mero_samaya/screens/settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  runApp( 
    ChangeNotifierProvider(
      create: (context) => TimerProvider(),
      child: MyApp(isFirstLaunch: isFirstLaunch,),
    )
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Samaya Timer',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes:{
        '/': (context) => OnBoardingScreen(),
        '/onboarding': (context) => OnBoardingScreen(),
        '/home': (context) => HomeScreen(),
        '/settings': (context) => SettingsScreen(),
      }
    );
  }
}