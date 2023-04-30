import 'package:class_bookui_app/view/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant_widgets.dart';
import '../model/book_data.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  List<String> tabList = [
    'All',
    'Recommended',
    'Popular',
    'Books',
    'MyBook',
    'favourite',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xF1F5F9),
        title: const Text(
          'Hi Jhon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              color: Colors.black,
            ),
          ),
        ],
      ),

      //! appbar complete
      body: Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: ListView(
          children: [
            heightGap,
            //!banner image
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxpYnJhcnklMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //! Creating tablist
            heightGap,
            Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: Text(
                      tabList[index],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),

            //! creating booklist ui
            const BookListUi(),

            //! creating Text
            heightGap,
            const Padding(
              padding: EdgeInsets.only(
                left: 15.0,
              ),
              child: Text(
                'You may also like',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            //! creating related books
            const RelatedBookUi(),
          ],
        ),
      ),
    );
  }
}

class BookListUi extends StatelessWidget {
  const BookListUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      // color: Colors.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: booksList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(
                () => DetailsPage(
                  book: booksList[index],
                ),
              );
            },
            child: Container(
              width: 340,
              // color: Colors.red,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: 340,
                      padding: const EdgeInsets.all(10.0),
                      // color: Colors.green,
                      child: Row(
                        children: [
                          Spacer(),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180,
                                  // width: 320,
                                  // color: Colors.yellow,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        booksList[index].title,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        booksList[index].discription,
                                        maxLines: 4,
                                        textAlign: TextAlign.justify,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            booksList[index].rating,
                                          ),
                                          Container(
                                            width: 60,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                booksList[index].gernal,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Container(
                      width: 120,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            booksList[index].imgUrl,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RelatedBookUi extends StatelessWidget {
  const RelatedBookUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 270,
      // color: Colors.blue,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: booksList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(
                DetailsPage(
                  book: booksList[index],
                ),
              );
            },
            child: Container(
              width: 150,
              height: 200,
              // color: Colors.red,
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 150,
                        height: 200,
                        child: Image(
                          image: NetworkImage(
                            booksList[index].imgUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              booksList[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            booksList[index].gernal,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
