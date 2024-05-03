import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FemaApiService _apiService = FemaApiService();
  List<dynamic> _data = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      var data = await _apiService.fetchData();
      setState(() {
        // Remove the assignment of `data` to `_data`
        // _data = data;
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
    } else if (_errorMessage.isNotEmpty) {
      return Center(child: Text(_errorMessage));
    } else if (_data.isEmpty) {
      return Center(child: Text('No data fetched. Press the button to load data.'));
    } else {
      return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index].toString()),
          );
        },
      );
    }
  }
}
