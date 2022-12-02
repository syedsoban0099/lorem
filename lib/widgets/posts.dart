import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart'as http;

class posts extends StatefulWidget {
  const posts({super.key});

  @override
  State<posts> createState() => _postsState();
}
class _postsState extends State<posts> {
 
  Future<List<dynamic>> fetchUsers() async {
    var url= "https://jsonplaceholder.typicode.com/posts";
    
    var result = await http.get(Uri.parse(url));
    var Data =json.decode(result.body);
    // print(Data);
    return  Data;
  }

  String _title(dynamic user){
    return user['title'].toString();

  }

  String _body(dynamic user){
    return user['body'].toString();
  }

 



  @override
 
 
  Widget build(BuildContext context) {
          return Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print(_body(snapshot.data[0]));
              return ListView.builder(
                  // padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                            
                              title: Text(_title(snapshot.data[index])),
                              subtitle: Text(_body(snapshot.data[index])),
                            
                            )
                          ],
                        ),
                      );
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      );
         
        

  }
}
class userpost{

  var title;
  var body;
  userpost(this.title,this.body);
}