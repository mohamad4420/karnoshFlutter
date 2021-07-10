import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @required
  final List<String>? searchList;
  Search({this.searchList});
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  String selected = '';
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Text(
        selected,
        style: TextStyle(fontSize: 55),
      ),
    );
  }

  final List<String> recent = ['Text 3', 'Text 4'];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> Suggestions = [];
    query.isEmpty
        ? Suggestions = recent
        : Suggestions.addAll(
            searchList!.where((element) => element.contains(query)));
    return ListView.builder(
      itemCount: Suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(Suggestions[index]),
          onTap: () {
            selected = Suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
