import 'package:first_flutter/data/ApiService.dart';
import 'package:first_flutter/data/Repository.dart';
import 'package:first_flutter/data/model/NewsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  State createState() => NewsState();
}

class NewsState extends State<News> {
  List<NewsModel> newsList = <NewsModel>[];
  Repository repo = Repository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final Stream<NewsModel> stream = await repo.getNews();
    stream.listen((NewsModel news) => setState(() => newsList.add(news)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Highlight News",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(centerTitle: true, title: Text("Highlight News")),
          body: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => _itemNews(newsList[index]),
          )),
    );
  }

  Widget _itemNews(NewsModel news) {
    return Center(
      child: (news != null)
          ? Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(news.title),
                    subtitle: Text(news.author),
                  )
                ],
              ))
          : Text("End Of Line"),
    );
  }
}
