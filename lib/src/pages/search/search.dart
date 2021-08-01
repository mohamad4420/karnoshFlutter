import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karnosh/src/model/models.dart';
import '../../model/SpeechApi.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../../model/General_models.dart';
import '../../model/Fetch.dart';

class SearchPage extends StatefulWidget {
  final txt = TextEditingController();
  List<GeneralData> data = [];
  bool isListening = false;
  bool isSearch = false;
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Search search = Search();
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Transform.rotate(
            angle: 3.14,
            child: IconButton(
              tooltip: "الرجوع",
              color: Colors.white70,
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.black,
          title: TextFormField(
            onChanged: (data) {
              if (data.length == 0)
                this.setState(() {
                  widget.isSearch = false;
                });
              else
                this.setState(() {
                  widget.isSearch = true;
                });
              search.fetchSearch(data).then((value) => this.setState(() {
                    widget.data = value;
                  }));
            },
            controller: widget.txt,
            cursorHeight: 30,
            style: TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.white70,
                ),
                fillColor: Colors.white,
                hintText: "بحث"),
          ),
          actions: [
            AvatarGlow(
                animate: widget.isListening,
                endRadius: 40,
                glowColor: Colors.blue,
                child: IconButton(
                  tooltip: "البحث بواسطه المايك",
                  icon: Icon(Icons.mic),
                  color: Colors.white70,
                  onPressed: toggleSpeech,
                ))
          ],
        ),
        body: widget.isSearch ? BodySearch(data: widget.data) : Container(),
      ),
    );
  }

  Future toggleSpeech() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => widget.txt.text = text),
        onListening: (isListening) {
          setState(() => widget.isListening = isListening);
        },
      );
}

class BodySearch extends StatelessWidget {
  final List<GeneralData> data;
  const BodySearch({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 9 / 12,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: const EdgeInsets.all(10.0),
        itemCount: this.data.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(this.data[index].name),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(5)),
          );
        });
  }
}
