import 'package:flutter/material.dart';

class ActorSlider extends StatelessWidget {
  const ActorSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * .3,
      color: const Color.fromARGB(255, 255, 255, 165),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Actores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, int index) => _ActorPoster(),
          ))
        ],
      ),
    );
  }
}

class _ActorPoster extends StatelessWidget {
  const _ActorPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(children: [
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpeg'),
              image: AssetImage('assets/no-image.jpeg'),
              width: 130,
              height: 145,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Id ut ullamco non quis aliqua nulla duis.',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
