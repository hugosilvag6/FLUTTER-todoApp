import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseConsumer {
  static Future<bool> create(Map<String, dynamic> todo) async {
    final db = FirebaseFirestore.instance;
    db.collection("tasks").doc(todo["id"]).set(todo);
    return true;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("tasks").get();
    return querySnapshot.docs.map((task) => task.data()).toList();
  }

  static Future<bool> edit(Map<String, dynamic> todo) async {
    return true;
  }
}
