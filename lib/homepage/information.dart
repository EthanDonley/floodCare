import 'package:flutter/material.dart';
import 'package:flutter_playground/bottom_nav_bar.dart'; // Assuming you have a reusable bottom navigation bar widget

class FloodInformationPage extends StatelessWidget {
  const FloodInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Information'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Understanding Flood Risks',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Floods are one of the most common hazards in the United States. Flood effects can be local, impacting a neighborhood or community, or very large, affecting entire river basins and multiple states.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text(
              'Before a Flood',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'To prepare for a flood, you should:\n\n'
              '- Build an emergency kit and make a family communications plan.\n'
              '- Avoid building in a floodplain unless you elevate and reinforce your home.\n'
              '- Elevate the furnace, water heater, and electric panel in your home if you live in an area that has a high flood risk.\n'
              '- Consider installing "check valves" to prevent flood water from backing up into the drains of your home.\n'
              '- Contact community officials to find out if they are planning to construct barriers (levees, beams, floodwalls) to stop floodwater from entering the homes in your area.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text(
              'During a Flood',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If a flood is likely in your area, you should:\n\n'
              '- Listen to the radio or television for information.\n'
              '- Be aware that flash flooding can occur. If there is any possibility of a flash flood, move immediately to higher ground.\n'
              '- Be aware of streams, drainage channels, canyons, and other areas known to flood suddenly.\n'
              '- If you need to evacuate, secure your home. If you have time, bring in outdoor furniture and move essential items to an upper floor.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooter(), // Ensure this is correctly imported and exists
    );
  }
}
