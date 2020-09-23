import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;
  Animation<double> animation2;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 2),
      // This takes in the TickerProvider, which is this _AnimationPageState object
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      });
    animation2 = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      });
    // Goes from 0 to 1, we'll do something with these values later on
    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("s"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(0.0, animation2.value * 50),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Opacity(
                opacity: animation.value / 1,
                child: Text(
                  "mahmoud",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
