import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/details.dart';

class All extends StatefulWidget {
  static const String path = "All";
  const All({ Key? key }) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {

  final String url = "https://newsapi.org/v2/everything?q=tesla&from=2021-12-09&sortBy=publishedAt&apiKey=0c07a773adc541689d67c095581be915";
  List allNews = [];

  Future getAllNews() async{
    final response = await http.get(Uri.parse(url));
    Map _allNews = {};

    if(response.statusCode == 200){
      _allNews = jsonDecode(response.body);
      setState(() {
        allNews = _allNews['articles'];
      });
    }
  }

  String getAuthor(author){
    if(author != null){
      return author;
    }
    else{
      return 'Unknown Resource';
    }
  }

  String getImage(urlToImage){
    if(urlToImage != null){
      return urlToImage;
    }
    else{
      return 'No Image to Show';
    }
  }

  @override
  void initState() {
    getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: allNews.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 10,
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, DetailScreen.path, arguments: allNews[index]);
              },
              isThreeLine: true,
              title: Text(allNews[index]["title"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getAuthor(allNews[index]["author"])),
                  Text(allNews[index]["publishedAt"]),
                ],
              ),
              trailing: Hero(
                tag: "tag1",
                child: Image.network(
                  getImage(allNews[index]["urlToImage"],),
                  height: 100,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              )
              
            ),
          );
        },
      ),
    );
  }
}