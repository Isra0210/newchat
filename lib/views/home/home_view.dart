import 'package:chat/views/gif/gif_view.dart';
import 'package:chat/widget/message.dart';
import 'package:chat/widget/newMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: TextStyle(fontSize: 25.0),
        ),
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Sair'),
                      ],
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'gif',
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Gif'),
                      ],
                    ),
                  ),
                )
              ],
              onChanged: (String value) {
                if (value == 'logout') {
                  FirebaseAuth.instance.signOut();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GifView(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
