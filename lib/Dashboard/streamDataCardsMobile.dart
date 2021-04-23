import 'package:flutter/material.dart';

class StreamDataCardMobile extends StatefulWidget {
  String label;
  int numbers;
  IconData statu;
  Color statuColor;

  StreamDataCardMobile({this.label, this.statu, this.numbers, this.statuColor});

  @override
  _StreamDataCardMobileState createState() => _StreamDataCardMobileState();
}

class _StreamDataCardMobileState extends State<StreamDataCardMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 10, bottom: 10),
      padding: EdgeInsets.only(left: 19,right: 19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.label,
            style: TextStyle(color: Colors.black26),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.numbers.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Icon(
                widget.statu,
                color: widget.statuColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
