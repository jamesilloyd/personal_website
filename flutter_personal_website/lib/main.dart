import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';
import 'package:video_player/video_player.dart';

import 'components/JLButton.dart';
import 'components/JLDivider.dart';
import 'components/JLIconButton.dart';
import 'components/JLSection.dart';
import 'package:mailto/mailto.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'components/alignedGrid.dart';
import 'text_sections.dart';
// const kBackgroundGrey = 0xff313132;
// const kBackgroundGrey = 0xff181818;

// const kBackgroundGrey = 0xff272727;
const kBackgroundGrey = 0xff1E1F21;

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'James Lloyd',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Futura',
        highlightColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.red[300]?.withOpacity(0.5)),
      ),
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
  TextStyle para = TextStyle(fontSize: 18, color: Colors.white);
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  late Future<void> _initialiseVideoPlayerFuture;
  late Future<void> _initialiseVideoPlayerFuture2;

  final ScrollController _scrollController = ScrollController();

  List<Map> experienceImages = [
    {'file': 'images/safi.png', 'url': 'https://www.safi.co/'},
    {'file': 'images/fella.png', 'url': 'https://www.joinfella.com/'},
    {'file': 'images/fetch.png', 'url': 'https://fetch.ai/'},
    {'file': 'images/festo.png', 'url': 'https://festo.com/'},
    {'file': 'images/rb.png', 'url': 'https://www.rolandberger.com/en/'},
    {'file': 'images/switchee.png', 'url': 'https://www.switchee.co/'},
    {'file': 'images/cambridge.png', 'url': 'https://www.cam.ac.uk/'},
    {
      'file': 'images/rae.png',
      'url':
          'https://www.raeng.org.uk/grants-prizes/grants/schemes-for-students/engineering-leaders-scholarship'
    },
    {
      'file': 'images/iet.png',
      'url':
          'https://www.theiet.org/impact-society/awards-scholarships/scholarships-and-bursaries/iet-diamond-scholarships/'
    },
    {
      'file': 'images/edt.png',
      'url': 'https://www.etrust.org.uk/the-year-in-industry'
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.asset('files/explode.mp4');
    _controller2 = VideoPlayerController.asset('files/build.mp4');
    _initialiseVideoPlayerFuture = _controller.initialize();
    _initialiseVideoPlayerFuture2 = _controller2.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controller2.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 850;
    bool needs2Columns = MediaQuery.of(context).size.width < 670;
    bool needs4Columns = MediaQuery.of(context).size.width > 1000;
    // print(MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: const Color(kBackgroundGrey),
        appBar: AppBar(
          backgroundColor: const Color(kBackgroundGrey),
          toolbarHeight: 75,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(kBackgroundGrey),
            ),
          ),
        ),
        body: Scrollbar(
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: needs2Columns ? 40 : 80),
            children: [
              SizedBox(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/zen.jpg',
                      height: MediaQuery.of(context).size.height * 0.8,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
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
                        const SizedBox(
                          height: 30,
                        ),
                        isSmallScreen
                            ? Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'images/me.jpg',
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SelectableText(headlineBio,
                                      textAlign: isSmallScreen
                                          ? TextAlign.center
                                          : TextAlign.left,
                                      style: para),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'images/me.jpg',
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                  SizedBox(
                                    // color: Colors.blue,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: SelectableText(
                                        headlineBio,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(height: isSmallScreen ? 50 : 100),
                        SelectableText('Experience', style: heading),
                        JLDivider(),
                        const SizedBox(
                          height: 30,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     JLButton(
                        //       name: 'CV',
                        //       onPressed: () async {
                        //         //TODO: look at this as I cannot download it
                        //         // final pdf = pw.Document();
                        //         // pdf.addPage(pw.Page(pageFormat: PdfPageFormat.a4,build: (pw.Context context) {
                        //         //   return pw.Center(child: pw.SelectableText('Hello World'),);
                        //         // }));

                        //         // final bytes = await pdf.save();

                        //         final bytes = await rootBundle.load(
                        //             "files/CV.pdf"); // location of your asset file

                        //         final blob =
                        //             html.Blob([bytes], 'application/pdf');
                        //         final url =
                        //             html.Url.createObjectUrlFromBlob(blob);
                        //         html.window.open(url, '_blank');
                        //         html.Url.revokeObjectUrl(url);

                        //         // OpenFile.open("files/CV.pdf");
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 20),
                        Center(
                          child: AlignedGrid(
                            gridList: experienceImages,
                            columns: needs2Columns
                                ? 2
                                : needs4Columns
                                    ? 4
                                    : 3,
                          ),
                        ),
                        SizedBox(
                          height: isSmallScreen ? 50 : 100,
                        ),
                        SelectableText('Projects', style: heading),
                        JLDivider(),
                        const SizedBox(
                          height: 30,
                        ),
                        JLSection(
                          heading: heading,
                          para: para,
                          title: 'Genchi',
                          paragraphText: genchiText,
                          image: 'images/genchi.jpg',
                          imageFirst: false,
                          isSmallScreenSize: isSmallScreen,
                        ),
                        SizedBox(height: 50),
                        JLSection(
                          heading: heading,
                          para: para,
                          title: 'Major Design Project\nThe Refuge Printer',
                          paragraphText: refugeText,
                          image: 'images/mdp.JPG',
                          imageFirst: true,
                          isSmallScreenSize: isSmallScreen,
                        ),
                        SizedBox(height: 30),
                        isSmallScreen
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        //TODO: add in better width
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: FutureBuilder(
                                          future: _initialiseVideoPlayerFuture,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return AspectRatio(
                                                aspectRatio: _controller
                                                    .value.aspectRatio,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: VideoPlayer(
                                                        _controller)),
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      JLPausePlay(
                                        onPressed: () {},
                                        controller: _controller,
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        //TODO: add in better width
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: FutureBuilder(
                                          future: _initialiseVideoPlayerFuture2,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return AspectRatio(
                                                aspectRatio: _controller2
                                                    .value.aspectRatio,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: VideoPlayer(
                                                        _controller2)),
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      JLPausePlay(
                                        onPressed: () {},
                                        controller: _controller2,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        //TODO: add in better width
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: FutureBuilder(
                                          future: _initialiseVideoPlayerFuture,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return AspectRatio(
                                                aspectRatio: _controller
                                                    .value.aspectRatio,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: VideoPlayer(
                                                        _controller)),
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      JLPausePlay(
                                        onPressed: () {},
                                        controller: _controller,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        //TODO: add in better width
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: FutureBuilder(
                                          future: _initialiseVideoPlayerFuture2,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return AspectRatio(
                                                aspectRatio: _controller2
                                                    .value.aspectRatio,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: VideoPlayer(
                                                        _controller2)),
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      JLPausePlay(
                                        onPressed: () {},
                                        controller: _controller2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 50,
                        ),
                        SelectableText.rich(TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'More to be added, including:\n',
                              style: heading),
                          TextSpan(text: '\u2022 ', style: heading),
                          TextSpan(text: 'An AI Agent application to Distributed Manufacturing\n', style: heading),
                          TextSpan(text: '\u2022 ', style: heading),
                          TextSpan(text: 'Defective Parts Detection using Computer Vision (OpenCV and TensorFlow)\n', style: heading),
                          TextSpan(text: '\u2022 ', style: heading),
                          TextSpan(text: 'Robotics competition using C++ and Arduino\n', style: heading),
                        ])),
                        SizedBox(height: isSmallScreen ? 50 : 100),
                        // SelectableText('Blog', style: heading),
                        JLDivider(),
                        // SizedBox(height: 30,),
                        // SelectableText('Coming very soon...', style: heading, textAlign: TextAlign.center,),
                        // SizedBox(height: isSmallScreen ? 50 : 100),
                        // SelectableText('Interests', style: heading),
                        // JLDivider(),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     JLButton(
                        //       name: 'Reading',
                        //       onPressed: () async {
                        //         const url =
                        //             "https://jameslloyd.notion.site/Read-Books-84f527d45fe7496b889f9a742cee26a6";
                        //         if (await canLaunch(url)) {
                        //           await launch(url);
                        //         } else {
                        //           throw 'Could not launch $url';
                        //         }
                        //       },
                        //     ),
                        //     JLButton(
                        //       name: "Photography",
                        //       onPressed: () async {
                        //         const url =
                        //             "https://www.instagram.com/fujijlloyd/";
                        //         if (await canLaunch(url)) {
                        //           await launch(url);
                        //         } else {
                        //           throw 'Could not launch $url';
                        //         }
                        //       },
                        //     ),
                        //     //TODO: add this in later

                        //     // JLButton(
                        //     //   name: 'Travels in Guatemala',
                        //     //   onPressed: () async {
                        //     //     const url =
                        //     //         "https://jameslloyd.notion.site/Guatemala-69c45eeb29af45b4a929d876d346291d";
                        //     //     if (await canLaunch(url)) {
                        //     //       await launch(url);
                        //     //     } else {
                        //     //       throw 'Could not launch $url';
                        //     //     }
                        //     //   },
                        //     // ),
                        //   ],
                        // ),

                        // SizedBox(
                        //   height: 30,
                        // ),
                        // JLSection(
                        //   heading: heading,
                        //   para: para,
                        //   image: 'images/rugby.jpg',
                        //   paragraphText: rugbyText,
                        //   title: 'Rugby',
                        //   imageFirst: false,
                        //   isSmallScreenSize: isSmallScreen,
                        // ),
                        // SizedBox(
                        //   height: 50,
                        // ),
                        // JLSection(
                        //   heading: heading,
                        //   para: para,
                        //   title: 'Travelling',
                        //   paragraphText: travelingText,
                        //   image: 'images/travels.jpg',
                        //   imageFirst: true,
                        //   isSmallScreenSize: isSmallScreen,
                        // ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                      ],
                    ),
                    // SizedBox(height: isSmallScreen ? 50 : 100),
                    // SelectableText(
                    //   'Please reach out',
                    //   style: TextStyle(fontSize: 30, color: Colors.white),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        JLIconButton(
                          icon: FontAwesomeIcons.linkedin,
                          onPressed: () async {
                            const url =
                                "https://www.linkedin.com/in/james-lloyd-748b91100/";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // JLIconButton(
                        //   icon: FontAwesomeIcons.spotify,
                        //   onPressed: () async {
                        //     const url =
                        //         "https://open.spotify.com/user/8jgj19mnukoyzb805mfibdhvk?si=B5ymIuSnRkuofMO-H_MGHA";
                        //     if (await canLaunch(url)) {
                        //       await launch(url);
                        //     } else {
                        //       throw 'Could not launch $url';
                        //     }
                        //   },
                        // ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // JLIconButton(
                        //   icon: FontAwesomeIcons.github,
                        //   onPressed: () async {
                        //     const url = "https://github.com/jamesilloyd";
                        //     if (await canLaunch(url)) {
                        //       await launch(url);
                        //     } else {
                        //       throw 'Could not launch $url';
                        //     }
                        //   },
                        // ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        JLIconButton(
                          icon: Icons.email,
                          onPressed: () async {
                            //ToDo fix below
                            //?subject=<subject>&body=<body>
                            const url = 'mailto:jijlloyd98@gmail.com';
                            final mailtoLink =
                                Mailto(to: ['jijlloyd98@gmail.com']);

                            try {
                              // await launch(url);
                              await launch('$mailtoLink');
                            } catch (e) {
                              print('error');
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            'Made by James Lloyd',
                            style: para,
                            textAlign: TextAlign.center,
                          ),
                          // MaterialButton(
                          //   splashColor: Colors.transparent,
                          //   highlightColor: Colors.transparent,
                          //   onPressed: () async {
                          //     const url = "https://flutter.dev/";
                          //     if (await canLaunch(url)) {
                          //       await launch(url);
                          //     } else {
                          //       throw 'Could not launch $url';
                          //     }
                          //   },
                          //   child: Image(
                          //     image: AssetImage('images/flutter.png'),
                          //     // 'images/Google-flutter-logo.png'),
                          //     height: max(
                          //         min(
                          //             40,
                          //             40 *
                          //                 MediaQuery.of(context).size.width /
                          //                 1440),
                          //         20),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
