import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  //animation
  late AnimationController controller;
  late final Animation<double> fadeAnimation,fadeOutAnimation;
  late Animation<Offset> bottomSlideAnim;

  //animation - init state
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    fadeOutAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInBack);

    bottomSlideAnim = Tween(begin: const Offset(0, 1), end: Offset.zero)
        .animate(controller);
    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        //
        // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
        // action in the IDE, or press "p" in the console), to see the
        // wireframe for each widget.
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(15.0),
              child: Row(children: [
                FadeTransition(
                    opacity:fadeAnimation,
                    child:
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        IconButton(
                          enableFeedback: false,
                          icon: Icon(
                            Icons.location_pin,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Saint Petersburg',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight:
                                FontWeight.w600, //but instead of 300 it's 350
                          ),
                        ),
                      ],
                    )),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  backgroundColor: Colors.transparent,
                )
              ])),
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      FadeTransition(
                      opacity:fadeAnimation,
                       child:  Text('Hi, Marina',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                      ),
                    FadeTransition(
                      opacity:fadeAnimation,
                      child:
                      SlideTransition(
                        position:bottomSlideAnim,
                      child: Text('let${"'"}s select your \nperfect place',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))
                    ),
                    )
                      ],
                    )),
                SizedBox(height: 15),
                Container(
                  height: width / 2,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      FadeTransition(
                      opacity:fadeOutAnimation,
                      child:

                      CircleAvatar(
                            radius: width / 5,
                            backgroundColor: Colors.orangeAccent,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('BUY',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white60)),
                                  SizedBox(height: 30),
                                  Text('1034',
                                      style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      )),
                                  Text('offers',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white60)),
                                ])),
                      ),
                  FadeTransition(
                      opacity:fadeOutAnimation,
                      child:
                        Container(
                            margin:
                                EdgeInsets.only(left: 15, top: 15, bottom: 15),
                            padding: EdgeInsets.all(15.0),
                            height: width / 2,
                            width: width / 2.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('RENT',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                SizedBox(height: 30),
                                Text('2212',
                                    style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    )),
                                Text('offers',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ],
                            )),
    )
                      ]),
                  ),

                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: width / 1.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/home_1.webp')),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),

                          Positioned(
                            bottom: 15,
                            width: width / 1.2,
                            height: 50,
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                              FadeTransition(
                              opacity:fadeOutAnimation,
                              child:
                                Container(
                                    width: width / 1.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Gladkova St., 25",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                                Positioned(
                                  width: 50,
                                  height: 50,
                                  child: Stack(
                                    children: [
                                    FadeTransition(
                                    opacity:fadeOutAnimation,
                                    child:
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          enableFeedback: false,
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.grey,
                                            size: 15,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [

                          Expanded(
                              flex: 1,
                              child: Stack(
                                  alignment: Alignment.center,
                                  children:[
                                  Container(
                                height: width/1.1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/home_2.webp')),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                              ),
                                    Positioned(
                                      bottom: 15,
                                      width: width / 2.6,
                                      height: 50,
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                              width: width / 2.6,
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(30)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Gubina St., 11",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              )),
                                          Positioned(
                                            width: 50,
                                            height: 50,
                                            child: Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: 50,
                                                  backgroundColor: Colors.white,
                                                  child: IconButton(
                                                    enableFeedback: false,
                                                    icon: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.grey,
                                                      size: 15,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                          ]
                          )
                          ),

                          SizedBox(width: 15),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                Stack(
                                alignment: Alignment.center,
                                children:[
                                  Container(
                                    height: (width/1.1 / 2) - 7.5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/home_3.jpeg')),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    width: width / 2.6,
                                    height: 50,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                            width: width / 2.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Trefoleva St., 43",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        Positioned(
                                          width: 50,
                                          height: 50,
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 50,
                                                backgroundColor: Colors.white,
                                                child: IconButton(
                                                  enableFeedback: false,
                                                  icon: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                  ]
                ),
                                  SizedBox(height: 15),
                              Stack(
                                alignment: Alignment.center,
                                children:[
                                  Container(
                                    height: (width/1.1 / 2) - 7.5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/home_4.webp')),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    width: width / 2.6,
                                    height: 50,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                            width: width / 2.6,
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Sedova St., 25",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        Positioned(
                                          width: 50,
                                          height: 50,
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 50,
                                                backgroundColor: Colors.white,
                                                child: IconButton(
                                                  enableFeedback: false,
                                                  icon: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  ],
                                ),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: width / 1.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/home_5.webp')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        width: width / 1.2,
                        height: 50,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                                width: width / 1.2,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Gorokhovaya St., 3",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              width: 50,
                              height: 50,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      enableFeedback: false,
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ],
                  ),
                    ],
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
