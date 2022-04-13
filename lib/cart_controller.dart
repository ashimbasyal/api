import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{
  int _counter= 0;
  int get counter => _counter;

  double _totalPrice= 0.0;
  double get totalPrice => _totalPrice;

  
  
  void _setPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("cart_item", _counter);
    prefs.setDouble("total_price", _totalPrice);
    notifyListeners();
  }

  void _getPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt("cart_item");
    _totalPrice = prefs.getDouble("total_price");
    notifyListeners();
  }



  void addTotalPrice (double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPreferences();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPreferences();
    notifyListeners();
  }

  double getTotalPrice () {
    _getPreferences();
    return _totalPrice;

  }


  void addCounter () {
    _counter++;
    _setPreferences();
    notifyListeners();
}

  void removeCounter () {
    _counter--;
    _setPreferences();
    notifyListeners();
  }

  int getCounter () {
    _getPreferences();
    return _counter;

  }




}