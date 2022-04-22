// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import './bottombar.dart';
import './cookies.dart';
import './othercontent.dart';
import './home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designing',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Design'),
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {},
            ),
          ],
          elevation: 30,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 6, 107, 165),
                  Color.fromARGB(255, 13, 143, 160)
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            controller: controller,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Profile",
              ),
              Tab(
                icon: Icon(Icons.cookie),
                text: "Cookies",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              )
            ],
          ),
        ),
    
        body: Container(
         
          width: double.infinity,
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            children: [
             HomePage(),
             Content(),
             Cookies(),
             Content(),
            ]
          ),
         
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
