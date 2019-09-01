import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justhear.me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Justhear.me'),
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
  int _counter = 0;
  int _selectedIndex = 0;
  double initial = 0;
  double distance;
  String _value = '';
  void _onClick(String value) => setState(() => _value = value);
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  PageController _c;
  @override
  void initState(){
    _c =  new PageController(
      initialPage: _selectedIndex,
    );
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('홈'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('프로필')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("설정")
          )
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
      body: new PageView(
        controller: _c,
        onPageChanged: (newPage){
          setState(() {
            this._selectedIndex=newPage;
          });
        },
        children: <Widget>[
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.supervised_user_circle),
                new Text("Users")
              ],
            ),
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.notifications),
                new Text("Alerts")
              ],
            ),
          ),
          new Center(
            child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.mail),
              new Text("Inbox")
              ],
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.account_circle),
      ),
    );
  }
}
