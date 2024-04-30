import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
            child: ListView(shrinkWrap: true, children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("huong.jpg"))),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nguyễn Quang Hướng",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage("huong.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Một buổi chiều thật Chill",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Nguyễn Quang Huowsng");
                          },
                          child: const Icon(
                            Icons.favorite,
                            color:
                                Colors.grey, // IconData của biểu tượng trái tim
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
                    )

                  ],
                ),
              ),
              SizedBox(height: 50,),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("huong.jpg"))),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nguyễn Quang Hướng",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage("huong.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Một buổi chiều thật Chill",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Nguyễn Quang Huowsng");
                          },
                          child: const Icon(
                            Icons.favorite,
                            color:
                            Colors.grey, // IconData của biểu tượng trái tim
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
                    )

                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
