import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'morenews.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// feilds
  String url;
  var response;
  var data;
  bool isLoading = true;

// future method -> api data -> response -> decode
  Future fetchData() async {
    url = "http://www.thenationaldawn.in/wp-json/custom/all_news";
    response = await http.post(url);

    setState(() {
      data = json.decode(response.body);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          centerTitle: true,
          title:Text("News")
      ),

      body: isLoading == true
          ? Center(child: CircularProgressIndicator(strokeWidth: 5.0,))
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return /*ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text(data[index]['slug']),
                );*/
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> morenews(text: "${data[index]['content']}",img: "${data[index]['featured_img_src']}",)));
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        // height: 105,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0) ),
                        child: Row(

                          children: [
                            Column(

                              children: [
                                data[index]['featured_img_src']!=null?Container(
                                  child: Image.network(data[index]['featured_img_src'],fit: BoxFit.fill,),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10.0)),
                                  margin: EdgeInsets.only(right: 10),

                                ):Container(),
                              ],
                            ),
                            Expanded(
                              child: Column(

                                children: [
                                  Text(data[index]['title'],style: TextStyle(fontSize: 20),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                ],

                              ),
                            ),
                          ],
                        )

                    ),
                  );

              },
            ),
    );
  }
}
