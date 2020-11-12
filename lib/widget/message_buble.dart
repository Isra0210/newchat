import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String userName;
  final String userImage;
  final String message;
  final bool belongsToMe;

  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.belongsToMe, {
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: belongsToMe
                    ? Colors.grey[300]
                    : Colors.teal[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      belongsToMe ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      belongsToMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: belongsToMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: belongsToMe ? EdgeInsets.only(left: 8.0) : EdgeInsets.only(right: 8.0),
                    child: Text(
                      userName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: belongsToMe ? Colors.black : Colors.white,
                          fontSize: 11.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      message,
                      style: TextStyle(
                          color: belongsToMe ? Colors.black : Colors.white,
                          fontSize: 14.0),
                      textAlign: belongsToMe ? TextAlign.end : TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToMe ? null : 128,
          right: belongsToMe ? 128 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(this.userImage ??
                'https://www.diretoriodigital.com.br/wp-content/uploads/2013/05/765-default-avatar.png'),
          ),
        ),
      ],
    );
  }
}
