
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _fireStore = FirebaseFirestore.instance;
late User loggedUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String messageText;

  final messageController = TextEditingController();
  late final bool isMe;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessageStream() async {
  //   await for (var snapshot in _fireStore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // getMessageStream();

                _auth.signOut();
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {

                        messageText = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageController.clear();
                      _fireStore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedUser.email,
                        'timestamp': Timestamp.now(),
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleMessage extends StatelessWidget {
  BubbleMessage({required this.sender, required this.text ,this.isMe});

  final String text;
  final String sender;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe!? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(color: Colors.black54, fontSize: 12.0),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe!? BorderRadius.only(topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0) , bottomRight: Radius.circular(30.0)): BorderRadius.only(topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0) , bottomRight: Radius.circular(30.0)),
            color: isMe!? Colors.lightBlueAccent: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe!? Colors.white: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MessageStream extends StatelessWidget {

  // Stream builder builds the widgets again when new stream of data comes from firebase. It takes two arguments.
  //stream takes the instance of snapshot of a required collection
  //and builder takes a method which requires a context and snapshot.

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('messages').orderBy('timestamp' ,descending :true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data?.docs;
          List<BubbleMessage> messageBubblesList = [];

          for (var message in messages!) {
            final messageText = (message.data() as dynamic)['text'];
            final messageSender = (message.data() as dynamic)['sender'];

            final currentUser = loggedUser.email;


            // final messageText = message.get(FieldPath(const ['text']));
            // final messageSender =  message.get(FieldPath(const ['sender']));
            // print(messageText);
            final messageBubble =
            BubbleMessage(sender: messageSender, text: messageText ,isMe: messageSender==currentUser, );
            messageBubblesList.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: messageBubblesList,
            ),
          );
        });
  }
}

