import 'package:flutter/material.dart';
import 'package:karnosh/src/pages/search.dart';
import './src/body.dart';
import '/src/pages/search.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

var mediaQueryData;
var colorMenu = Colors.transparent;
var colorMenuSlide = Colors.black;
var homeColor = Colors.black;

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'karnosh',
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              body: HomePage(),
            )));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//0xFF212121
  //final List<String> listGen = List.generate(10, (index) => 'Text $index');
  var botIndex = 0;

  Widget build(BuildContext context) {
    mediaQueryData ??= MediaQuery.of(context);

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [MainAppBar()],
      body: Stack(
        children: [
          Mybody(),
          SecundAppBar(),
        ],
      ),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.dark,
      backgroundColor: colorMenu,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(width: 20, image: AssetImage("images/favicon.png")),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: Icon(Icons.search)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image(
                  width: 30, image: AssetImage('images/AccountImage.png'))),
        ),
      ],
    );
  }
}

class SecundAppBar extends StatelessWidget {
  const SecundAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.black.withOpacity(0.5),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "افلام",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "مسلسلات",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "انمي",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
        ],
      ),
    );
  }
}

class TestAppBar extends StatelessWidget {
  const TestAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = <String>['Tab 1', 'Tab 2'];
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title:
                      const Text('Books'), // This is the title in the app bar.
                  pinned: true,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  bottom: TabBar(
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // This Builder is needed to provide a BuildContext that is
                  // "inside" the NestedScrollView, so that
                  // sliverOverlapAbsorberHandleFor() can find the
                  // NestedScrollView.
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          // In this example, the inner scroll view has
                          // fixed-height list items, hence the use of
                          // SliverFixedExtentList. However, one could use any
                          // sliver widget here, e.g. SliverList or SliverGrid.
                          sliver: SliverFixedExtentList(
                            // The items in this example are fixed to 48 pixels
                            // high. This matches the Material Design spec for
                            // ListTile widgets.
                            itemExtent: 48.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                // This builder is called for each child.
                                // In this example, we just number each list item.
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              // The childCount of the SliverChildBuilderDelegate
                              // specifies how many children this inner list
                              // has. In this example, each tab has a list of
                              // exactly 30 items, but this is arbitrary.
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
