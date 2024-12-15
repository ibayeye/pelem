import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kelompok3/pagelogin.dart';
import '../widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      'PELEM',
                      style: GoogleFonts.bebasNeue(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent[700]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                        'Sebuah Aplikasi Fetching API FILM dari tmdb.org',
                        style: GoogleFonts.outfit(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Dibangun oleh Kelompok 3 Kelas 221 PC UNIVERSITAS TEKNOLOGI BANDUNG',
                      style:
                          GoogleFonts.outfit(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[700],
                      fixedSize: const Size(350, 50),
                    ),
                    child: Text(
                      'Mulai',
                      style: GoogleFonts.outfit(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
