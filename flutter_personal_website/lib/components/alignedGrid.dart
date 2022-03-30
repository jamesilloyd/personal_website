import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// class AlignedGrid extends StatelessWidget {

//   AlignedGrid({required this.gridList});
//   // //  double runSpacing = 20;
//   // //  double spacing = 20;
//   //   final int columns;
//     final List gridList;
//     final double runSpacing = 4;
//   final double spacing = 4;
//   final int listSize = 15;
//   final columns = 4;

//   @override
//   Widget build(BuildContext context) {
//     final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / columns;
//     return SingleChildScrollView(
//       child: Wrap(
//         runSpacing: 0,
//         spacing: 0,
//         alignment: WrapAlignment.center,
//         children: List.generate(gridList.length, (index) {
//           return Container(
//             padding: EdgeInsets.all(20),
//             width: w,
//             height: w,
//             color: Colors.green[200],
//           );
//         }),
//       ),
//     );
//   }

// }

// Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child:

class AlignedGrid extends StatelessWidget {
  AlignedGrid({required this.gridList,required this.columns});

  final List gridList;
  final double runSpacing = 0;
  final double spacing = 0;
  final columns;

  @override
  Widget build(BuildContext context) {
    final w =
        ((MediaQuery.of(context).size.width - 160 - (40)*(columns - 1)) / columns).floor().toDouble();
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(gridList.length, (index) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () async {
                  var url = gridList[index]['url'];
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  width: w,
                  height: w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: Image.asset(gridList[index]['file']).image)),
                ),
              )

              // Container(
              //   width: w,
              //   height: w,
              //   color: Colors.green[200],
              // ),
              );
        }),
      ),
    );
  }
}
