import 'package:flutter/material.dart';
import '../../../../model/video_models.dart';
import 'package:readmore/readmore.dart';

class DesktopMain extends StatelessWidget {
  final VidModels data;

  DesktopMain({Key key, this.data}) : super(key: key);
  double padingAll = 10;
  double betwenItems = 10;
  double betwengeneress = 5;
  var btnColor = Colors.grey[600];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        data.name,
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      )),
                  Container(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: btnColor // set the background color

                              ),
                          onPressed: () {},
                          child: Icon(
                            Icons.volume_mute,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: betwenItems),
                    child: Text("انمي",
                        style: TextStyle(color: Colors.white70, fontSize: 18)),
                  ),
                  Container(
                      height: 28,
                      child: Center(
                          child: ListView.builder(
                              itemCount: data.genres.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: betwengeneress),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side:
                                            BorderSide(color: Colors.white70)),
                                    onPressed: () {},
                                    child: Text(data.genres[index].toString(),
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 14)),
                                  ),
                                );
                              }))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: betwenItems),
                    child: Text(data.date,
                        style: TextStyle(color: Colors.white70, fontSize: 18)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: betwenItems),
                    child: Container(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnColor // set the background color

                            ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              'تشغيل',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: betwenItems),
                    child: Container(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnColor // set the background color

                            ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'اضافه الى القائمه',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: betwenItems),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: btnColor // set the background color

                                ),
                            onPressed: () {},
                            child: Icon(
                              Icons.share_rounded,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ReadMoreText(
                      data.description,
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'المزيد',
                      trimExpandedText: 'اقل',
                      moreStyle: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Text("الوقت : " + data.time,
                      style: TextStyle(color: Colors.white70, fontSize: 18)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Text("الابطال : " + data.name,
                      style: TextStyle(color: Colors.white70, fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padingAll),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: btnColor // set the background color

                          ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            'المواسم',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
