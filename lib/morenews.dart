import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:html/parser.dart';


class morenews extends StatefulWidget {
  final String text;
  final String img;
  morenews({Key key, @required this.text, this.img}) : super(key: key);
  @override
  _morenewsState createState() => _morenewsState();
}

class _morenewsState extends State<morenews> {
  var b="male";
  void fun1(var a){
    setState(() {
      b=a;

    });
  }

  bool _val= false;
  bool _val1= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        centerTitle: true,
        title: Text("Ditail News " ,style: TextStyle(color: Colors.black)),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(15.0)),
                alignment: Alignment.center,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network("${widget.img}"),

                        )
                      ],
                    ),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: [
                                Text("${widget.text}"),
                              ],
                            ),
                          ),

                        )

                      ],

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(value: "male", groupValue: b, onChanged: (v){fun1(v);},activeColor: Colors.green,),
                        Radio(value:"female" , groupValue: b, onChanged: (v){fun1(v);},activeColor: Colors.yellow),
                        Radio(value: "other", groupValue: b, onChanged: (v){fun1(v);},activeColor: Colors.red),

                        Checkbox(value: _val,activeColor: Colors.green,checkColor: Colors.yellow,hoverColor: Colors.red, onChanged: (val){
                          setState(() {
                            _val=val;

                          });
                        },),
                        Checkbox(value: _val1, onChanged: (val){
                          setState(() {
                            _val1=val;

                          });
                        },),

                      ],
                    ),

                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
