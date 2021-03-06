import 'package:app_noticias/src/pages/tab1_page.dart';
import 'package:app_noticias/src/pages/tab2_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _NavegacionModel(),
        child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);
    

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i)=> navegacionModel.paginaActual=i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text("para ti")),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text("Encabezados"))
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
     controller: navegacionModel.pagecontroller,
     physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {

  int _paginaActual = 0;
  PageController _pageController= new PageController(initialPage: 0);

  int get paginaActual=>this._paginaActual;

  PageController get pagecontroller=>_pageController;

  set paginaActual(int valor){
    this._paginaActual=valor;
    this._pageController.animateToPage(valor, duration: Duration(milliseconds: 100), curve: Curves.easeInOutSine);
    notifyListeners();
  }


}














