import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_xp/domain/entities/todo.dart';

class FirebaseConsumer {
  static Future<bool> create(Map<String, dynamic> todo) async {
    final db = FirebaseFirestore.instance;
    await db.collection("tasks").doc(todo["id"]).set(todo);
    return true;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("tasks").get();
    return querySnapshot.docs.map((task) => task.data()).toList();
  }

  static Future<bool> edit(Map<String, dynamic> todo) async {
    final db = FirebaseFirestore.instance;
    await db.collection("tasks").doc(todo["id"]).set(todo);
    return true;
  }

  static Future<bool> delete(Todo todo) async {
    final db = FirebaseFirestore.instance;
    await db.collection("tasks").doc(todo.id).delete();
    return true;
  }
}
