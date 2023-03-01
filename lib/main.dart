import 'package:books_api/models/buku_model.dart';
import 'package:books_api/pages/books/list_books.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD API Buku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListBookPage(Data()),
    );
  }
}
