import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import 'button.view.dart';

class PandaBar extends StatefulWidget {
  final Color? backgroundColor;
  final List<PandaBarButtonData> buttonData;
  final Widget? fabIcon;

  final Color? buttonColor;
  final Color? buttonSelectedColor;
  final List<Color>? fabColors;

  final Function(dynamic selectedPage) onChange;
  final VoidCallback? onFabButtonPressed;

  const PandaBar({
    Key? key,
    required this.buttonData,
    required this.onChange,
    this.backgroundColor,
    this.fabIcon,
    this.fabColors,
    this.onFabButtonPressed,
    this.buttonColor,
    this.buttonSelectedColor,
  }) : super(key: key);

  @override
  _PandaBarState createState() => _PandaBarState();
}

class _PandaBarState extends State<PandaBar> {
  final double fabSize = 50;
  final Color unSelectedColor = Colors.grey;

  dynamic selectedId;

  @override
  void initState() {
    selectedId =
        widget.buttonData.isNotEmpty ? widget.buttonData.first.id : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clipper = _PandaBarClipper(fabSize: fabSize);

    return CustomPaint(
      painter: _ClipShadowPainter(
        shadow: const Shadow(
            color: Colors.grey, blurRadius: 10, offset: Offset(0, -3)),
        clipper: clipper,
      ),
      child: ClipPath(
        clipper: clipper,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: widget.backgroundColor ?? AppColors.colorPrimary,
          child: Builder(builder: (context) {
            List<Widget> leadingChildren = [];
            List<Widget> trailingChildren = [];

            widget.buttonData.asMap().forEach((i, data) {
              Widget btn = PandaBarButton(
                svgImage: data.svgimage,
                title: data.title,
                isSelected: data.id != null && selectedId == data.id,
                unselectedColor: widget.buttonColor,
                selectedColor: widget.buttonSelectedColor,
                onTap: () {
                  setState(() {
                    selectedId = data.id;
                  });
                  widget.onChange(data.id);
                },
              );

              if (i < 2) {
                leadingChildren.add(btn);
              } else {
                trailingChildren.add(btn);
              }
            });

            return Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: leadingChildren,
                  ),
                ),
                Container(
                  width: fabSize,
                  // color: Colors.pink,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: trailingChildren,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _PandaBarClipper extends CustomClipper<Path> {
  final double fabSize;
  final double padding = 50;
  final double centerRadius = 50;
  final double cornerRadius = 5;

  _PandaBarClipper({this.fabSize = 50});

  @override
  Path getClip(Size size) {
    final xCenter = (size.width / 2);

    final fabSizeWithPadding = fabSize + padding;

    final path_0 = Path();
    path_0.moveTo(0, size.height * 0.9870908);
    path_0.lineTo(0, size.height * 0.0002480526);
    path_0.lineTo(size.width * 0.3573333, size.height * 0.0002480526);
    path_0.cubicTo(
        size.width * 0.3680000,
        size.height * 0.0002480526,
        size.width * 0.3773333,
        size.height * 0.05287974,
        size.width * 0.3773333,
        size.height * 0.07261645);
    path_0.cubicTo(
        size.width * 0.3800000,
        size.height * 0.3423526,
        size.width * 0.4226667,
        size.height * 0.5002487,
        size.width * 0.4506667,
        size.height * 0.5528803);
    path_0.cubicTo(
        size.width * 0.4730667,
        size.height * 0.5949855,
        size.width * 0.5053333,
        size.height * 0.5704237,
        size.width * 0.5186667,
        size.height * 0.5528803);
    path_0.cubicTo(
        size.width * 0.5813333,
        size.height * 0.4278803,
        size.width * 0.5893333,
        size.height * 0.1515645,
        size.width * 0.5906667,
        size.height * 0.07261645);
    path_0.cubicTo(
        size.width * 0.5917333,
        size.height * 0.009458579,
        size.width * 0.6053333,
        size.height * -0.001944934,
        size.width * 0.6120000,
        size.height * 0.0002480526);
    path_0.lineTo(size.width, size.height * 0.0002480526);
    path_0.lineTo(size.width, size.height * 0.9870908);
    path_0.lineTo(0, size.height * 0.9870908);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

class _ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PandaBarButtonData {
  final dynamic id;
  final String svgimage;
  final String title;

  PandaBarButtonData({
    this.id,
    this.svgimage = '',
    this.title = '',
  });
}
