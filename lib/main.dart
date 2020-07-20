import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String urlToImage;
  Future<List<Article>> newslist;

  Future<List<Article>> fetchArticle() async {
    var url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2e8e3846c42a4f64a6b1d98370bdeeea';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Article> listArticle = data["articles"].map<Article>((article) {
        return Article.fromJson(article);
      }).toList();
      return listArticle;
    } else {
      throw Exception('Failed to load Article');
    }
  }

  @override
  void initState() {
    super.initState();
    newslist = fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api calls',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Api Calls'),
        ),
        body: FutureBuilder<List<Article>>(
          future: newslist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Container();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Image.network(snapshot.data[index].urlToImage);
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}

class Article {
  final String author;
  final String title;
  final String description;
  final String publishedAt;
  final String urlToImage;
  final String url;

  Article(
      {this.author,
      this.description,
      this.title,
      this.publishedAt,
      this.urlToImage,
      this.url});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        publishedAt: json['publishedAt'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}
