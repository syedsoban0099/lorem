import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lorem/widgets/posts.dart';
import 'package:lorem/widgets/profile.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _profilesState();
}

class _profilesState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       appBar: AppBar(
          title: const Text("Lorem ipsum"),
          actions: <Widget>[
           
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ),
          ], 
          
          elevation: 50.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
          bottom: TabBar(
          tabs: [
            Tab(text: "ALL POSTS",),
             Tab(text: "PROFILES",),
          ],
        ),
           
        ),
        body: TabBarView(
        children: [
          posts(),

        
         profile()
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
      ),
    );
  }
}