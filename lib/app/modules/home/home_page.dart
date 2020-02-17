import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guestbook_mobile/app/modules/home/home_controller.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeControler = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             TextField(
               keyboardType: TextInputType.emailAddress,
               onChanged: homeControler.setLogin,
               decoration: InputDecoration(
                 labelText: "Login",
                 labelStyle: TextStyle(fontSize: 30, color: Colors.red)
               ),
             ),
             Observer(
               builder: (_)=> MaterialButton(
                minWidth: double.infinity,
                child: Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed:
                homeControler.login ?
                ()async =>{
                      await Navigator.pushNamed(context, "messages")
                    }
                :null,
                textColor: Colors.white,
                color: Colors.blue,
                disabledColor: Colors.grey,
              )
             )
           ],
           ),
         ),
    );
  }
}
