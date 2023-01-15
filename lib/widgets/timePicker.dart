import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  Duration timeDuration = Duration(minutes: 0);
  late Duration submittedTime = Duration(seconds: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 95,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CupertinoTimerPicker(
              initialTimerDuration: timeDuration,
              mode: CupertinoTimerPickerMode.hms,
              onTimerDurationChanged: (timeDuration) => setState(() {
                this.timeDuration = timeDuration;
              }),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              //primary: Colors.indigoAccent[100],
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: saveDuration,
            child: const Text("Submit Duration",textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),),
        )
      ],
    );
  }

  void saveDuration(){
    final submittedTime = timeDuration;
    print("time=="+formatDuration(submittedTime));
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$seconds';
  }
}
