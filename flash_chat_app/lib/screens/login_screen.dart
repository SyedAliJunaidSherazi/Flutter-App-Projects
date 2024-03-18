import 'package:flash_chat/resources/material_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cool_alert/cool_alert.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool showSpinner = false;

  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner ,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email  = value;
                  //Do something with the user input.
                },
                decoration:
                    kDecorationInput.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration:
                    kDecorationInput.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              MaterialButtonWidget(
                onPress: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user!=null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });

                  }catch(e){
                    print(e);
                  }

                },
                text: 'Log In',
                color: Colors.blueAccent,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.0),
              //   child: Material(
              //     color: Colors.lightBlueAccent,
              //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //     elevation: 5.0,
              //     child: MaterialButton(
              //       onPressed: () {
              //         //Implement login functionality.
              //       },
              //       minWidth: 200.0,
              //       height: 42.0,
              //       child: Text(
              //         'Log In',
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Input Decoration
//
// InputDecoration(
// hintText: 'Enter your email',
// contentPadding:
// EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(32.0)),
// ),
// enabledBorder: OutlineInputBorder(
// borderSide:
// BorderSide(color: Colors.lightBlueAccent, width: 1.0),
// borderRadius: BorderRadius.all(Radius.circular(32.0)),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide:
// BorderSide(color: Colors.lightBlueAccent, width: 2.0),
// borderRadius: BorderRadius.all(Radius.circular(32.0)),
// ),
// ),
