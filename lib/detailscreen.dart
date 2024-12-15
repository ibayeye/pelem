import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kelompok3/constants.dart';
import 'package:uas_kelompok3/widgets/backbtn.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    this.film,
  });

  final film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const Backbtn(),
            backgroundColor: Colors.black,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                film.title,
                style: GoogleFonts.outfit(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
                child: Image.network(
                  '${Constans.imagePath}${film.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.outfit(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    film.overView,
                    style:
                        GoogleFonts.outfit(fontSize: 22, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                'Release Date: ',
                                style: GoogleFonts.outfit(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Text(
                                film.releaseDate,
                                style: GoogleFonts.outfit(
                                    fontSize: 14, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rating: ',
                                style: GoogleFonts.outfit(
                                    fontSize: 14, color: Colors.white),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '${film.voteAverage.toStringAsFixed(1)}/10',
                                style: GoogleFonts.outfit(
                                    fontSize: 14, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
