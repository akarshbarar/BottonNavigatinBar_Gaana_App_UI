import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gaana Demo",
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        accentColor: Colors.black26,
      ),
      home: Main(),
    );
  }
}
class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int id=0;
  @override
  Widget build(BuildContext context) {

    final tabpages=<Widget>[
      Center(child: Icon(Icons.home,size: 60.0,color: Colors.red,),),
      Center(child: Icon(Icons.map,size: 60.0,color: Colors.red,),),
      Center(child: Icon(Icons.mic,size: 60.0,color: Colors.red,),),
      Center(child: Icon(Icons.radio,size: 60.0,color: Colors.red,),),
      Center(child: Icon(Icons.music_video,size: 60.0,color: Colors.red,),),
    ];

    final bnbi=<BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home,),title: Text("Home")),
      BottomNavigationBarItem(icon: Icon(Icons.map,),title: Text("Social")),
      BottomNavigationBarItem(icon: Icon(Icons.mic,),title: Text("Search")),
      BottomNavigationBarItem(icon: Icon(Icons.radio,),title: Text("Radio")),
      BottomNavigationBarItem(icon: Icon(Icons.music_video,),title: Text("My Music")),
    ];
    final bnb=BottomNavigationBar(
      items: bnbi,
      currentIndex:id ,
      type: BottomNavigationBarType.fixed,
      onTap: (int value){
        setState(() {
          id=value;
        });
      },
    );
    final header=UserAccountsDrawerHeader(
      accountName: Text("Get more out of Gaana"),
      accountEmail: Text("Login or Register"),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 30.0,),
      ),
    );
    final items=ListView(
      children: <Widget>[
        header,
        ListTile(
          title: Text("Coupons"),
        ),
        Divider(),
        ListTile(
          title: Text("Identify the Song"),
          subtitle: Text("Identifies music around you",style: TextStyle(color: Colors.deepOrange),),
        ),
        Divider(),
        ListTile(
          title: Text("Setting"),
        ),
        ListTile(
          title: Text("Song Language"),
        ),
        ListTile(
          title: Text("Display Language"),
        ),
        ListTile(
          title: Text("App theme"),
        ),
        ListTile(
          title: Text("Night Mode"),
          trailing: Switch(value: true),
        ),
        Divider(),
        ListTile(
          title: Text("Help"),
          leading: Icon(Icons.help),
        ),
      ],

    );



    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications),onPressed: (){},),
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
        ],
      ),
      drawer: Drawer(child: items,),
      body: tabpages[id],
      bottomNavigationBar: bnb,
    );
  }
}
