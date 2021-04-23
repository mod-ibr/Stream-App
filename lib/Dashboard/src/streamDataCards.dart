import 'package:flutter/material.dart';

class StreamDataCard extends StatefulWidget {
  String label;
  int numbers;
  IconData statu;
  Color statuColor;

  StreamDataCard({this.label, this.statu, this.numbers, this.statuColor});

  @override
  _StreamDataCardState createState() => _StreamDataCardState();
}

class _StreamDataCardState extends State<StreamDataCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20 , right: 20 , bottom: 20),
      padding: EdgeInsets.all(20.0),
      height: 95.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: TextStyle(color: Colors.black26),
              ),
              Icon(
                widget.statu,
                color: widget.statuColor,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(widget.numbers.toString(), style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)
        ],
      ),
    );
  }
}
