import 'package:flutter/material.dart';

final List<String> movieImages = [
  'assets/aadc.jpg',
  'assets/koboy_kampus.jpg',
  'assets/3_hus.jpg',
  'assets/janji_joni.jpg',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasar Film',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Layout',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Sedang Tayang',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          NowPlayingSwiper(movieImages: movieImages),
          const MovieSection(title: 'Trending'),
          HorizontalMovieList(
            movieImages: movieImages.sublist(1),
            itemHeight: 180,
          ),

          const MovieSection(title: 'Populer'),
          HorizontalMovieList(
            movieImages: movieImages.sublist(0),
            itemHeight: 180,
          ),

          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.red),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NowPlayingSwiper extends StatelessWidget {
  final List<String> movieImages;

  const NowPlayingSwiper({super.key, required this.movieImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8, initialPage: 1),
        itemCount: movieImages.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedBuilder(
            animation: PageController(initialPage: 1),
            builder: (context, child) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(movieImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ada Apa Dengan Cinta 3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(blurRadius: 5.0, color: Colors.black),
                            ],
                          ),
                        ),
                        Text(
                          'Romance, Drama, Comedy',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                            shadows: const [
                              Shadow(blurRadius: 5.0, color: Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MovieSection extends StatelessWidget {
  final String title;

  const MovieSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalMovieList extends StatelessWidget {
  final List<String> movieImages;
  final double itemHeight;

  const HorizontalMovieList({
    super.key,
    required this.movieImages,
    required this.itemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16.0 : 8.0,
              right: index == movieImages.length - 1 ? 16.0 : 0,
            ),
            child: SizedBox(
              width: 100,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(movieImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
