import 'package:flutter/material.dart';

import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as hp;

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Daftar Elektronik"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.smartphone), text: "SMARTPHONE"),
            Tab(icon: Icon(Icons.computer), text: "KOMPUTER"),
            Tab(icon: Icon(Icons.headset), text: "HEADSET"),
            Tab(icon: Icon(Icons.radio), text: "RADIO"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          hp.Smartphone(),
          komputer.Komputer(),
          headset.Headset(),
          radio.Radio(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.smartphone), text: "SMARTPHONE"),
            Tab(icon: Icon(Icons.computer), text: "KOMPUTER"),
            Tab(icon: Icon(Icons.headset), text: "HEADSET"),
            Tab(icon: Icon(Icons.radio), text: "RADIO"),
          ],
        ),
      ),
    );
  }
}
