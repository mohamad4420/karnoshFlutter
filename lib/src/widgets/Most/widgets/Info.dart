import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            test(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.white70,
              ),
              Text('معلومات', style: TextStyle(color: Colors.white70))
            ],
          ),
        ));
  }
}

void test(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 260,
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
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://karnoshab.herokuapp.com/_next/image?url=https%3A%2F%2Fmycima.dev%3A2053%2Fwp-content%2Fuploads%2F2021%2F02%2FAlice-Fades-Away-2021-347x520.jpg&w=1920&q=40"),
                            ),
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
                                    "سان اندريس",
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
                                Text("2015  ",
                                    style: TextStyle(color: Colors.white70)),
                                Text("+16   ",
                                    style: TextStyle(color: Colors.white70)),
                                Text("1 ساعه 54 دقيقه   ",
                                    style: TextStyle(color: Colors.white70))
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.72,
                            child: Text(
                              "اذا طلع البدر علينا بعد بكرو ا بر بصير العيد واواذا طلع البدر علينا بعد بكرو ا بر بصير العيد واو اذا طلع البدر علينا بعد بكرو ا بر بصير العيد واو",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
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
