
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CurveSliderScreen extends StatefulWidget {
  const CurveSliderScreen({Key? key}) : super(key: key);

  @override
  State<CurveSliderScreen> createState() => _CurveSliderScreenState();
}

class _CurveSliderScreenState extends State<CurveSliderScreen> {

  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: screenWidth * 0.6,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SleekCircularSlider(
                  initialValue: sliderValue,
                  min: 0,
                  max: 100,
                  appearance: CircularSliderAppearance(
                    spinnerMode: false,
                    customWidths: CustomSliderWidths(progressBarWidth: 2, handlerSize: 0),
                    infoProperties: InfoProperties(
                      bottomLabelText: 'Fuel'
                    ),
                    spinnerDuration: 0,
                    animDurationMultiplier: 0,
                  ),
                  onChange: (double value) {
                    // callback providing a value while its being changed (with a pan gesture)
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  onChangeStart: (double startValue) {
                    // callback providing a starting value (when a pan gesture starts)
                  },
                  onChangeEnd: (double endValue) {
                    // ucallback providing an ending value (when a pan gesture ends)
                  },
                  // innerWidget: (double value) {
                  //   // use your custom widget inside the slider (gets a slider value from the callback)
                  // },
                ),
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
