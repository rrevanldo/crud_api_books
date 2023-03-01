import 'package:books_api/models/buku_model.dart';
import 'package:books_api/services/books_service.dart';
import 'package:flutter/material.dart';

class FormUpdateBook extends StatefulWidget {
  final Data cases;
  const FormUpdateBook({super.key, required this.cases});

  @override
  _FormUpdateBookState createState() => _FormUpdateBookState();
}

class _FormUpdateBookState extends State<FormUpdateBook> {
  final BookService api = BookService();
  final _addFormKey = GlobalKey<FormState>();
  int id = 0;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    TextEditingController descriptionController =
        TextEditingController(text: widget.cases.description);
    TextEditingController titleController =
        TextEditingController(text: widget.cases.title);
    // id = widget.cases.id!;
    // titleController.text = widget.cases.title!;
    // descriptionController.text = widget.cases.description!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Books'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Title'),
                              TextFormField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Title',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter title';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  // titleController.text = value;
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              const Text('Description'),
                              TextFormField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  hintText: 'Description',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter description';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  // descriptionController.text = value;
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                // splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.updateBook(
                                        id,
                                        Data(
                                            title: titleController.text,
                                            description:
                                                descriptionController.text));
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                                // child: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
