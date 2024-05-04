import 'package:flutter/material.dart';
import 'DatabaseService.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _dbService = DatabaseService();
  List<dynamic> _data = [];
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
    var data = await _dbService.fetchData();
    if (data.isEmpty) {
      setState(() {
        _errorMessage = 'No data available';
      });
    } else {
      setState(() {
        _data = data;
        _errorMessage = 'Data loaded successfully!';
      });
    }
  } catch (e) {
    setState(() {
      _errorMessage = "Failed to load data: ${e.toString()}";
      _data = [];
    });
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
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
            title: Text(item['declarationTitle'] ?? 'No title available'),
            subtitle: Text(item['someOtherKey'] ?? 'No additional info'),  // Example additional data
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display Example'),
      ),
      body: _buildBody(),
    );
  }
}