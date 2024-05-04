import 'package:flutter/material.dart';
import 'DatabaseService.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


void main() {
  // Initialize sqflite for FFI
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

  void _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      var data = await _dbService.fetchData();
      setState(() {
        _data = data.map((item) => item['declarationTitle']).toList();
        _errorMessage = 'Data loaded successfully!';
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
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
        appBar: AppBar(title: Text('OpenFEMA Data')),
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
    } else if (_errorMessage.isNotEmpty && _data.isEmpty) {
      return Center(child: Text(_errorMessage));
    } else {
      return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          var item = _data[index];
          return ListTile(
            title: Text(item['declarationTitle'] ?? 'No title available'),  // Adjusted to correct key based on JSON
          );
        },
      );
    }
  }
}
