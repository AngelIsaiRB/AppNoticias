import 'package:app_noticias/src/services/news_services.dart';
import 'package:app_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    
    final hedlines = Provider.of<NewsService>(context).hedlines;


    return Scaffold(
      body:(hedlines.length==0)
      ?Center(
        child: CircularProgressIndicator(),
      )
      : ListaNoticias( hedlines),

    );
  }

  @override
  
  bool get wantKeepAlive => true;
}
