import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      // width: _screenSize.width * 0.7,
      // width: double.infinity,
      // height: _screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          // peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
          peliculas[index].uniqueId = UniqueKey().toString();
          return Hero(
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detalle',
                      arguments: peliculas[index]),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    fit: BoxFit.cover,
                  ),
                )
                /*Image.network(
                "http://via.placeholder.com/350x150",
                fit: BoxFit.cover,
              ),*/
                ),
          );
        },
        itemCount: peliculas.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
