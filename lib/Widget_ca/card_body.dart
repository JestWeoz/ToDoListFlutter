import 'package:flutter/material.dart';

class Card_body extends StatelessWidget {
  const Card_body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color(0xFFDFDFDF),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Làm Bài Tập về nhà!",
              style: TextStyle(
                fontSize: 23,
                color: Color(0xFF4b4b4b),
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.delete_outline,
            ),
          ],
        ),
      ),
    );
  }
}
