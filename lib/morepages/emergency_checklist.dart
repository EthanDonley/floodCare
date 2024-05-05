import 'package:flutter/material.dart';
import 'package:flutter_playground/bottom_nav_bar.dart';
import 'package:flutter_playground/homepage/title_section.dart';
import 'package:flutter_playground/homepage/wave_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyPreparationPage extends StatefulWidget {
  @override
  _EmergencyPreparationPageState createState() => _EmergencyPreparationPageState();
}

class _EmergencyPreparationPageState extends State<EmergencyPreparationPage> {
  late SharedPreferences _prefs;
  Map<String, bool> _checklistItems = {};  // Initialize as empty

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }


  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadChecklistItems();
  }

  void _loadChecklistItems() {
    setState(() {
      _checklistItems = {
        'Emergency Contact': _prefs.getBool('Emergency Contact') ?? false,
        'Household Evacuation Plan': _prefs.getBool('Household Evacuation Plan') ?? false,
        'First Aid Kit': _prefs.getBool('First Aid Kit') ?? false,
        'Medications (people and pets)': _prefs.getBool('Medications (people and pets)') ?? false,
        'Canned/dried/packaged food': _prefs.getBool('Canned/dried/packaged food') ?? false,
        'Manual can opener': _prefs.getBool('Manual can opener') ?? false,
        'Portable battery-powered radio': _prefs.getBool('Portable battery-powered radio') ?? false,
        'Flashlight': _prefs.getBool('Flashlight') ?? false,
        'Batteries': _prefs.getBool('Batteries') ?? false,
        'Cellphone': _prefs.getBool('Cellphone') ?? false,
        'Personal hygiene products': _prefs.getBool('Personal hygiene products') ?? false,
        'At least 50 in small bills': _prefs.getBool('At least 50 in small bills') ?? false,
        'Important documents': _prefs.getBool('Important documents') ?? false,
        'Wrench and pliers': _prefs.getBool('Wrench and pliers') ?? false,
        'Waterproof matches': _prefs.getBool('Waterproof matches') ?? false,
        'Gallons of water': _prefs.getBool('Gallons of water') ?? false,
      };
    });
  }

  void _toggleChecklistItem(String item) {
    setState(() {
      _checklistItems[item] = !_checklistItems[item]!;
    });
    _prefs.setBool(item, _checklistItems[item]!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Preparation'),
        backgroundColor: Colors.white,
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
          ),
        ),
        child: Column(
          children: [
            WaveHeader(),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListView(
                  children: _checklistItems.entries.map((entry) {
                    return CheckboxListTile(
                      title: Text(
                        entry.key,
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: entry.value,
                      onChanged: (value) {
                        _toggleChecklistItem(entry.key);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}
