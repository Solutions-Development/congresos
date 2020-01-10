import 'package:flutter/material.dart';

enum Filter { day, hour, place }

class EventsMenuWidget extends StatefulWidget {
  @override
  _EventsMenuWidgetState createState() => _EventsMenuWidgetState();
}

class _EventsMenuWidgetState extends State<EventsMenuWidget> {
  bool _isDaySelected = false;
  bool _isHourSelected = false;
  bool _isPlaceSelected = false;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Filter>(
      icon: Icon(Icons.filter_list),
      onSelected: (Filter result) {
        switch (result) {
          case Filter.day:
            _isHourSelected = false;
            _isPlaceSelected = false;
            _isDaySelected = !_isDaySelected;
            break;
          case Filter.hour:
            _isDaySelected = false;
            _isPlaceSelected = false;
            _isHourSelected = !_isHourSelected;
            break;
          case Filter.place:
            _isDaySelected = false;
            _isHourSelected = false;
            _isPlaceSelected = !_isPlaceSelected;
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Filter>>[
        PopupMenuItem<Filter>(
          child: ListTile(title: Text('Organizar por')),
        ),
        CheckedPopupMenuItem<Filter>(
          checked: _isDaySelected,
          value: Filter.day,
          child: Text('Día'),
        ),
        PopupMenuDivider(),
        CheckedPopupMenuItem<Filter>(
          checked: _isHourSelected,
          value: Filter.hour,
          child: Text('Hora'),
        ),
        PopupMenuDivider(),
        CheckedPopupMenuItem<Filter>(
          checked: _isPlaceSelected,
          value: Filter.place,
          child: Text('Salón'),
        ),
      ],
    );
  }
}
