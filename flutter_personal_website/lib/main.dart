import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'James Lloyd Personal Website',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'James Lloyd Personal Website'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Text("My Books"),
                  ),
                  onPressed: () async {
                    const url =
                        "https://jameslloyd.notion.site/Read-Books-84f527d45fe7496b889f9a742cee26a6";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Text("My Photos"),
                  ),
                  onPressed: () async {
                    const url = "https://www.instagram.com/fujijlloyd/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                SizedBox(height: 50),
                MaterialButton(
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Text("Travels in Guatemala"),
                  ),
                  onPressed: () async {
                    const url =
                        "https://jameslloyd.notion.site/Guatemala-69c45eeb29af45b4a929d876d346291d";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                SizedBox(height: 50),
                MaterialButton(
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Text("Playlists"),
                  ),
                  onPressed: () async {
                    const url =
                        "https://open.spotify.com/user/8jgj19mnukoyzb805mfibdhvk?si=B5ymIuSnRkuofMO-H_MGHA";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ]),
            ),
            Container(
              height: 70,
              color: Colors.blue,
              child: Center(
                  child: Text(
                'Made by James Lloyd using Flutter',
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
