import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class PandaBarFabButton extends StatefulWidget {
  final double size;
  final VoidCallback? onTap;
  final List<Color>? colors;
  final String? svgimage;

  const PandaBarFabButton({
    Key? key,
    required this.size,
    required this.onTap,
    this.colors,
    this.svgimage,
  }) : super(key: key);

  @override
  _PandaBarFabButtonState createState() => _PandaBarFabButtonState();
}

class _PandaBarFabButtonState extends State<PandaBarFabButton> {
  bool _touched = false;

  @override
  Widget build(BuildContext context) {
    final colors = widget.colors ??
        [
          const Color(0xFF0286EA),
          const Color(0xFF27A1FE),
        ];

    return InkResponse(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.onTap as void Function(),
      onHighlightChanged: (touched) {
        setState(() {
          _touched = touched;
        });
      },
      child: Container(
        width: _touched ? widget.size - 1 : widget.size,
        height: _touched ? widget.size - 1 : widget.size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: _touched ? colors : colors.reversed.toList()),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, blurRadius: 5, offset: Offset(3, 3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.svgimage!),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Sales",
              style: Theme.of(context).primaryTextTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
