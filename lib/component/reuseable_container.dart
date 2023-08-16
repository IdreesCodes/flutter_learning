import 'package:flutter/material.dart';

class Button extends StatefulWidget {
   Button({super.key, this.title, this.bgColor, this.textColor, required this.callBack});
  var title;
  var bgColor;
  var textColor;
  final Function callBack;



  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> widget.callBack(widget.title),
      child: Container(

        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.bgColor,
        ),
        child:  Center(child: Text(widget.title.toString(), style: TextStyle(color: widget.textColor, fontSize: 28),)),
      ),
    );

  }
}
