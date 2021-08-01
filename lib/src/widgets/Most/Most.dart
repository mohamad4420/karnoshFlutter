import 'package:karnosh/src/widgets/Most/widgets/Desktop/DesktopMain.dart';
import './widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/physics.dart';
import '../responsive.dart';

class Most extends StatelessWidget {
  final String type;
  final String generes;
  final bool sort;

  const Most({Key key, this.type, this.generes, this.sort}) : super(key: key);
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    var mainMost;
    var innerMost;
    if (Responsive.isMobile(context)) {
      mainMost = 0.90;
      innerMost = 0.89;
    } else {
      mainMost = 0.95;
      innerMost = 0.948;
    }

    return FutureBuilder(
        future: fetchApi.fetchVid(type, sort, generes),
        builder: (context, snapshot) {
          var vids = snapshot.data;
          if (!snapshot.hasData)
            return Container(
              color: Colors.grey[900],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * mainMost,
            );
          else
            return Container(
              height: MediaQuery.of(context).size.height * mainMost,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  physics: NewPhysics(),
                  pageSnapping: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(key: ObjectKey(context), children: <Widget>[
                      FadeInImage.assetNetwork(
                        height: MediaQuery.of(context).size.height * innerMost,
                        width: MediaQuery.of(context).size.width,
                        placeholder: "images/loadingGif.gif",
                        image: Responsive.isMobile(context)
                            ? vids[index].poster
                            : vids[index].galary,
                        fit: BoxFit.cover,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height * innerMost,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: const FractionalOffset(0.0, 1.0),
                            end: const FractionalOffset(0.0, 0.0),
                            colors: [Colors.black, Colors.transparent],
                          ))),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.height * 0.55
                                : MediaQuery.of(context).size.height * 0.25,
                            0,
                            0),
                        child: Responsive(
                          mobile: Column(
                            children: [
                              Name(vids[index].name),
                              Ganeress(vids[index].genres,
                                  vids[index].genres.length),
                              Row(
                                children: [
                                  Listed(data: vids[index]),
                                  Play(),
                                  Info(data: vids[index])
                                ],
                              )
                            ],
                          ),
                          desktop: DesktopMain(data: vids[index]),
                          tablet: DesktopMain(data: vids[index]),
                        ),
                      )
                    ]);
                  }),
            );
        });
  }
}

class NewPhysics extends ScrollPhysics {
  const NewPhysics({ScrollPhysics parent}) : super(parent: parent);

  NewPhysics applyTo(ScrollPhysics ancestor) {
    return NewPhysics(parent: buildParent(ancestor));
  }

  SpringDescription get spring => const SpringDescription(
        mass: 80,
        stiffness: 100,
        damping: 1,
      );
}
