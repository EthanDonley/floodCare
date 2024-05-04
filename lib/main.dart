import 'package:flutter/material.dart';
import 'DatabaseService.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'maikapage.dart'; // Ensure this file is created with necessary contents
import 'appbar.dart';

void main() { 
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DatabaseService _dbService = DatabaseService();
  List<dynamic> _data = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _selectedPage = 'Home'; 

  @override
  void initState() {
    super.initState();
    _fetchData(); // Optionally load data on start-up
  }

   void _navigateToPage(String? page) {
    if (page == 'Other Page' && _selectedPage != 'Other Page') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MaikaPage()));
    }
    setState(() {
      _selectedPage = page!;
    });

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(currentPage: _selectedPage, onSelectPage: _navigateToPage),
          body: _buildBody(),
          // other properties...
        ),
      );
    }
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      var data = await _dbService.fetchData();
      if (data.isEmpty) {
        setState(() {
          _errorMessage = 'No data available.';
        });
      } else {
        setState(() {
          _data = data.map((item) => item['declarationTitle']).toList();
          _errorMessage = 'Data loaded successfully!';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to load data: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OpenFEMA Data'),
          actions: <Widget>[
            DropdownButton<String>(
              value: _selectedPage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPage = newValue!;
                });
                _navigateToPage(newValue);
              },
              items: <String>['Home', 'Other Page']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: _fetchData,
          tooltip: 'Fetch Data',
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      return Center(child: Text(_errorMessage));
    } else if (_data.isEmpty) {
      return Center(child: Text('No data to display.'));
    } else {
      return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          var item = _data[index];
          return ListTile(
            title: Text(item['declarationTitle'] ?? 'No title available'),
          );
        },
      );
    }
  }
}