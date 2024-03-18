import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../resources/material_button.dart';
class WelcomeScreen extends StatefulWidget {
  // making static property so that if an error occur android studio will let us know .
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// mixins are using to reuse the code within instead of extending a class cz only class can be extended at a time . One class can use multiple mixins at a time but can extend only one class at a time
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller; // controllers controls the animation
  late Animation animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      // it provides duration to animations. i  this case 60sec per min
      vsync:
          this, // this asks where our animation will sync. in our case our statefull widget is behaving like a ticker . so we used this to give it a context

      // upperBound: 100.0,  // we can set upper and lower bounds for our animations like from to 100 etc.
    );
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate); // its an extra layer over our animation to customize it with different animation styles
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();

    // animation.addStatusListener((status) {  // checking for animation
    //
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }else if( status== AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    //
    // });

    controller.addListener(() {
      setState(
          () {}); // using set state will rebuild all widgets in the build method so that duration can update
      print(controller
          .value); // control value will provide the values from ranging from 0 to 1. But we can cutimize it using upper or lower bounds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    // height: animation.value *100,   // as curve animation only takes value btw 0 and 1 so we have mulitplied it with 100 to customize it
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      // we can give controller.value here to even have a sceen loading type effect
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(seconds: 5),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MaterialButtonWidget(
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'Login',
              color: Colors.lightBlueAccent,
            ),

            MaterialButtonWidget(
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              text: 'Register',
              color: Colors.lightBlueAccent,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.circular(30.0),
            //     elevation: 5.0,
            //     child: MaterialButton(
            //       onPressed: () {
            //         // we can use navigator.pushName to go into new dart file using static properties of that particular class
            //         Navigator.pushNamed(context, RegistrationScreen.id);
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(
            //         //     builder: (context) {
            //         //       return RegistrationScreen();
            //         //     },
            //         //   ),
            //         // );
            //         // //Go to registration screen.
            //       },
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: Text(
            //         'Register',
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
