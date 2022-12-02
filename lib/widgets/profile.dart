import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart'as http;

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}
var i=3;

class _profileState extends State<profile> {
  get isSelected => null;

  

 Future<List<dynamic>> fetchprofile() async {
    var url= "https://jsonplaceholder.typicode.com/users";
    
    var result = await http.get(Uri.parse(url));
    var Data =json.decode(result.body);
    // print(Data);
    return  Data;
  }

  String _name(dynamic user){
    return user['name'].toString();

  }

  String _username(dynamic user){
    return user['username'].toString();
  }

 String _address(dynamic user){
    return user['address']['street']+""+user['address']['suite'].toString();
  }
   String _zippcode(dynamic user){
    return user['address']['zipcode'].toString();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchprofile(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print(_name(snapshot.data[0]));
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    
                  
                    children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text("NAME",style: TextStyle(fontWeight: FontWeight.bold ),),Text(_name(snapshot.data[i])),
                  ],)
            
                  ,Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text("USERNAME",style: TextStyle(fontWeight: FontWeight.bold ),),Text(_username(snapshot.data[i])),
                  ],)
                  ,
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text("ADDRESS",style: TextStyle(fontWeight: FontWeight.bold ),),
                        // height: MediaQuery.of(context).size.height,
                        
                      Text(_address(snapshot.data[i])),
                    ],),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text("ZIPCODE",style: TextStyle(fontWeight: FontWeight.bold ),),Text(_zippcode(snapshot.data[i])),
                  ],)
                  
                  ],),
                )
                );
              
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      );
  }
}