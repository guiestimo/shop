import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toogleFavorite(String token, String userId) async {
    isFavorite = !isFavorite;
    notifyListeners();

    final response = await http.put(
      Uri.parse(
          "${Constants.BASE_API_URL}/userFavorites/$userId/$id.json?auth=$token"),
      body: json.encode(isFavorite),
    );

    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();

      throw Exception("Erro ao marcar favorito!");
    }
  }
}
