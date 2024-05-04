import 'package:flutter/material.dart';
import 'DatabaseService.dart';
import 'weatherservice.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _weatherService = WeatherService();
  dynamic _data;  // Changed from List<dynamic> to dynamic to handle both Map and List types
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
  setState(() {
    _isLoading = true;
    _errorMessage = '';
  });

  try {
    var data = await _weatherService.fetchRiverDischargeData();
    setState(() {
      // If data contains a key that holds the list, access it directly
      _data = data['river_discharge'];  // Assuming 'river_discharge' is the key where the list of data is stored
      _errorMessage = 'Data loaded successfully!';
    });
  } catch (e) {
    setState(() {
      _errorMessage = e.toString();
      _data = [];
    });
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('River Discharge Data'),
      ),
      body: _buildBody(),
    );
  }

  
  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      return Center(child: Text(_errorMessage));
    } else if (_data == null || _data.isEmpty) {
      return Center(child: Text('No data to display.'));
    } else {
      return ListView.builder(
        itemCount: _data.length,  // This assumes _data is a List
        itemBuilder: (context, index) {
          var item = _data[index];
          return ListTile(
            title: Text('Date: ${item['date']} - Discharge: ${item['discharge']} m³/s'),  // Adjust keys according to actual data structure
          );
        },
      );
    }
  }
}