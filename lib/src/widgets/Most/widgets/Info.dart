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
                      ])
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
