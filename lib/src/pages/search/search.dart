import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karnosh/src/model/models.dart';
import '../SelectionPage/SelectionPage.dart';
import '../../model/SpeechApi.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../../model/General_models.dart';
import '../../model/Fetch.dart';
import '../../widgets/InfoSmall.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
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
            onChanged: (data) async {
              if (data.length == 0)
                this.setState(() {
                  widget.isSearch = false;
                });
              else {
                this.setState(() {
                  widget.isSearch = true;
                });
                List<GeneralData> dataa = await search.fetchSearch(data);
                this.setState(() {
                  widget.data = dataa;
                });
              }
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
        onResult: (text) {
          setState(() {
            widget.txt.text = text;
          });
        },
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                //Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectionPage(
                              data: data[index],
                            )));
              },
              onLongPress: () {
                return bottomSliderMost(context, data[index]);
              },
              child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ),
                  imageUrl: data[index].poster,
                  fit: BoxFit.fill),
            ),
          );
        });
  }
}
