import 'package:books_api/models/buku_model.dart';
import 'package:books_api/services/books_service.dart';
import 'package:flutter/material.dart';

class DetailBook extends StatefulWidget {
  Data? detailBook;
  DetailBook({
    super.key,
    required this.detailBook,
  });
  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Book'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        height: 100,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.detailBook!.title.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            //  SizedBox(height: 10,),
            Expanded(
              child: Text(
                widget.detailBook!.description.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
