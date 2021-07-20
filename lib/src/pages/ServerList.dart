import 'package:flutter/material.dart';
import 'Playvideo.dart';
import '../model/models.dart';

List<String> servers = [
  'https://streamtape.com/e/YWyDojgxaDF211',
  'https://s01-stream.solidfilesusercontent.com/stream/M2Y5NGMzNWZhYmY5ZGRkNzc5ZjA2Y2IyNWVjMzJkZWM0MjBmYzQ5MToxbTRVZUg6aVJwUm5wN1J0SG9GUUtNaGRnTDAtNnZSMmk0/DeryeDWpBZr4k.mp4',
  'https://dc778.4shared.com/img/4XzqZ7Dpea/f9b23dde/dlink__2Fdownload_2F4XzqZ7Dpea_3Fsbsr_3D2e111838d850a966316b1f50d53fd777a81_26bip_3DMjEzLjYuMjM2LjE5_26lgfp_3D66_26bip_3DMjEzLjYuMjM2LjE5_26bip_3DMjEzLjYuMjM2LjE5/preview.mp4',
  'https://ok.ru/a3049f31-ace0-4cf8-a036-33d933f11b80',
  'https://streamtape.com/e/YWyDojgxaDF211',
  'https://streamtape.com/e/YWyDojgxaDF211',
  'https://streamtape.com/e/YWyDojgxaDF211',
];

class ServerList extends StatelessWidget {
  final name;
  const ServerList({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetshServers fetchApi = FetshServers();
    return FutureBuilder(
      future: fetchApi.fetchServer(name),
      builder: (context, snapshot) {
        var vids = snapshot.data;
        if (snapshot.hasData) {
          print(snapshot);
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: servers.length,
                            itemBuilder: (context, index) {
                              return TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayVideo(servers[index])));
                                  },
                                  child: Text(
                                    servers[index]
                                        .split('https://')[1]
                                        .split('.')[0],
                                    style: TextStyle(color: Colors.white),
                                  ));
                            }),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: FloatingActionButton(
                          child: Icon(Icons.exit_to_app),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
