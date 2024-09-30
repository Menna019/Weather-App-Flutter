import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather/views/homeScreen.dart';
import 'package:weather/widgets/onboardingPage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String routeName="onboardingScreen";


  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bg.jpg",
        ),
        fit: BoxFit.cover,
        ),
        ),
        child: Stack(
      children: [
      PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          currentIndex =value;
        });
      },
         children:const[
        OnboardingPage(
        image: "assets/Cloudy.png", 
        description: "Stay prepared for the day with our weather app, giving you real-time updates and a clear view of the cloudy skies ahead.",
        ),

         OnboardingPage(
        image: "assets/lighting.png", 
        description: "Track the storm with our weather app, providing instant alerts and lightning visuals to keep you safe and informed."
        ),

        OnboardingPage(
        image: "assets/sunny.png", 
        description: "Enjoy the sunshine with our weather app, delivering accurate forecasts and bright, sunny visuals to plan your perfect day."
        ),
        OnboardingPage(
        image: "assets/rainy.png", 
        description: "Stay dry with our weather app, offering real-time rain forecasts and detailed visuals to help you navigate those rainy days.",
        
        )
        ],
        ),
        Positioned(
        bottom: 50,
        left: 150,
        child: Column(
        children: [
        SmoothPageIndicator(
        controller: pageController,
         count: 4,
         effect: const ExpandingDotsEffect(
        activeDotColor: Colors.white,
        dotColor: Color.fromARGB(39, 239, 83, 244),
         ),
         onDotClicked: (index) {
            pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            );
         },
         ),
         const SizedBox(height: 50,),
         ElevatedButton(
        onPressed: (){
       if(currentIndex ==3) {
       Navigator.pushReplacementNamed(context, HomeScreen.routeName);
       }else{
        pageController.nextPage(duration: const Duration(milliseconds: 6), 
        curve: Curves.easeIn,
        );
       }
        },
        child: currentIndex ==3 ? const Text("Get Started") : const Text("Skip"),
        ),
        ],
        ),
        ),
        const Positioned(
          top: 80,
          left: 150,
          child: Text("Weather",
          style: TextStyle(fontSize: 37,
          fontFamily: "Lobster-Regular.ttf",
          ),
          ),
          ),
        ],
        ),
        ),
    );
  }
}