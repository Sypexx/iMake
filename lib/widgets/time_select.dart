import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';

class TimeWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Color(0xffF6F2F2),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _openTimePicker(context);
              },
              child: Text("Time Picker"),
            ),
          ],
        ),
      ),
    ));
  }

  _openTimePicker(BuildContext context) {
    BottomPicker.time(
            title: "Set your next meeting time",
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black),
            onSubmit: (index) {
              print(index);
            },
            onClose: () {
              print("Picker closed");
            },
           // bottomPickerTheme: BOTTOM_PICKER_THEME.HEAVY_RAIN,
            use24hFormat: true)
        .show(context);
  }
}
