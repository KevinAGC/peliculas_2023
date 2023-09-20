import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    //Obtener el tamaño de pantalla
    final size = MediaQuery.of(context).size;
    return SizedBox(
      //El contenedor sera el ancho de pantalla
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        //guion bajo: no se usa
        itemBuilder: (_, int index) {
          return GestureDetector(
              onTap: () => Navigator.pushNamed(
                    context,
                    'details',
                    arguments: (),
                  ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage("https://via.placeholder.com/300x400")),
              ));
        },
      ),
    );
  }
}
