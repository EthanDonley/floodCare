import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_playground/bottom_nav_bar.dart';

class OfficialsPage extends StatelessWidget {
  const OfficialsPage({Key? key}) : super(key: key);

  // Utility method to launch URLs
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Officials"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "San Joaquin County Board of Officials",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Meeting Times",
                    style: TextStyle(fontSize: 18, color: Colors.lightBlue.shade900, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Tuesdays, 9:00 AM",
                    style: TextStyle(fontSize: 16, color: Colors.lightBlue.shade400),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 18, color: Colors.lightBlue.shade900, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "44 North San Joaquin Street Sixth Floor, Suite 627 Stockton, CA 95202",
                    style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "E-Mail:",
                    style: TextStyle(fontSize: 16, color: Colors.lightBlue.shade900, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => _launchURL('mailto:allboardmembers@sjgov.org'),
                    child: Text(
                      "allboardmembers@sjgov.org",
                      style: TextStyle(fontSize: 16, color: Colors.lightBlue, decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "URL",
                    style: TextStyle(fontSize: 18, color: Colors.lightBlue.shade900, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => _launchURL('https://www.sjgov.org/department/bos/contact-us'),
                    child: Text(
                      "https://www.sjgov.org/department/bos/contact-us",
                      style: TextStyle(fontSize: 16, color: Colors.lightBlue, decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}