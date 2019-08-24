import 'package:flutter_web/material.dart';
import 'profiles_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Darsbir Singh',
      theme: ThemeData(
        fontFamily: "MeriendaOne",
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
      ),
      home:ProfilePage()
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
          ],
        ),
      ), 
    );
  }
}
