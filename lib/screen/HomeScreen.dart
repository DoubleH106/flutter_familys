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
  List<dynamic> Commentsssss = [];
  List<dynamic> News = [];
  bool ShowComment = false;
  bool send = false;
  String NameUser = "";
  String Avatars ="";
  String cmt="";
  var idpost = 0;
  TextEditingController commentsController = TextEditingController();
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

  void listComments(int homeId) async {
    final data1 = await HomeController.listComments(0, homeId, "");
   try{
     setState(() {
       Commentsssss = data1;
       // NameUser = data['acc'];
       // Avatars = data['avatars'];
     });
   }catch(e) {
     print('Error: fetchData $e');
   }

  }

  void offlikepost(int accId, int homeId) async {
    final data = await HomeController.offlikepost(accId, homeId);
  }

  void sendcomment() async {
    String _comments = commentsController.text;
    final data = await HomeController.addcomment(1, idpost, _comments);
    if (data["status"] == true) {
      commentsController.text = "";
    } else {
      commentsController.text = "";
    }
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
                    // Comments = item['listComment'];
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
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item["title"],
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
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
                                listComments(item['homeId']);
                                setState(() {
                                  ShowComment = true;
                                  idpost = item['homeId'];
                                  // print('Id bài viết $idpost');
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
                  color: Colors.grey
                      .withOpacity(0.5), // Màu xám với độ trong suốt là 0.5
                ),
              ),
            if (ShowComment == true)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ShowComment = false;
                                    });
                                  },
                                  child: const Icon(Icons.reply_all)),

                              const SizedBox(
                                width: 50,
                              ),
                              if (Commentsssss.length > 0)
                              Text('Có ${Commentsssss.length} bình luận',style: TextStyle(fontSize: 20),),
                              if (Commentsssss.length ==0)
                                const Text("Chưa có bình luận nào.",style: TextStyle(fontSize: 20),),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        if (Commentsssss.length ==0)
                          const Column(
                            children: [
                              Icon(
                                Icons.comment_outlined,
                                size: 150,
                              ),
                              Text("Hãy là người đầu tiên bình luận."),
                            ],
                          ),
                        if (Commentsssss.length > 0)
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height:100,
                            child: ListView.builder(
                              shrinkWrap: true,
                                itemCount: Commentsssss.length ,
                                itemBuilder: (context, index) {
                                  var item = Commentsssss[index];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(item['avatars']))),
                                          ),
                                          SizedBox(width: 20,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(item['acc'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                              Text(item['comments'],style: TextStyle(fontSize: 20))
                                            ],
                                          ),
                                          Text('Trả lời'),
                                        ],
                                      ),
                                      SizedBox(height:20),
                                    ],
                                  );
                                },),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: TextFormField(
                                            onChanged: (text) {
                                              if (text != "") {
                                                setState(() {
                                                  send = true;
                                                });
                                              } else {
                                                setState(() {
                                                  send = false;
                                                });
                                              }
                                            },
                                            controller: commentsController,
                                            style:
                                                TextStyle(color: Colors.black),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'Viết bình luận...',
                                              errorStyle: TextStyle(
                                                  color: Colors.black),
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                              hintStyle: TextStyle(
                                                  color: Colors.black),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (send == true)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: GestureDetector(
                                              // Cần Sửa
                                              onTap: () {
                                                sendcomment();
                                              },
                                              child: const Icon(Icons.send,
                                                  color: Colors.green)),
                                        ),
                                      if (send == false)
                                        const Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Icon(Icons.send,
                                              color: Colors.white),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
