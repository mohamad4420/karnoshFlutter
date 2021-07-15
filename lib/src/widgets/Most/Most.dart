import 'package:karnosh/src/widgets/Most/widgets/Desktop/DesktopMain.dart';
import './widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/physics.dart';
import 'package:readmore/readmore.dart';
import '../responsive.dart';

class Most extends StatelessWidget {
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    var mainMost;
    var innerMost;
    if (Responsive.isMobile(context)) {
      mainMost = 0.8;
      innerMost = 0.7988;
    } else {
      mainMost = 0.95;
      innerMost = 0.948;
    }

    return FutureBuilder(
        future: fetchApi.fetchVid('anime', true, null),
        builder: (context, snapshot) {
          var vids = snapshot.data;
          if (!snapshot.hasData)
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * mainMost,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 20)
                  ],
                ),
                height: MediaQuery.of(context).size.height * innerMost,
                width: MediaQuery.of(context).size.width,
              ),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF212121),
                                offset: Offset(0, 1),
                                blurRadius: 3)
                          ],
                          image: DecorationImage(
                            image: Responsive.isMobile(context)
                                ? NetworkImage(vids[index].poster)
                                : NetworkImage(vids[index].galary),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * innerMost,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height * innerMost,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
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
                              PlayAndListAndInfo()
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

class PlayAndListAndInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: [Listed(), Play(), Info()],
    );
  }
}

class Discription extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: ReadMoreText(
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Time extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "الوقت :",
            style: TextStyle(color: Colors.white60),
          ),
          Text(
            "18min",
            style: TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
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
