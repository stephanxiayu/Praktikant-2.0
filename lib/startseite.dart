
import 'package:flutter/material.dart';
import 'package:praktikant/home.dart';
import 'package:video_player/video_player.dart';
import 'package:twinkle_button/twinkle_button.dart';

class VideoTest extends StatefulWidget {
  @override
  _VideoTestState createState() => _VideoTestState();
}

class _VideoTestState extends State<VideoTest> {
  VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
  
    _controller = VideoPlayerController.asset("lib/assets/aa.mp4")
      ..initialize().then((_) {
     
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // TODO 6: Create a Stack Widget
        body: Stack(children: <Widget>[
      // TODO 7: Add a SizedBox to contain our video.
      SizedBox.expand(
        child: FittedBox(
          // If your background video doesn't look right, try changing the BoxFit property.
          // BoxFit.fill created the look I was going for.
          fit: BoxFit.fill,
          child: SizedBox(
            width: _controller.value.size?.width ?? 0,
            height: _controller.value.size?.height ?? 0,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
      
      Positioned(child: AppBar(title: Center(child: Text("Entdecke dein TAG", style: TextStyle(fontSize: 35),)),
      backgroundColor: Colors.transparent,
      elevation: 8,
      )),
      Align(alignment: Alignment.bottomCenter,
  child:   Row(mainAxisAlignment: MainAxisAlignment.center,
  
  crossAxisAlignment: CrossAxisAlignment.center,
  
    children:[  Container(
                  
                       
                            height: 100,
    
      child: TwinkleButton(
  buttonTitle: Text(
    'Starte JETZT',
    style: TextStyle(
      color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 17.0,
        ),
    ),
    buttonColor: Colors.red,
    onclickButtonFunction: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        ),
      
    
)
    ),]
  
  ),
),
    ]));
      @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  }
}
