import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialFeed extends StatefulWidget {
  const SocialFeed({Key? key}) : super(key: key);

  @override
  _SocialFeedState createState() => _SocialFeedState();
}

class _SocialFeedState extends State<SocialFeed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          //backgroundColor: Colors.black26,
          backgroundColor: Colors.blueGrey[50],
          appBar: AppBar(
            backgroundColor: Colors.indigoAccent[100],
            elevation: 0,
            title: const Center(child: Text('Social Feed')),
            centerTitle: true,


          ),
          body: const Text("Social Feed Screen"),
          //bottomNavigationBar: const BottomNavBar(),
        ),
      ),
    );

  }
}