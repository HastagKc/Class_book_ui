import 'package:class_bookui_app/constant/constant_widgets.dart';
import 'package:class_bookui_app/model/book_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final Book book;

  DetailsPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                      book.imgUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          heightGap,
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.rating),
                      Text(
                        book.gernal,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Text(
                book.discription,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(
                      150,
                      50,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Read Book'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Read Book',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
