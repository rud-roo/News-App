import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  static const String path = "DetailsScreen";
  const DetailScreen({ Key? key }) : super(key: key);

  Future launchUrl(url)async{
    if(await canLaunch(url)) {
      return launch(url);
    }else{
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map newsData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Home Screen",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.notification_important), 
            )
          ],
        ),
        drawer: Drawer(),

        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(newsData["title"]),
              SizedBox(height: 10,),
              Hero(
                tag: "tag1",
                child: Image.network(
                  newsData["urlToImage"],
                  height: 250,
                  width: double.infinity,
                )
              ),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(newsData["author"].toString()),
                  Text(newsData["publishedAt"]),
                ],
              ),

              SizedBox(height: 16,),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: newsData["description"],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                    TextSpan(
                      text: "more details",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()..onTap= (){
                        launchUrl(newsData['url']);
                      }
                    )
                  ]
                )
              )
            ],
          ),
        ),
    );
  }
}