import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kelompok3/pagelogin.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _register() async {
    final user = (await _auth.createUserWithEmailAndPassword(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: const Image(
                        image: AssetImage('assets/logo-pelem.png'),
                        width: 80,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 10, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => const LoginPage()));
                          },
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.outfit(
                                fontSize: 22, color: Colors.redAccent[700]),
                          ),
                        ))
                  ],
                )),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
                  child: Expanded(
                    child: SizedBox(
                      width: 400,
                      child: Text(
                          'Film dan acara TV tak terbatas,\n & banyak lagi!',
                          style: GoogleFonts.outfit(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.start),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Expanded(
                    child: SizedBox(
                      width: 400,
                      child: Text(
                          'Dapatkan akses eksklusif dan rekomendasi film khusus! Yuk, buat akun sekarang dan mulailah perjalanan filmmu.',
                          style: GoogleFonts.outfit(
                              fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.start),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.outfit(
                        fontSize: 24, color: Colors.white, height: 1),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      fillColor: const Color(0xff3d3c3a),
                      filled: true,
                      labelText: 'Email',
                      labelStyle:
                          GoogleFonts.outfit(fontSize: 18, color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                    ),
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
                  onPressed: () async {
                    _register();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'Buat Akun',
                    style:
                        GoogleFonts.outfit(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
