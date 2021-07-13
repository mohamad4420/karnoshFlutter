import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'Io9LDgu955Y',
    params: YoutubePlayerParams(
        // Defining custom playlist
        autoPlay: true,
        showControls: false,
        showFullscreenButton: false));

class Info extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF212121),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF000000),
                            offset: Offset(0, 1),
                            blurRadius: 6)
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: YoutubePlayerControllerProvider(
                            controller: _controller,
                            child: YoutubePlayerIFrame(
                              aspectRatio: 16 / 9,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black.withOpacity(0),
                              height:
                                  MediaQuery.of(context).size.width * 0.5625,
                              child: Column(children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.volume_mute_outlined,
                                      color: Colors.white),
                                  iconSize: 30,
                                )
                              ])),
                        ),
                      ]),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.16,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.close),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.638,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Text(
                                          "سان اندريس",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    color: Colors.blue,
                                  ),
                                  Container(
                                    color: Colors.blue,
                                    child: Text(
                                        "اذا طلع البدر علينا بعد بكرا بصير العيد واو "),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://karnoshab.herokuapp.com/_next/image?url=https%3A%2F%2Fmycima.dev%3A2053%2Fwp-content%2Fuploads%2F2021%2F02%2FAlice-Fades-Away-2021-347x520.jpg&w=1920&q=40"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  );
                });
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
