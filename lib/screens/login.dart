import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:lorem/screens/home.dart';
import 'package:http/http.dart'as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
 TextEditingController email= TextEditingController();
   TextEditingController Password=TextEditingController();

   void getlogin()async{
    // var data=[];
       
     var response=await http.get(Uri.http("jsonplaceholder.typicode.com","users"));
     var jsondata=jsonDecode(response.body);
      
      
     
    
     for (var i in jsondata) {
      usermodel data1=usermodel(i['name'], i['username']);
      // data.add(data1);
       
     }
      //  print(data);
       
   }
  

  //  void loginFunc(email,password) async {
  //     Map data = {
  //      'name': email,
  //     'username': password,
      
  //   };
     

  //    String body = json.decode(data.toString());
  //    print(body);
    
  //   Response response =
  //       await post(Uri.parse('https://jsonplaceholder.typicode.com/users'),
  //        body: 
  //     body
  //     );
    

  
  //   print(response.body);
  //   if (response.statusCode == 400) {
      
     
  //     print('login successful');
  //     setState(() {
  //       Navigator.pushReplacement(context,
  //                                       MaterialPageRoute(builder:
  //                                                         (context) => 
  //                                                         home()
  //                                                        ));
  //     });
  //   } else {
      
  //     print('not login');
  //     setState(() {
  //       error();
  //     });
  //   } 
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  
                  children: [
                     Container(
                      width: 100,
                      height: 100,
                       child: (
              
                        Image.asset("assets/1.jpeg")),
                     )
                    ,
                    SizedBox(
                      height: 20,)
                    ,
                Container(
                      height: 50,
                       child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if(value!.isEmpty){
                          return"username cant be empty";
                          }
                          return null;
                        },
                    
                  decoration:InputDecoration(
                    labelText: "User Name",
                    hintText: "Enter Your User Name ",
                    
                       
                           border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                    
                  )
                 ),
                     )
                 ,
                 SizedBox(
                  height: 10,
                ), Container(
                                  height: 50,
                child:
                  TextFormField(
                    controller: Password,
                    obscureText: true,
                    decoration:InputDecoration(
                   
                          suffixIconColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused)) {
                    return Colors.green;
                  }
                  if (states.contains(MaterialState.error)) {
                    return Colors.red;
                  }
                  return Colors.grey;
                          }),
                      labelText: "Password",
                      hintText: "Enter Your User Password ",
                      suffix: Icon(Icons.remove_red_eye_outlined),
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                      
                      
                    )
                   ),
                   
                
                ),
                 SizedBox(
                  height: 20,
                ),
                Container(
                      height: 50,
                      width:400 ,
                 child: ElevatedButton(onPressed:(){
                  Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          home()
                                                         ));
                 }
                // {
                //   // loginFunc(email.text.toString()
                //   , Password.text.toString());
                 
                   , child: Text("LOGIN"),
                   
                   style: ElevatedButton.styleFrom(
                    
                
                  shape:RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(30)
                  ),
                   )
                   ),
                )
                           
              
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void error(){
     showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("ERROR"),
                actions: <Widget>[
                  FloatingActionButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
   }
}


class usermodel{
  var name;
  var username;
  usermodel(this.name,this.username);




}