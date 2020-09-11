import 'package:app_noticias/src/models/news_models.dart';
import 'package:app_noticias/src/theme/tema.dart';
import 'package:flutter/material.dart';


class ListaNoticias extends StatelessWidget {
  
  final List<Article> noticias;

  const ListaNoticias( this.noticias) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(        
          noticia: this.noticias[index],
          index: index,
        );
     },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({  @required this.noticia, 
                    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar     (noticia: this.noticia, index: this.index,),
        _TarjetaTitulo     (noticia: this.noticia),
        _TarjetaImagen     (noticia: this.noticia),
        _TarjetaDescripcion(noticia: this.noticia),
        _Botones(),
        SizedBox(height: 10,),
        Divider(),
      ],
    );
  }
}

class _Botones extends StatelessWidget {
  const _Botones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: miTema.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Icon(Icons.star_border),
          ),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Icon(Icons.airline_seat_flat),
          )
        ],
      ),
    );
  }
}

class _TarjetaDescripcion extends StatelessWidget {

    final Article noticia;

  const _TarjetaDescripcion({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text((noticia.description)!=null?noticia.description:""),
    );
  }
}






class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null)
          ?
            FadeInImage(
            image: NetworkImage(this.noticia.urlToImage),
            placeholder: AssetImage("assets/gifs/giphy.gif"),
            )
          :
          Image(image: AssetImage("assets/images/no-image.png"),)  
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
   final Article noticia; 

  const _TarjetaTitulo({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}




class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({this.noticia, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text("${this.index+1}.", style: TextStyle(color: miTema.accentColor),),
          Text("${this.noticia.source.name}.", style: TextStyle(color: miTema.accentColor),)
        ],
      ),
    );
  }
}