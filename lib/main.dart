import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:api/details.dart';
import 'package:api/model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Page(),
    );
  }
}

Future booklist;
var book = new List<Book>();

class Page extends StatefulWidget {
  const Page({Key key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  List items = [
    'https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg',
    'https://images-cdn.reedsy.com/discovery/post/109/featured_image/large_aa7b8fcc4ee3a86626aca3157bbd8d697c38429a.jpg'
  ];
  var imagepath;

  Future getpic() async {
    var response =
        await http.get(Uri.http('103.69.126.198:8080', 'odata/Product'));
    var jsonData = jsonDecode(response.body);

    jsonData["value"].forEach((blogPost) async {
      var model = Book();
      model = Book.fromjson(blogPost);
      if (imagepath == null) {
        imagepath = await http.get(Uri.http(
            '103.69.126.198:8080', 'odata/Product/GetImagePath/' + model.id));
        print(imagepath);
      }
      var a = json.decode(imagepath.body);
      model.imagePath = a["value"];
      print(model.imagePath);
      if (this.mounted) {
        setState(() {
          book.add(model);
        });
      }
    });

    return book;
  }

  @override
  void initState() {
    booklist = getpic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books Store'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: new Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                // height: 200.0,
                width: double.infinity,
                child: CarouselSlider(
                  items: items
                      .map((image) => Builder(builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.fill)),
                            );
                          }))
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    autoPlay: true,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'All Books ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,

                      itemCount: 1,
                      separatorBuilder: (context, i) => SizedBox(
                        width: 12,
                      ),

                      itemBuilder: (context, i) => buildCard(),

                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard({ Book item}) => Container(
                        width: 600,
    child: Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: booklist,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(child: Text('Loading')),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Card(
                              child: InkWell(
                                child: Image.network(
                                    'http://103.69.126.198:8080' +
                                        snapshot.data[i].imagePath),

                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      book:  'http://103.69.126.198:8080' +
                                          snapshot.data[i].imagePath,

                                      name: snapshot.data[i].name,
                                      id: snapshot.data[i].id,

                                 ),
                                  ),
                                ),
                              ),


                            //Text(snapshot.data[i].id),

                        );
                      });
                }
              }),
        )
      ],
    ));
