import 'dart:convert';

import 'package:congresos/models/events.dart';
import 'package:congresos/screens/speaker_detail.dart';
import 'package:flutter/material.dart';

class EventListComponent extends StatelessWidget {
  final EventsModel snapshot;

  EventListComponent(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpeakerDetailsScreen(
                      snapshot: snapshot.event[i],
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: MemoryImage(base64Decode(snapshot.event[i].speaker.photo)),
                radius: 24,
              ),
            ),
            title: Text(snapshot.event[i].name),
            subtitle: Text('${snapshot.event[i].date} | ${snapshot.event[i].place}'),
            trailing: Text(snapshot.event[i].hour),
          );
        },
        itemCount: snapshot.event.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
      ),
    );
  }
}
