
import 'package:app_noticias/src/models/category_model.dart';
import 'package:app_noticias/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

  final String _url_news ="http://newsapi.org/v2";
   final String _apiKey ="fde98e19e1e64bbb8683b37064b4b7f4";

class NewsService with ChangeNotifier{
//business entertainment general health science sports technology
  List<Article> hedlines=[];
  String _selectedCategory = "business";
  List<Category> categories=[
    Category(FontAwesomeIcons.building,"business"),
    Category(FontAwesomeIcons.gamepad,"entertainment"),
    Category(FontAwesomeIcons.genderless,"general"),
    Category(FontAwesomeIcons.headSideVirus,"health"),
    Category(FontAwesomeIcons.vial,"science"),
    Category(FontAwesomeIcons.futbol,"sports"),
    Category(FontAwesomeIcons.memory,"technology"),    
  ];

  Map<String, List<Article>> categoryArticles={};
  
  NewsService(){
    this.gtTopHedlines();
    categories.forEach((element) { 
      this.categoryArticles[element.name]= new List();

    });
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory (String valor){
    this._selectedCategory=valor;
    this.getarticlesByCategory(valor);
    notifyListeners();

  }

  gtTopHedlines()async {
      final url="$_url_news/top-headlines?apiKey=$_apiKey&country=Mx";
      final respuesta = await http.get(url);
      final newsResponse =  noticiaFromJson(respuesta.body);
      this.hedlines.addAll(newsResponse.articles);
      notifyListeners();

  }

  getarticlesByCategory(String category)async {

    if (this.categoryArticles[category].length>0){
      return this.categoryArticles[category];
    }

    final url="$_url_news/top-headlines?apiKey=$_apiKey&country=Mx&category=$category";
    final respuesta = await http.get(url);
    final newsResponse =  noticiaFromJson(respuesta.body);
    this.categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();
}
  }
  