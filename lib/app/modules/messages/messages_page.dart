import 'package:flutter/material.dart';
import 'package:guestbook_mobile/app/modules/messages/messages_controller.dart';

class MessagesPage extends StatefulWidget {
  final String title;
  const MessagesPage({Key key, this.title = "Messages"}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final messagesController = MessagesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: 
          FutureBuilder(
            future:  messagesController.getData(),
            builder: (context, snapshot){
              return ListView.builder(
                itemCount: messagesController.data.length,
                itemBuilder: (BuildContext, index){
                  return index < 10? ListTile(
                    subtitle: Text(messagesController.data[index]["email"]),
                    onTap: ()async =>{
                      await Navigator.pushNamed(context, "messages")
                    },
                    title: Text(messagesController.data[index]["name"])):null;
                }
                );
            },
          )
         ),
    );
  }
}
