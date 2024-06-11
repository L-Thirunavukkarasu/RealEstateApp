import 'package:flutter/material.dart';
import 'package:realestate/screens/chat.dart';
import 'package:realestate/screens/favourite.dart';
import 'package:realestate/screens/home.dart';
import 'package:realestate/screens/profile.dart';
import 'package:realestate/screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        primaryColor: Colors.orangeAccent,
        secondaryHeaderColor:Colors.black,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home:

          const MyHomePage(title: 'Real Estate App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  //tabs redirections
  int currentIndexVal = 2;
  final tabs = [
    Center(child:SearchScreen()),
    Center(child:ChatScreen()),
    Center(child:HomeScreen()),
    Center(child:FavouriteScreen()),
    Center(child:ProfileScreen())
  ];
  //animation
  late AnimationController controller;
  late Animation<Offset> bottomOffsetAnim;
  //animation - init state
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));

    //bottom navigation bar animation
    bottomOffsetAnim = Tween(begin: const Offset(0, 1), end: Offset.zero)
        .animate(controller);
    controller.forward();


  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: SlideTransition(
        position:bottomOffsetAnim,
        child:Container(
        margin:EdgeInsets.only(left:50,right:50,bottom:30,top:10),
        height:60,
        decoration: BoxDecoration(
          color: Color(0xff222126),
          borderRadius: BorderRadius.circular(30),
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: currentIndexVal == 0 ? Colors.orangeAccent : Color(0xff1b1a1f),
              child: IconButton(
                enableFeedback: false,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,

                ),
                onPressed: () {
                  setState(() {
                    currentIndexVal = 0;
                  });
                },
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: currentIndexVal == 1 ? Colors.orangeAccent : Color(0xff1b1a1f),
              child: IconButton(
                enableFeedback: false,
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    currentIndexVal = 1;
                  });
                },
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: currentIndexVal == 2 ? Colors.orangeAccent : Color(0xff1b1a1f),
              child: IconButton(
                enableFeedback: false,
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    currentIndexVal = 2;
                  });
                },
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: currentIndexVal == 3 ? Colors.orangeAccent : Color(0xff1b1a1f),
              child: IconButton(
                enableFeedback: false,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    currentIndexVal = 3;
                  });
                },
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: currentIndexVal == 4 ? Colors.orangeAccent : Color(0xff1b1a1f),
              child: IconButton(
                enableFeedback: false,
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    currentIndexVal = 4;
                  });
                },
              ),
            ),

          ],
        )
      ),
      ),

      body: tabs[currentIndexVal]
    );
  }
}
