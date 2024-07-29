import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AlignedGrid extends StatelessWidget {
  AlignedGrid({required this.gridList,required this.columns});

  final List gridList;
  final double runSpacing = 0;
  final double spacing = 0;
  final columns;

  @override
  Widget build(BuildContext context) {
    final w =
        ((MediaQuery.of(context).size.width - 200 - (40)*(columns - 1)) / columns).floor().toDouble();
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(gridList.length, (index) {
          // if columns = 2, then alternating taking off the right and left side
          // if columns = 3, then 1,3,4,6,7,9 etc taking off sides
          // if columns = 4, then 1,4,5,8 etc. 
          // n, n + 1
        
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // foregroundColor: Colors.white,
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

              );
        }),
      ),
    );
  }
}
