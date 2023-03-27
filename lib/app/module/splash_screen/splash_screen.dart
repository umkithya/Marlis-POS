import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // video controller
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/splash-animated.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async {
    // playing video
    _controller?.play();

    //add delay till video is complite
    await Future.delayed(const Duration(seconds: 4));

    // navigating to home screen
    // Navigator.pushNamed(context, '/');
    if (context.mounted) {
      context.go("/dashboard");
    }
  }

  @override
  void dispose() {
    debugPrint("DISPOSE");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    // _controller!.dispose();
    _controller = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      body: _controller == null
          ? const SizedBox()
          : Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(
                        _controller!,
                      ),
                    )
                  : Container(),
            ),
    );
  }
}
