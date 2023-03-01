import 'package:books_api/models/buku_model.dart';
import 'package:books_api/pages/books/details_book.dart';
import 'package:books_api/pages/books/create_book.dart';
import 'package:books_api/pages/books/update_book.dart';
import 'package:books_api/services/books_service.dart';
import 'package:flutter/material.dart';

class ListBookPage extends StatefulWidget {
  ListBookPage(this.cases);
  Data cases;

  @override
  State<ListBookPage> createState() => _ListBookPageState();
}

class _ListBookPageState extends State<ListBookPage> {
  BukuModel? _bukuModel;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    BukuModel data = await BookService().getListBook();
    print("data ${data}");
    setState(() {
      _bukuModel = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        title: const Text("CRUD API Buku"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FormAddBook();
                }),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print("ini id ke ${_bukuModel!.data![index].id}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailBook(detailBook: _bukuModel?.data![index]),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Expanded(
                            child: Text(
                              _bukuModel!.data![index].title.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Hapus Data'),
                                  content: const Text(
                                      'Yakin untuk menghapus data buku?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        print(
                                            "cancel dihapus ${_bukuModel!.data![index].id}");
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await BookService().deleteBook(
                                            _bukuModel!.data![index].id ?? 0);
                                        Navigator.pop(context, 'OK');
                                        print(
                                            "id ini dihapus ${_bukuModel!.data![index].id}");
                                        await getData();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FormUpdateBook(
                                            cases: widget.cases)));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _bukuModel!.data?.length,
            ),
    );
  }

  // _navigateToEditScreen (BuildContext context, Data cases) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => FormUpdateBook(cases)),
  //   );
  // }

}
