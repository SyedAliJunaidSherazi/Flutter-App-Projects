import 'package:flutter/material.dart';

void main() {
  runApp(
    const myApp()
  );
}

class myApp extends StatelessWidget {   // For Hot Reload Stateless widget is required.
                                 // It checks for the last changed item and then calls the recent build function near it.
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade800,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const CircleAvatar(   // To create a Circle Avatar for pics and avatar
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage("images/OIP.png"),
              ),
              const Text(
                  "Muhammad Mansoor",
                style: TextStyle(   // Sets the Style of text like size color etc
                    fontFamily: "Lobster",
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                  "Flutter Developer",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(       // Sized Box is used to add spaces between widgets
                height: 20.0,
                child: Divider(
                  color: Colors.teal.shade200,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                child: ListTile(   // ListTile is used instead of row as it makes the code alot easier to write and understand.
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+92 333 5437627",
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 20.0,
                        color: Colors.teal.shade900
                    ),
                  ),
                ),
              ),
              Card(   // Cards are more appealing than containers. Also a Card does not contain padding
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                //padding: EdgeInsets.all(10.0),
                child: Padding(   // Padding widget is used to insert padding. It is used as a child widget to the widget that needs padding.
                                  // It acts a blanket on the widget on which it is used as a child
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.teal,
                      ),
                      SizedBox(    // Sized box is used to add space between elements of rows or columns
                        width: 15.0,
                      ),
                      Text(
                        "muh.mansoor@gmail.com",
                        style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 18.0,
                            color: Colors.teal.shade900
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*   /// Practice Code For creating a simple design layout using container. The above one is created using Cards
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children:[
              const CircleAvatar(   // To create a Circle Avatar for pics and avatar
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage("images/OIP.png"),
              ),
              const Text(
                  "Muhammad Mansoor",
                style: TextStyle(   // Sets the Style of text like size color etc
                    fontFamily: "Lobster",
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                  "Flutter Developer",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                        Icons.phone,
                        color: Colors.teal,
                    ),
                    SizedBox(    // Sized box is used to add space between elements of rows or columns
                      width: 15.0,
                    ),
                    Text(
                      "+92 333 5437627",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 20.0,
                        color: Colors.teal.shade900
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                    SizedBox(    // Sized box is used to add space between elements of rows or columns
                      width: 15.0,
                    ),
                    Text(
                      "muhammadmansoor805@gmail.com",
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 18.0,
                          color: Colors.teal.shade900
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
   */

  /* Practice Code  For tutorial

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(    // SafeArea widget lays content in the safe are on the scree. Where it is visible to the user
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container( // Container can only contain a single widget
                width: 100.0,
                //margin: EdgeInsets.all(20.0), // Insert margins of specified value to all 4 sides. Other Options are also available. Also Margin is used for outer side of the container.
                //padding: EdgeInsets.all(10.0), // Similar as Margins But is used for inner side of container.
                color: Colors.red,
                child: Text("Container 1"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( // Container can only contain a single widget
                    width: 100.0,
                    height: 100.0,
                    //margin: EdgeInsets.all(20.0), // Insert margins of specified value to all 4 sides. Other Options are also available. Also Margin is used for outer side of the container.
                    //padding: EdgeInsets.all(10.0), // Similar as Margins But is used for inner side of container.
                    color: Colors.yellow,
                    child: Text("Container Col 1"),
                  ),
                  Container( // Container can only contain a single widget
                    width: 100.0,
                    height: 100.0,
                    //margin: EdgeInsets.all(20.0), // Insert margins of specified value to all 4 sides. Other Options are also available. Also Margin is used for outer side of the container.
                    //padding: EdgeInsets.all(10.0), // Similar as Margins But is used for inner side of container.
                    color: Colors.green,
                    child: Text("Container Col 2"),
                  ),
                ],
              ),
              Container( // Container can only contain a single widget
                width: 100.0,
                //margin: EdgeInsets.all(20.0), // Insert margins of specified value to all 4 sides. Other Options are also available. Also Margin is used for outer side of the container.
                //padding: EdgeInsets.all(10.0), // Similar as Margins But is used for inner side of container.
                color: Colors.blue,
                child: Text("Container 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }

   */
}

