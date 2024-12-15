import 'package:flutter/material.dart';

class Backbtn extends StatelessWidget {
  const Backbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(
        color: Color(0xff3d3c3a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    );
  }
}
