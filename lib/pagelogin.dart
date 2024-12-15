import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kelompok3/mainpage.dart';
import 'package:uas_kelompok3/pageregister.dart';
import 'package:uas_kelompok3/welcomepage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _signIn() async {
    final user = (await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passController.text))
        .user;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                SafeArea(
                    child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const WelcomePage())));
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    const Image(
                      image: AssetImage('assets/logo-pelem.png'),
                      width: 80,
                    )
                  ],
                )),
                const SizedBox(
                  height: 75,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _emailController,
                    style: GoogleFonts.outfit(
                        fontSize: 24, color: Colors.white, height: 1),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        fillColor: const Color(0xff3d3c3a),
                        filled: true,
                        labelText: 'Email atau nomor telepon',
                        labelStyle: GoogleFonts.outfit(
                            fontSize: 18, color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _passController,
                    obscureText: true,
                    style: GoogleFonts.outfit(
                        fontSize: 24, color: Colors.white, height: 1),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        fillColor: const Color(0xff3d3c3a),
                        filled: true,
                        labelText: 'Sandi',
                        labelStyle: GoogleFonts.outfit(
                            fontSize: 18, color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(width: 2.0, color: Color(0xff3d3c3a)),
                      fixedSize: const Size(350, 50)),
                  onPressed: () {
                    _signIn();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  },
                  child: Text(
                    'Masuk',
                    style:
                        GoogleFonts.outfit(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: Text('Ingin mencoba Pelem? Daftar sekarang.',
                      style: GoogleFonts.outfit(color: Colors.grey)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
