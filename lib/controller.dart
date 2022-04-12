import 'package:get/get.dart';

class MyControler extends GetxController {
  var books = 0.obs;

  increment() {
    books.value++;
  }

  decrement() {
    if (books.value <= 0) {
      Get.snackbar("Buying Books", "can't be less than 0");
    } else {
      books.value--;
    }
  }
}
