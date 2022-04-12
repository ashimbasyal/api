import 'package:api/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MyControler c = Get.put(MyControler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Books",
                  style: TextStyle(fontSize: 30, color: Colors.cyan),
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Total',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
