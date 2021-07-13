import './widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/physics.dart';

class Most extends StatefulWidget {
  _MostState createState() => _MostState();
}

class _MostState extends State<Most> {
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();

    return FutureBuilder(
        future: fetchApi.fetchVid("getMost"),
        builder: (context, snapshot) {
          var vids = snapshot.data;
          if (!snapshot.hasData)
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(child: CircularProgressIndicator()),
            );
          else
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
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
                                color: Color(0xFF000000),
                                offset: Offset(0, 1),
                                blurRadius: 10)
                          ],
                          image: DecorationImage(
                            image: NetworkImage(vids[index].poster),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.66,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.66,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: const FractionalOffset(0.0, 1.0),
                                end: const FractionalOffset(0.0, 0.0),
                                colors: [Color(0xFF212121), Colors.transparent],
                              ))),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.height * 0.45, 0, 0),
                        child: Column(
                          children: [
                            Name(vids[index].name),
                            Ganeress(
                                vids[index].Genres, vids[index].Genres.length),
                            PlayAndListAndInfo()
                          ],
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
      child: Text(
        "بعد اندلاع الزومبي في لاس فيغاس,تقوم مجموعة من المرتزقة بالمجازفة النهائية,المغامرة في منطقة الحجر الصحي لسحب أعظم محاولة سرقة على الإطلاق.",
        style: TextStyle(color: Colors.white60),
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

  @override
  NewPhysics applyTo(ScrollPhysics ancestor) {
    return NewPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 80,
        stiffness: 100,
        damping: 1,
      );
}
