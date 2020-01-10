import 'dart:async';
import 'dart:convert';

import 'package:congresos/api/fetch_data.dart';
import 'package:congresos/models/events.dart';
import 'package:congresos/podo/screen_arguments.dart';
import 'package:congresos/screens/speaker_detail.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart';

class SpeakersScreen extends StatefulWidget {
  static const String id = '/speaker';

  @override
  _SpeakersScreenState createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: FutureBuilder<List<EventsModel>>(
        future: fetchEvents(Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(
              extractSpeakersName(snapshot.data),
              extractSpeakersPhotos(snapshot.data),
              extractEvents(snapshot.data),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  List<Events> extractEvents(List<EventsModel> events) {
    List<Events> list = [];
    for (EventsModel event in events) {
        event.event.forEach((i)=>list.add(i));
    }
    return list;
  }

  List extractSpeakersPhotos(List<EventsModel> events) {
    List list = [];
    for (EventsModel event in events) {
      for (int i = 0; i < event.event.length; i++) {
        list.add(event.event[i].speaker.photo);
      }
    }
    return list;
  }

  List extractSpeakersName(List<EventsModel> events) {
    List list = [];
    for (EventsModel event in events) {
      for (int i = 0; i < event.event.length; i++) {
        list.add(event.event[i].speaker.speakerName);
      }
    }
    print(list.length);
    return list;
  }

  ListView buildListView(List names, List photos, List<Events> events) =>
      ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                names[index],
                style: Theme.of(context).textTheme.body1,
              ),
              leading: CircleAvatar(
                backgroundImage: MemoryImage(base64Decode(photos[index])),
                radius: 24,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpeakerDetailsScreen(
                    snapshot: events[index],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: names.length,
      );
}
