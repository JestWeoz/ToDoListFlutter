import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class Card_body extends StatelessWidget {
  var item;
  var index;
  Card_body(
      {Key? key,
      required this.item,
      required this.handelDelete,
      required this.index})
      : super(key: key);
  final Function handelDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: (index % 2 == 0) ? Color(0xFFDFDFDF) : Color(0xFF58EEDA),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. ${item.name}",
              style: TextStyle(
                fontSize: 23,
                color: Color(0xFF4b4b4b),
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  return handelDelete(item.id);
                }
                return;
              },
              child: Icon(
                Icons.delete_outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
