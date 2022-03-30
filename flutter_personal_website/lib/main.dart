import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

import 'components/JLButton.dart';
import 'components/JLDivider.dart';
import 'components/JLSection.dart';
import 'package:mailto/mailto.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'components/alignedGrid.dart';

void main() {
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
        // textSelectionTheme: TextSelectionThemeData(
        // selectionColor: Colors.red[300]?.withOpacity(0.5)),
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

  List<Map> experienceImages = [
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
    {'file': 'images/ff.png', 'url': ''},
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
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 850;
    bool needs2Columns = MediaQuery.of(context).size.width < 670;
    bool needs4Columns = MediaQuery.of(context).size.width > 1000;
    print(MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 75,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 60),
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
                      SizedBox(
                        height: 30,
                      ),
                      isSmallScreen
                          ? Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/me.jpg',
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SelectableText(
                                    "Hello, I'm James.\n\nI'm an MEng graduate in Manufacturing Engineering and Management looking to gain experience applying blockchain technologies to problems in sustainability and climate.",
                                    textAlign: isSmallScreen ? TextAlign.center:TextAlign.left,
                                    style: para),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // width: MediaQuery.of(context).size.width*0.1,
                                  width: 20,
                                  ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/me.jpg',
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                                SizedBox(
                                  // color: Colors.blue,
                                  width: MediaQuery.of(context).size.width*0.5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: SelectableText(
                                        "Hello, I'm James.\n\nI'm an MEng graduate in Manufacturing Engineering and Management looking to gain experience applying blockchain technologies to problems in sustainability and climate.",
                                        style: heading,),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(height: isSmallScreen ? 50 : 100),
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
                              //TODO: look at this as I cannot download it
                              // final pdf = pw.Document();
                              // pdf.addPage(pw.Page(pageFormat: PdfPageFormat.a4,build: (pw.Context context) {
                              //   return pw.Center(child: pw.SelectableText('Hello World'),);
                              // }));

                              // final bytes = await pdf.save();

                              final bytes = await rootBundle.load(
                                  "files/CV.pdf"); // location of your asset file

                              final blob =
                                  html.Blob([bytes], 'application/pdf');
                              final url =
                                  html.Url.createObjectUrlFromBlob(blob);
                              html.window.open(url, '_blank');
                              html.Url.revokeObjectUrl(url);

                              // OpenFile.open("files/CV.pdf");
                            },
                          ),
                        ],
                      ),
                      Center(
                        child: AlignedGrid(gridList: experienceImages,columns: needs2Columns ? 2 : needs4Columns ? 4 : 3,),

                        // child: GridView.count(
                        //   shrinkWrap: true,
                          
                        //   crossAxisCount: isSmallScreen ? 2 : isLargeScreen ? 4 : 3,
                        //   children:
                        //       List.generate(experienceImages.length, (index) {

                        //     //If we have 3 widgets we want to centre the last if % = 1
                        //     //If we have 4 widgets we want to cetnre the last if % = 2
                        //     return Padding(
                        //         padding: const EdgeInsets.all(20.0),
                        //         child: ElevatedButton(
                        //             style: ElevatedButton.styleFrom(
                        //               primary: Colors.white,
                        //               padding: EdgeInsets.all(0),
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(20)),
                        //             ),
                        //             onPressed: () async {
                        //               var url = experienceImages[index]['url'];
                        //               if (await canLaunch(url)) {
                        //                 await launch(url);
                        //               } else {
                        //                 throw 'Could not launch $url';
                        //               }
                        //             },
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(20),
                        //                 image: DecorationImage(fit:BoxFit.fitWidth,
                        //                 image: Image.asset(experienceImages[index]['file']).image)
                        //               ),
                        //             )
                        //             // child: ClipRRect(
                        //             //     borderRadius: BorderRadius.circular(20),
                        //             //     child: FittedBox(
                        //             //       fit: BoxFit.contain,
                        //             //       child: Image.asset(
                        //             //           experienceImages[index]['file'],),
                        //             //     )),
                        //             ));
                        //   }),
                        // ),
                      ),
                      SizedBox(
                        height: isSmallScreen ? 50 : 100,
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
                        paragraphText:
                            'A platform for students to find opportunities. Aiming to empower people to create their own impact through equal access to opportunities, Genchi enables people to develop their skillset and contribute towards causes that are meaningful to them.',
                        image: 'images/genchi.png',
                        imageFirst: false,
                        isSmallScreenSize: isSmallScreen,
                      ),
                      SizedBox(height: 50),
                      JLSection(
                        heading: heading,
                        para: para,
                        title: 'Major Design Project\nThe Refuge Printer',
                        paragraphText:
                            'There are 4.6 million people currently living in managed refugee camps who are dependent on shelter for survival. 74% of existing accomodation is unsatisfactory. The Refuge Printer is a 3D printer that can build comfortable, durable, and secure accommodation to drasticall improve standards of living. Unlike existing solutions, such as Better Shelter, that import flat-pack shetlers, the Refuge Printer builds shelters out of locally sourced materials, thus reducing transport costs, material costs and environmental impact, whilst stimulating local economies.',
                        image: 'images/mdp.JPG',
                        imageFirst: true,
                        isSmallScreenSize: isSmallScreen,
                      ),
                      SizedBox(height: isSmallScreen ? 50 : 100),
                      SelectableText('Interests', style: heading),
                      JLDivider(),
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
                            name: "Photos",
                            onPressed: () async {
                              const url =
                                  "https://www.instagram.com/fujijlloyd/";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                          //TODO: add this in later
                          // JLButton(
                          //   name: 'Travels in Guatemala',
                          //   onPressed: () async {
                          //     const url =
                          //         "https://jameslloyd.notion.site/Guatemala-69c45eeb29af45b4a929d876d346291d";
                          //     if (await canLaunch(url)) {
                          //       await launch(url);
                          //     } else {
                          //       throw 'Could not launch $url';
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      JLSection(
                        heading: heading,
                        para: para,
                        image: 'images/rugby.jpg',
                        paragraphText: "I have been playing rugby since I was 5 years old and went on to play at university level. I enjoy the comradery of team sports and having a socialable way to keep fit. I love watching games with friends, in 2019 I went to Japan to watch the Rugby World Cup. I'm now looking to play in a touch rugby league in London.",
                        title: 'Rugby',
                        imageFirst: false,
                        isSmallScreenSize: isSmallScreen,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      JLSection(
                        heading: heading,
                        para: para,
                        title: 'Travelling',
                        paragraphText: "I spent the last year doing something a bit different from engineering by travelling around Latin America, learning spanish and volunteering on a permaculture ranch to gain a hands-on understanding of sustainable practices.",
                        image: 'images/travels.jpg',
                        imageFirst: true,
                        isSmallScreenSize: isSmallScreen,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 50 : 100),
                  SelectableText(
                    'Please reach out',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.linkedin,
                            color: Colors.white, size: 30),
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
                      IconButton(
                        icon: Icon(FontAwesomeIcons.spotify,
                            color: Colors.white, size: 30),
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
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.github,
                            color: Colors.white, size: 30),
                        onPressed: () async {
                          const url = "https://github.com/jamesilloyd";
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
                      IconButton(
                        icon: Icon(Icons.email, color: Colors.white, size: 30),
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
                          'Made by James Lloyd using',
                          style: para,
                          textAlign: TextAlign.center,
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        MaterialButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            const url = "https://flutter.dev/";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image(
                            image: AssetImage('images/flutter.png'),
                            // 'images/Google-flutter-logo.png'),
                            height:max(min(40,40*MediaQuery.of(context).size.width/1440),20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


