import 'package:app_noticias/src/services/news_services.dart';
import 'package:app_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    final newsService = Provider.of<NewsService>(context).hedlines;


    return Scaffold(
      body: ListaNoticias(
        newsService
      ),

    );
  }
}
