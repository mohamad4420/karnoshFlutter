import 'package:flutter/material.dart';

class Listed extends StatefulWidget {
  Listed({Key key}) : super(key: key);
  @override
  _ListedState createState() => _ListedState();
}

class _ListedState extends State<Listed>
    with AutomaticKeepAliveClientMixin<Listed> {
  bool _isListed = false;
  Widget build(BuildContext context) {
    super.build(context);
    void _setListed() {
      setState(() {
        print(_isListed);
        _isListed = !_isListed;
      });
    }

    return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.33),
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            _setListed();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isListed ? Icons.check : Icons.add,
                color: _isListed ? Colors.green : Colors.white70,
              ),
              Text(_isListed ? 'تم الاضافة' : 'اضافة',
                  style: TextStyle(
                      color: _isListed ? Colors.green : Colors.white70))
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
