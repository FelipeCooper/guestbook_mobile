import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Messages"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = null;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
        headers: {"Accept": "application/json"});
    data = json.decode(response.body);
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
          child: 
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot){
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext, index){
                  return index < 10? ListTile(
                    subtitle: Text(data[index]["email"]),
                    onTap: ()async =>{
                      await Navigator.pushNamed(context, "messages")
                    },
                    title: Text(data[index]["name"])):null;
                }
                );
            },
          )
         ),
    );
  }
}
