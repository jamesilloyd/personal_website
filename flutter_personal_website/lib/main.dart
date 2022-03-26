import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'James Lloyd',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Futura'),
      home: const MyHomePage(title: 'James Lloyd'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TODO: needs to be dependent on screen size
  TextStyle heading = TextStyle(fontSize: 30, color: Colors.white);
  TextStyle para = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 75,
        title: SelectableText(
          widget.title,
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 60),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/zen.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    SelectableText(
                      'About',
                      style: heading,
                    ),
                    JLDivider(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO: image quality
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/me.jpg',
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SelectableText(
                                'Hello, this is a little description about myself before we get into the heavy stuff. Just trying to keep it nice and light!',
                                style: para),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    SelectableText('Experience', style: heading),
                    JLDivider(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        JLButton(
                          name: 'CV',
                          onPressed: () async {
                            // final pdf = pw.Document();
                            // pdf.addPage(pw.Page(pageFormat: PdfPageFormat.a4,build: (pw.Context context) {
                            //   return pw.Center(child: pw.SelectableText('Hello World'),);
                            // }));

                            print('hello');
                            // final bytes = await pdf.save();

                            final bytes = await rootBundle.load(
                                "files/CV.pdf"); // location of your asset file

                            final blob = html.Blob([bytes], 'application/pdf');
                            final url = html.Url.createObjectUrlFromBlob(blob);
                            html.window.open(url, '_blank');
                            html.Url.revokeObjectUrl(url);

                            // OpenFile.open("files/CV.pdf");
                          },
                        ),
                        JLButton(name: 'Experience/Journey', onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    SelectableText('Projects', style: heading),
                    JLDivider(),
                    SizedBox(
                      height: 30,
                    ),
                    JLSection(
                        heading: heading,
                        para: para,
                        title: 'Genchi',
                        paragraphText: 'We made an app!',
                        image: 'images/genchi.png',
                        imageFirst: false),
                    SizedBox(height: 30),
                    JLSection(
                        heading: heading,
                        para: para,
                        title: 'Major Design Project',
                        paragraphText: 'THE MUD HUTTERS wohooo',
                        image: 'images/mdp.JPG',
                        imageFirst: true),
                    SizedBox(
                      height: 200,
                    ),
                    SelectableText('Interests', style: heading),
                    JLDivider(),
                    SizedBox(
                      height: 30,
                    ),
                    JLSection(
                        heading: heading,
                        para: para,
                        image: 'images/rugby.jpg',
                        paragraphText: 'A bit about my rugby "career".',
                        title: 'Rugby',
                        imageFirst: false),
                    SizedBox(
                      height: 50,
                    ),
                    JLSection(
                      heading: heading,
                      para: para,
                      title: 'Travelling',
                      paragraphText: 'A bit about my travels.',
                      image: 'images/travels.jpg',
                      imageFirst: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        JLButton(
                          name: 'Reading',
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
                        JLButton(
                          name: "My Photos",
                          onPressed: () async {
                            const url = "https://www.instagram.com/fujijlloyd/";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        JLButton(
                          name: 'Travels in Guatemala',
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
                        JLButton(
                          name: 'Playlists',
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
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                SelectableText(
                  'Social Links ...',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Container(
                  height: 100,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: SizedBox.shrink()),
                        Expanded(
                          flex: 1,
                          child: SelectableText(
                            'Made by James Lloyd',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image:
                                  AssetImage('images/Google-flutter-logo.png'),
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JLSection extends StatelessWidget {
  const JLSection(
      {Key? key,
      required this.heading,
      required this.para,
      required this.title,
      required this.paragraphText,
      required this.image,
      required this.imageFirst})
      : super(key: key);

  final TextStyle heading;
  final TextStyle para;
  final String title;
  final String paragraphText;
  final String image;
  final bool imageFirst;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: imageFirst
          ? [
              Flexible(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(image,
                        width: MediaQuery.of(context).size.width * 0.4)),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      title,
                      style: heading,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SelectableText(
                      paragraphText,
                      style: para,
                    ),
                  ],
                ),
              ),
            ]
          : [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      title,
                      style: heading,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SelectableText(
                      paragraphText,
                      style: para,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(image,
                        width: MediaQuery.of(context).size.width * 0.4)),
              )
            ],
    );
  }
}

class JLDivider extends StatelessWidget {
  const JLDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Divider(
          color: Colors.white,
          thickness: 0.5,
        ));
  }
}

class JLButton extends StatelessWidget {
  const JLButton({
    required this.name,
    required this.onPressed,
  });

  // PasswordErrorSelectableText({this.errorMessage});

  final String name;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.all(10),
        child: SelectableText(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
