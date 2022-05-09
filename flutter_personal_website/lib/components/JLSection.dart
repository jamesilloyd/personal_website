import 'package:flutter/material.dart';

class JLSection extends StatelessWidget {
  const JLSection(
      {Key? key,
      required this.heading,
      required this.para,
      required this.title,
      required this.paragraphText,
      required this.image,
      required this.isSmallScreenSize,
      required this.imageFirst})
      : super(key: key);

  final TextStyle heading;
  final TextStyle para;
  final String title;
  final String paragraphText;
  final String image;
  final bool imageFirst;
  final bool isSmallScreenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: isSmallScreenSize
          ? Column(
              children: [
                SelectableText(
                  title,
                  style: heading,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(image,
                        width: MediaQuery.of(context).size.width * 0.7)),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                  paragraphText,
                  style: para,
                  textAlign: TextAlign.justify,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: imageFirst
                  ? [
                      Flexible(
                        flex: 1,
                        child: ClipRRect(
                            // borderRadius: BorderRadius.circular(20),
                            child: Image.asset(image,
                                width:
                                    MediaQuery.of(context).size.width * 0.4)),
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
                              textAlign: TextAlign.justify,
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
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: ClipRRect(
                            // borderRadius: BorderRadius.circular(20),
                            child: Image.asset(image,
                                width:
                                    MediaQuery.of(context).size.width * 0.4)),
                      )
                    ],
            ),
    );
  }
}
