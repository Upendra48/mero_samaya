import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                controller: _pageController,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.network(
                          "https://www.pngall.com/wp-content/uploads/12/Illustration-PNG.png",
                        ),
                        Text(
                          'Time is Precious',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Image.network(
                          "https://www.pngarts.com/files/18/Illustration-PNG-HQ-Pic.png",
                        ),
                        Text(
                          'Stay Focused',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Image.network(
                          "https://www.pngarts.com/files/18/Illustration-PNG-HQ-Picture.png",
                        ),
                        Text(
                          'Achieve Your Goals',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(controller: _pageController, count: 3),
            SizedBox(height: 30),
            isLastPage
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade800,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      label: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade800,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        // Navigate to the next screen or perform any action
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      label: Text('Next', style: TextStyle(fontSize: 16)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
