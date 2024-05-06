import 'package:familys/Controller/HomeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<dynamic> Comments = [];
  List<dynamic> News = [];
  late String avatar = "";
  late String title = "";
  late bool showLike = false;
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
    setState(() {
      showLike = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
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
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if(item["likepost"] == false)
                        GestureDetector(
                          onTap: () {
                            likePost(1, item["homeId"]);
                          },
                          child: const Icon(
                            Icons.favorite,
                            color:
                                Colors.grey, // IconData của biểu tượng trái tim
                            size: 40, // Kích thước của biểu tượng
                          ),
                        ),
                        if(item["likepost"] == true)
                          GestureDetector(
                            onTap: () {
                              // likePost(1, item["homeId"]);
                            },
                            child: const Icon(
                              Icons.favorite,
                              color:
                              Colors.red, // IconData của biểu tượng trái tim
                              size: 40, // Kích thước của biểu tượng
                            ),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.comment,
                          color:
                              Colors.grey, // IconData của biểu tượng trái tim
                          size: 40, // Kích thước của biểu tượng
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.share,
                          color:
                              Colors.grey, // IconData của biểu tượng trái tim
                          size: 40, // Kích thước của biểu tượng
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
