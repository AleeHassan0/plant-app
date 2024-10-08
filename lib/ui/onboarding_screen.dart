import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/ui/root_page.dart';

import 'screens/signin_page.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});

  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignIn()));
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ), //to login screen .we update it latter
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              creatPage(
                assets: 'assets/plant-one.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              creatPage(
                assets: 'assets/plant-two.png',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              creatPage(
                assets: 'assets/plant-three.png',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
              bottom: 60,
              right: 30,
              child: Container(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex < 2) {
                          currentIndex++;
                          if (currentIndex < 3) {
                            _pageController.nextPage(
                                duration: Duration(microseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignIn()));
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.white,
                    )),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Constants.primaryColor),
              )),
        ],
      ),
    );
  }

//extra widget
  // create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i > 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class creatPage extends StatelessWidget {
  final String assets;
  final String title;
  final String description;
  const creatPage({
    super.key,
    required this.assets,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(assets),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// create the indicator decorations widgets
Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(microseconds: 300),
    height: 10,
    width: isActive ? 20 : 8,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: Constants.primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
