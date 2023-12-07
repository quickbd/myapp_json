import 'package:flutter/material.dart';
import 'package:myapp_json/add_user.dart';
import 'package:myapp_json/user_list.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON DATA', style: TextStyle(
            fontSize: 25.0,
        ),),

        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  ElevatedButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUser())) ;
                  }, child: Text('Add User')),
              SizedBox(height: 10.0,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList())) ;
              }, child: Text('User List'))
            ],
          ),
        ),
      ),
    );
  }
}
