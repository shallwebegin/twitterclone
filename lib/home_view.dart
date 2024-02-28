import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _githubPhotoUrl = 'https://picsum.photos/200/300';
  int defaultTabLength = 4;
  late ScrollController scrollController;
  String dummyTweet =
      "A group of physicians has volunteered to vaccinate migrants against the flu for free, but US Customs and Border Protection is all but certain to say no to the offer. \"We haven't responded, but it's not likely to happen,\" a CBP official told CNN.";
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: SafeArea(
        child: DefaultTabController(
          length: defaultTabLength,
          child: Column(
            children: <Widget>[
              _containerAppbar,
              _tabbarItems,
              Expanded(child: _expandedListView),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.adb),
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );
  Widget get _containerAppbar => Container(
        height: 50,
        child: _appBar,
      );
  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(_githubPhotoUrl),
          ),
          Text(
            'Home',
            style: titleTextStyle,
          )
        ],
      );

  Widget get _tabbarItems => const TabBar(
        tabs: <Widget>[
          Tab(icon: Icon(Icons.dashboard)),
          Tab(icon: Icon(Icons.radar)),
          Tab(icon: Icon(Icons.satellite)),
          Tab(icon: Icon(Icons.aspect_ratio)),
        ],
      );
  Widget get _expandedListView => Expanded(child: _listView);
  Widget get _listView => ListView.builder(
        controller: scrollController,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );
  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_githubPhotoUrl),
          ),
          title: Wrap(
            runSpacing: 5,
            children: <Widget>[
              _listCardTitle('Hello'),
              Text(dummyTweet),
              _placeHolderField,
              _footerButtonRow,
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );
  Widget get _placeHolderField => Container(
        height: 100,
        child: const Placeholder(),
      );

  Widget get _footerButtonRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: <Widget>[
          const Icon(
            Icons.comment,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );
  Widget get _iconLabelButton => InkWell(
        child: _iconLabel('1'),
        onTap: () {},
      );
}

const titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black);
