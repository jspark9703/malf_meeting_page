import '../data/json_data.dart';
import '../network/network.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MeetingPage extends StatefulWidget {
  MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<MeetingData> _jsonData = List.empty();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network.getInfo().then((value) {
      setState(() {
        _jsonData = value.data;
        loading = true;
      });
    });

    print(_jsonData[0]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // 뒤로가기 버튼 기능 구현
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // 더보기 버튼 기능 구현
              },
            ),
          ],
        ),
        body: SlidingUpPanel(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage('assets/v.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          parallaxEnabled: true,
          parallaxOffset: 0.3,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          minHeight: MediaQuery.of(context).size.height / 1.8,
          maxHeight: MediaQuery.of(context).size.height,
          panelBuilder: (sc) => PanelWidget(
            controller: sc,
            meetingData: _jsonData[0],
          ),
          collapsed: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          footer: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // 좋아요 버튼 기능 구현
                  },
                  icon: Icon(Icons.thumb_up),
                  label: Text('좋아요'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 참여하기 버튼 기능 구현
                  },
                  child: Text('참여하기'),
                ),
              ],
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  MeetingData meetingData;
  PanelWidget({Key? key, required this.controller, required this.meetingData})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("${widget.meetingData.authorNickname}"),
              Text('context'),
              Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('data'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text('종로삼가'),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('data'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text('종로삼가'),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('data'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text('종로삼가'),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_searching_sharp),
                          Text('data'),
                        ],
                      ),
                    ),
                    horizontalTitleGap: 20,
                    title: Text('종로삼가'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(),
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('data'),
                  ),
                  Row(
                    children: [
                      Text('이름'),
                      Icon(Icons.abc),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "내용ㅁㅇㄶㅇㅁㄶㄴㅁㅇㅎㅁㄴㅇㅎㄻㄴㅇㅎㅁㄴㅇㅎㄴㅇㅎㅁㄴdsagajdsklsdglkㅁㄴ아ㅓㅎㅁㅇ노ㅗㄴ외ㅚㅣㅘㅣㅘㅘㅎㄴㅇㅁㄹ",
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image(image: AssetImage("assets/v.jpg")),
        ),
      ],
    );
  }
}
