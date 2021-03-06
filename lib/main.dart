import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: 'Navigator',
        home: Scaffold(
          appBar: AppBar(
            title: Text('tapbox'),
          ),
          body: Center(
            child: ParentWidget(),
          ),
        ),
      ),
    );

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : assert(onChanged != null),
        super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }

  void _handleTap() {
    onChanged(!active);
  }
}

// void main() => runApp(
//       MaterialApp(
//         title: 'Navigator',
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('tapbox'),
//           ),
//           body: Center(
//             child: TapBoxA(),
//           ),
//         ),
//       ),
//     );

// class TapBoxA extends StatefulWidget {
//   @override
//   _TapBoxAState createState() => _TapBoxAState();
// }

// class _TapBoxAState extends State<TapBoxA> {
//   bool _active = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             _active ? 'Active' : 'Inacttive',
//             style: TextStyle(
//               fontSize: 32.0,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//             color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
//       ),
//     );
//   }

//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }
// }

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Screen'),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => DetailScreen(),
//             ),
//           );
//         },
//         child: Hero(
//           tag: 'imageHero',
//           child: Image.network('https://picsum.photos/250?image=9'),
//         ),
//       ),
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Center(
//           child: Hero(
//             tag: 'imageHero',
//             child: Image.network('https://picsum.photos/250?image=9'),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text('Demo'),
//         ),
//         body: Center(child: SelectionButton()),
//       );
// }

// class SelectionButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: () {
//         _navigateAndDeisplaySelection(context);
//       },
//       child: Text('オプション選択'),
//     );
//   }

//   Future<void> _navigateAndDeisplaySelection(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SelectionScreen()),
//     );

//     Scaffold.of(context)
//       ..removeCurrentSnackBar()
//       ..showSnackBar(
//         SnackBar(
//           content: Text(result),
//         ),
//       );
//   }
// }

// class SelectionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('選択して下さい'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   Navigator.pop(context, '選択肢1');
//                 },
//                 child: Text('選択肢1'),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   Navigator.pop(context, '選択肢2');
//                 },
//                 child: Text('選択肢2'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).

//           // メインの方向と対角線の方向を調整
//           crossAxisAlignment: CrossAxisAlignment.center,
//           // 中央寄せ
//           mainAxisAlignment: MainAxisAlignment.center,
//           // 等間隔
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           // 行をできる限り小さくする
//           // mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             // 枠内に納めさせる
//             Expanded(
//               // サイズ拡大プロパティ
//               flex: 7,
//               child: Text(
//                 'You have pushed the button this many times:',
//               ),
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// syle：の中身をchild:以下の全てに反映させる
// DefaultTextStyle.merge(
//   style: ..,
// child:
// )
