import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood/fastfood/core/models/food/food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fastfood/fastfood/core/models/user/user.dart';

import '../../../../firebase_options.dart';

class FoodRequest {
  static Stream<List<Food>> search(String searchValue) => FirebaseFirestore
      .instance
      .collection('Food')
      .snapshots()
      .map((food) => food.docs
          .map((e) => Food.fromJson(e.data()))
          .where((food) =>
              food.Name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList());
}
