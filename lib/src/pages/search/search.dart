import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/src/pages/search.dart
import '../model/SpeechApi.dart';
import 'package:avatar_glow/avatar_glow.dart';

class SearchPage extends StatefulWidget {
  final txt = TextEditingController();
  bool isListening = false;

=======
import '../../model/SpeechApi.dart';

class SearchPage extends StatefulWidget {
  final text = TextEditingController();
>>>>>>> 379a39ba2334c531549ad4f2e518b346bc0efb35:lib/src/pages/search/search.dart
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: Transform.rotate(
              angle: 3.14,
              child: IconButton(
                tooltip: "الرجوع ",
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
              controller: widget.text,
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
                  endRadius: 75,
                  glowColor: Colors.blue,
                  child: IconButton(
                    tooltip: "البحث بواسطه المايك",
                    icon: Icon(Icons.mic),
                    color: Colors.white70,
                    onPressed: toggleSpeech,
                  ))
            ],
          )),
    );
  }

  Future toggleSpeech() => SpeechApi.toggleRecording(
<<<<<<< HEAD:lib/src/pages/search.dart
        onResult: (text) => setState(() => widget.txt.text = text),
        onListening: (isListening) {
          setState(() => widget.isListening = isListening);
        },
      );
=======
      onResult: (text) => setState(() => widget.text.text = text));
>>>>>>> 379a39ba2334c531549ad4f2e518b346bc0efb35:lib/src/pages/search/search.dart
}
