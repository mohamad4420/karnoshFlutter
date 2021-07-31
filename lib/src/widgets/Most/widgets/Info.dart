import 'package:flutter/material.dart';
import '../../../model/models.dart';
import '../../../pages/SelectionPage.dart';

class Info extends StatelessWidget {
  final VidModels data;
  const Info({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.33,
          height: 70,
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectionPage(
                          data: data,
                        )),
              );
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
          )),
    );
  }
}
