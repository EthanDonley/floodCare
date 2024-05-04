import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset('assets/flood_care_logo.png'),  // Ensure you have this logo in your assets
            ),
            Text(
              'CONTACTING EMERGENCY RESCUE SERVICES...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('209-468-6818'),
              subtitle: Text('San Joaquin County Emergency Medical Services'),
              onTap: () => launch('tel:209-468-6818'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text('505 W. Service Road, Benton Hall, Room 47'),
              subtitle: Text('French Camp, CA 95231'),
            ),
            ListTile(
              leading: Icon(Icons.map, color: Colors.blue),
              title: Text('San Joaquin County Evacuation Maps'),
              onTap: () => launch('https://sjmap.org/evacmaps/'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {}, // Define navigation logic
                ),
                IconButton(
                  icon: Icon(Icons.warning),
                  onPressed: () {}, // Define navigation logic
                ),
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {}, // Define navigation logic
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
