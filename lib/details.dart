import 'package:api/cart_controller.dart';
import 'package:api/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final String book;
  final String name;
  final String id;

  DetailsPage({
    Key key,
    this.book,
    this.name,
    this.id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MyControler c = Get.put(MyControler());
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text("DetailsPage")),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.network(widget.book),
              ),
            ),
            Text(widget.name),
            SizedBox(
              height: 70,
            ),
            Text("Books id: " + widget.id),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.white70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Books",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red),
                          child: IconButton(
                              onPressed: () => c.increment(),
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(() => Text(
                              "${c.books.toString()}",
                              style: TextStyle(fontSize: 15),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red),
                          child: IconButton(
                              onPressed: () => c.decrement(),
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.cyan,
                          ),
                          child: new SizedBox(
                            child: ElevatedButton(
                              child: Text('Add'),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
