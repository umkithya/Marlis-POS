import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/values/app_colors.dart';

class PandaBarButton extends StatefulWidget {
  final String svgImage;
  final String title;
  final bool isSelected;

  final VoidCallback? onTap;

  final Color? selectedColor;
  final Color? unselectedColor;

  const PandaBarButton(
      {Key? key,
      this.isSelected = false,
      this.svgImage = '',
      this.selectedColor,
      this.unselectedColor,
      this.title = '',
      this.onTap})
      : super(key: key);

  @override
  _PandaBarButtonState createState() => _PandaBarButtonState();
}

class _PandaBarButtonState extends State<PandaBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 10), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 10, end: 0), weight: 50),
    ]).chain(CurveTween(curve: Curves.bounceOut)).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkResponse(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onTap as void Function(),
        onHighlightChanged: (touched) {
          if (!touched) {
            // animationController.forward().whenCompleteOrCancel(() {
            //   animationController.reset();
            // });
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.svgImage,
                color: widget.isSelected
                    ? (widget.selectedColor ??
                        const Color.fromARGB(255, 248, 248, 248))
                    : (widget.unselectedColor ?? AppColors.colorUnselect)),
            Container(
              height: animation.value,
            ),
            Text(widget.title,
                style: TextStyle(
                    color: widget.isSelected
                        ? (widget.selectedColor ??
                            const Color.fromARGB(255, 255, 255, 255))
                        : (widget.unselectedColor ?? const Color(0xFF9FACBE)),
                    fontWeight: FontWeight.bold,
                    fontSize: 10))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
