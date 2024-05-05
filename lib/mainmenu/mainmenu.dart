import 'package:flutter/material.dart';
import 'package:flutter_playground/bottom_nav_bar.dart';
import 'package:flutter_playground/mainmenu/current_events.dart';
import 'package:flutter_playground/mainmenu/flood_map_page.dart';
import 'package:flutter_playground/morepages/emergency_checklist.dart';
import 'package:flutter_playground/morepages/officials_page.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
        backgroundColor: Colors.transparent, 
        elevation: 0, 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade400,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: ListView(
          children: <Widget>[
            menuButton(context, "View my Flood Map", Page1()),
            menuButton(context, "Take a Stand", OfficialsPage()),
            menuButton(context, "Prepare", EmergencyPreparationPage()),
            menuButton(context, "Current Events", CurrentEventsPage())
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooter(),
    );
  }

  Widget menuButton(BuildContext context, String title, Widget page) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue, 
          textStyle: TextStyle(fontSize: 20),
          padding: EdgeInsets.symmetric(vertical: 20), 
          minimumSize: Size(double.infinity, 50)  
        ),
        child: Text(title),
      ),
    );
  }
}


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: Center(child: Text("This is Page 2")),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 3")),
      body: Center(child: Text("This is Page 3")),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 4")),
      body: Center(child: Text("This is Page 4")),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}
