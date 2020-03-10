import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome UI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PanelController _panelController = new PanelController();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(52.0),
      bottomRight: Radius.circular(5.0),
      bottomLeft: Radius.circular(5.0),
      topRight: Radius.circular(5.0),
    );
    return  SlidingUpPanel(
      controller: _panelController,
      renderPanelSheet: false,
      borderRadius: radius,
      onPanelOpened: (){
        BorderRadiusGeometry _radius = BorderRadius.only(
          topLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        );
        setState(() {
          radius= _radius;
        });
      },
      onPanelClosed: (){
        BorderRadiusGeometry _radius = BorderRadius.only(
          topLeft: Radius.circular(52.0),
          bottomRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        );
        setState(() {
          radius= _radius;
        });
      },
      panel: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey,
              ),
            ]
        ),
        margin: const EdgeInsets.all(4.0),
        child: Center(
          child: Text("This is the SlidingUpPanel when open"),
        ),
      ),
      collapsed: Container(
        margin: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: radius
        ),
        child: Center(
          child: Text("Lalalala", style: TextStyle(color: Colors.white),),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.teal,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget> [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Amazing Power Wallet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Container(
                      color: Colors.teal,
                    ))

              ),
            ];
          },
          body: home()

        ),

      ),
    );
  }
}
