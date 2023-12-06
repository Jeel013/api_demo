import 'dart:convert';

import 'package:api_demo/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic> users = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aefcdesdca"),
      ),
     body: ListView.builder(
       itemCount: users.length,
       itemBuilder: (context, index) {
         final user = users[index];
         final employename = user['employee_name'];
       return ListTile(title: Text(employename),);
     },),
     floatingActionButton: FloatingActionButton(
       onPressed: featchUsers,
       backgroundColor: Colors.pink,
     ),
      // body: Consumer<AppProvider>(
      //   builder: (context, provider, child) =>
      //       Column(
      //         children: [
      //           ElevatedButton(onPressed: (){
      //             provider.loadUserList();
      //           }, child: Text("load")),
      //         Container(
      //           height: 300,
      //           width:  300,
      //           color: Colors.pinkAccent,
      //           child: ListView.builder(
      //               itemCount: provider.current.length,
      //               itemBuilder: (context, index) => Text("dsgrs")),
      //         )
      //         ],
      //       ),
      // ),
    );

  }

Future<void> featchUsers() async {
  String weatherapi =
      "https://pixabay.com/api/?key=36932518-7b086ea9d2a30297567dc52eb&q=yellow+flowers&image_type=photo";
  http.Response response = await http.get(Uri.parse(weatherapi));

  if (response.statusCode == 200) {
    var users = jsonDecode(response.body);

    var currentweatherdata = await users;
    print(response.body);
    print(users);
    return currentweatherdata;
  }

}
}

