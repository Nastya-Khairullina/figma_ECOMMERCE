import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/product_entity.dart';

class CartItem {
  final ProductEntity product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: ProductEntity.fromJson(json['product']),
      quantity: json['quantity'] ?? 1,
    );
  }
}

class CartDataProvider extends ChangeNotifier {
  static List<ProductEntity> items = [];
  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;
  int get count => _cartItems.length;

  CartDataProvider() {
    loadCart();
  }
  void add(ProductEntity product) {
    final existingItemIndex = _cartItems.indexWhere((item) => item.product.id == product.id);

    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity++;
      print('Увеличиваем количество: ${_cartItems[existingItemIndex].quantity}');
    } else {
      _cartItems.add(CartItem(product: product, quantity: 1));
      print('Добавляем новый продукт: ${product.title}');
    }

    notifyListeners();
    saveCart();
  }

  Future<void> saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItemsString = _cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cart_items', cartItemsString);
    print('Корзина сохранена: $cartItemsString');
  }

  Future<void> loadCart() async {
    try {
      print('loadCart был вызван.');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? cartItemsString = prefs.getStringList('cart_items');

      if (cartItemsString != null && cartItemsString.isNotEmpty) {
        _cartItems = cartItemsString.map((item) => CartItem.fromJson(jsonDecode(item))).toList();
        print('Загруженные элементы: $_cartItems');
        notifyListeners();
      } else {
        print('Корзина пуста или данные не найдены.');
      }
    } catch (e) {
      print('Ошибка при загрузке корзины: $e');
    }
  }
  void deleteItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      items.remove(_cartItems[index].product);
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _cartItems.clear();
    items.clear();
    notifyListeners();
  }

  void decrement(CartItem product) {
    int index = _cartItems.indexWhere((item) => item.product.id == product.product.id);
    if (index != -1) {
      _cartItems[index].quantity--;
      print('Уменьшаем количество: ${_cartItems[index].quantity}');

      if (_cartItems[index].quantity <= 0) {
        _cartItems.removeAt(index);
        items.remove(product);
        print('${product.product.title} удалён из корзины.');
      }

      notifyListeners();
    }
  }

  String calculateTotalCartValue() {
    double total = 0.0;

    if (_cartItems.isEmpty) {
      print('Корзина пуста.');
      return total.toStringAsFixed(2);
    }
    for (var cartItem in _cartItems) {
      double pricePerUnit = 0.0;

      if (cartItem.product.price != null && cartItem.product.price!.isNotEmpty) {
        try {
          String cleanedPrice = cartItem.product.price!
              .replaceAll('\$', '')
              .replaceAll(',', '');
          pricePerUnit = double.parse(cleanedPrice);
        } catch (e) {
          print('Ошибка при парсинге цены: ${cartItem.product.price}');
          pricePerUnit = 0.0;
        }
      } else {
        print('Цена товара недоступна или равна ноль: ${cartItem.product.title}');
      }

      total += pricePerUnit * cartItem.quantity;
    }
    return total.toStringAsFixed(2);
  }
}