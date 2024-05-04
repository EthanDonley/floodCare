import 'package:flutter/material.dart';
import 'package:flutter_playground/mainmenu/flood_map_page.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
        backgroundColor: Colors.transparent, // For a consistent look with the gradient background
        elevation: 0, // Removes the shadow under the AppBar
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
            menuButton(context, "Take a Stand", Page2()),
            menuButton(context, "Prepare", Page3()),
            menuButton(context, "Current Events", Page4())
            // More buttons can be added here
          ],
        ),
      ),
    );
  }

  Widget menuButton(BuildContext context, String title, Widget page) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),  // Vertical spacing between buttons
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,  // Text color
          textStyle: TextStyle(fontSize: 20),
          padding: EdgeInsets.symmetric(vertical: 20),  // Padding inside the button
          minimumSize: Size(double.infinity, 50)  // Full width buttons with fixed height
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
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 3")),
      body: Center(child: Text("This is Page 3")),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 4")),
      body: Center(child: Text("This is Page 4")),
    );
  }
}
