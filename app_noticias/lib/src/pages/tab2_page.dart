import 'package:app_noticias/src/models/category_model.dart';
import 'package:app_noticias/src/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(child: _ListaCategorias()),
            ],
          ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final cname = categories[index].name;
        return Container(
          width: 110,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _Categorybutton(category: categories[index]),
                SizedBox(height: 5,),
                 Text("${cname[0].toUpperCase()}${cname.substring(1)}")
              ],
            ),
          ),
        );
     },
    );
  }
}

class _Categorybutton extends StatelessWidget {

  final Category category;
  
  const _Categorybutton({this.category});
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final newsService = Provider.of<NewsService>(context, listen: false); 
        newsService.selectedCategory=category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(category.icon, color: Colors.black54,),     
      ),
    );
  }
}