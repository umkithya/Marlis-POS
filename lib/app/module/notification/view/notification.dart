import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

import '../../../core/values/app_colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );
  final _controller1 = CircleColorPickerController(
    initialColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColors.colorBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          Center(
            child: CircleColorPicker(
              strokeWidth: 10,
              controller: _controller,
              onChanged: (color) {
                setState(() => appColors.colorPrimary.value = color);
              },
            ),
          ),
          const SizedBox(height: 48),
          Center(
            child: CircleColorPicker(
              strokeWidth: 10,
              controller: _controller1,
              onChanged: (color) {
                setState(() => appColors.colorBackground = color);
              },
            ),
          ),
        ],
      ),
    );
  }
}
