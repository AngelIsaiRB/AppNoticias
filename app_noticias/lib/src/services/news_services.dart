
import 'package:app_noticias/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  final String _url_news ="http://newsapi.org/v2";
   final String _apiKey ="fde98e19e1e64bbb8683b37064b4b7f4";

class NewsService with ChangeNotifier{

  List<Article> hedlines=[];

  
  NewsService(){
    this.gtTopHedlines();
  }


  gtTopHedlines()async {
      final url="$_url_news/top-headlines?apiKey=$_apiKey&country=Mx";
      final respuesta = await http.get(url);
      final newsResponse =  noticiaFromJson(respuesta.body);
      this.hedlines.addAll(newsResponse.articles);
      notifyListeners();

  }

}