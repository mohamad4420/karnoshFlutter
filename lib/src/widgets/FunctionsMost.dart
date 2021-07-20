import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../pages/SelectionPage.dart';

void bottomSliderMost(context, data) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 266,
            decoration: BoxDecoration(
              color: Color(0xFF212121),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000),
                    offset: Offset(0, 1),
                    blurRadius: 6)
              ],
            ),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 3, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: GestureDetector(
                                onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SelectionPage(
                                                  datas: data,
                                                )),
                                      )
                                    },
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(data.poster),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.638,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Text(
                                    data.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.16,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.73,
                            height: 30,
                            child: Row(
                              children: [
                                Text(data.date + "  ",
                                    style: TextStyle(color: Colors.white70)),
                                Text("+16   ",
                                    style: TextStyle(color: Colors.white70)),
                                Text(data.time + "  ",
                                    style: TextStyle(color: Colors.white70))
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: 80,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: ReadMoreText(
                                        data.description,
                                        trimLines: 3,
                                        colorClickableText: Colors.white60,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'المزيد',
                                        trimExpandedText: 'القليل',
                                        moreStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      Colors.white70 // set the background color

                                  ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'عرض',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: Colors.white70,
                                  ),
                                  Text('تنزيل',
                                      style: TextStyle(color: Colors.white70))
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white70,
                                  ),
                                  Text('اضافه',
                                      style: TextStyle(color: Colors.white70))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.white70,
                    ),
                    Text(' المزيد من المعلومات ',
                        style: TextStyle(color: Colors.white)),
                    Container(
                      child: Icon(
                        Icons.subdirectory_arrow_left,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      });
}
