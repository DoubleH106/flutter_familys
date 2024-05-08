import 'package:familys/Controller/HomeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CommentScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<dynamic> Comments = [];
  List<dynamic> News = [];
  bool ShowComment = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await HomeController.News(1);
      setState(() {
        News = data;
      });
    } catch (e) {
      print('Error: fetchData $e');
    }
  }

  void likePost(int accId, int homeId) async {
    final data = await HomeController.likepost(accId, homeId);
  }

  void offlikepost(int accId, int homeId) async {
    final data = await HomeController.offlikepost(accId, homeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: News.length,
                  itemBuilder: (context, index) {
                    var item = News[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(item["avatarUser"]))),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["userName"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(item["create"]),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage(item["avatar"]),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          item["title"],
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (item["likepost"] == false)
                              GestureDetector(
                                onTap: () {
                                  likePost(1, item["homeId"]);
                                  setState(() {
                                    item["likepost"] = true;
                                  });
                                },
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors
                                      .grey, // IconData của biểu tượng trái tim
                                  size: 40, // Kích thước của biểu tượng
                                ),
                              ),
                            if (item["likepost"] == true)
                              GestureDetector(
                                onTap: () {
                                  offlikepost(1, item["homeId"]);
                                  setState(() {
                                    item["likepost"] = false;
                                  });
                                },
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors
                                      .red, // IconData của biểu tượng trái tim
                                  size: 40, // Kích thước của biểu tượng
                                ),
                              ),
                            const SizedBox(
                              width: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ShowComment = true;
                                });
                              },
                              child: const Icon(
                                Icons.comment,
                                color: Colors
                                    .grey, // IconData của biểu tượng trái tim
                                size: 40, // Kích thước của biểu tượng
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // const Icon(
                            //   Icons.share,
                            //   color:
                            //       Colors.grey, // IconData của biểu tượng trái tim
                            //   size: 40, // Kích thước của biểu tượng
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            if (ShowComment == true)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5), // Màu xám với độ trong suốt là 0.5
              ),
            ),
            if (ShowComment == true)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ShowComment = false;
                                  });
                                },
                                child: Icon(Icons.reply_all)),
                            const SizedBox(
                              width: 50,
                            ),
                            const Text("Chưa có bình luận nào."),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   height: 50,
                        // ),
                        const Column(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              size: 150,
                            ),
                            Text("Hãy là người đầu tiên bình luận."),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                child: TextField(
                                  // onTap: () {
                                  //   FocusScope.of(context).requestFocus(FocusNode()); // Yêu cầu focus khi người dùng nhấp vào TextField
                                  // },
                                  decoration: const InputDecoration(
                                      hintText: 'Viết bình luận...'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
