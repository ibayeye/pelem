import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kelompok3/pagelogin.dart';
import 'package:uas_kelompok3/widgets/toprated_widget.dart';
import 'package:uas_kelompok3/widgets/trending_widget.dart';
import 'package:uas_kelompok3/widgets/upcoming_widget.dart';

import 'api/api.dart';
import 'models/movies.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovie;
  late Future<List<Movies>> upComingMovies;

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingWidget();
    topRatedMovie = Api().getTopRatedMovie();
    upComingMovies = Api().getUpComingWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => const LoginPage()));
                },
                child: Icon(
                  Icons.logout_outlined,
                  color: Colors.redAccent[700],
                  size: 38,
                ),
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/logo-pelem.png',
          fit: BoxFit.cover,
          height: 40,
          width: 120,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.outfit(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingWidget(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Top Rated Movies',
                style: GoogleFonts.outfit(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 18),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TopRatedMovie(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Upcoming Movies',
                style: GoogleFonts.outfit(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 18),
              SizedBox(
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return UpComingWidget(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
