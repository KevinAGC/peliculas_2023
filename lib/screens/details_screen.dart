import 'package:flutter/material.dart';
import 'package:peliculas_2023/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Recibir argumentos de otra pantalla
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
          //Widget con comportamientos predefinidos al  hacer scroll
          slivers: [
            _CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                _PosterAndTitle(),
                _Overview(),
                ActorSlider(),
              ]),
            ),
          ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //Widfget para que se ajuste al tamaño
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text('movie.title'),
        ),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: AssetImage('assets/no-image.jpeg'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpeg'),
                image: AssetImage('assets/no-image.jpeg'),
                height: 250,
              ),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'movie.title',
                    style: TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    'movie.titleOriginal',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        size: 15,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'movie.voteAverage',
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //consultor con nombre (en flutter todos son consultores)
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text(
          'Tempor officia ex exercitation dolor aute enim tempor quis culpa eu ut elit exercitation. Et veniam deserunt aliquip ipsum adipisicing ea nulla ullamco eiusmod elit culpa ullamco et. Laboris et sint in consequat fugiat ea. Fugiat eiusmod commodo consequat mollit consectetur incididunt. Consequat dolor fugiat magna ipsum sint laboris ea.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 15),
        ));
  }
}
