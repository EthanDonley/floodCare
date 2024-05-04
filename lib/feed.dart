import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'rss_parse.dart';  // Assuming this file contains the fetchRssFeed function with proper error handling.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS Feed Reader',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RSS Feed Reader'),
        ),
        body: FeedList(),
      ),
    );
  }
}

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  late Future<RssFeed> _feedFuture;

  @override
  void initState() {
    super.initState();
    _feedFuture = fetchRssFeed('https://water.ca.gov/News/News-Releases');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RssFeed>(
      future: _feedFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else if (snapshot.hasData) {
          return buildFeedList(snapshot.data!);
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }

Widget buildFeedList(RssFeed data) {
    var items = data.items;
    if (items == null || items.isEmpty) {
      return Center(child: Text('No items found'));
    }

    return ListView(
      children: items.map((item) => ListTile(
        title: Text(item.title ?? 'No title'),  // Safe handling of null titles.
        subtitle: Text(item.description ?? 'No description'),  // Corrected handling of description.
      )).toList(),
    );
}

}
