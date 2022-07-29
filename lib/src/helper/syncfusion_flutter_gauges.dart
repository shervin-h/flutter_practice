import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SyncfusionFlutterGaugesScreen extends StatefulWidget {
  const SyncfusionFlutterGaugesScreen({Key? key}) : super(key: key);

  @override
  State<SyncfusionFlutterGaugesScreen> createState() =>
      _SyncfusionFlutterGaugesScreenState();
}

class _SyncfusionFlutterGaugesScreenState
    extends State<SyncfusionFlutterGaugesScreen> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 90,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 30, color: Colors.green),
                      GaugeRange(
                          startValue: 30, endValue: 60, color: Colors.orange),
                      GaugeRange(
                          startValue: 60, endValue: 90, color: Colors.red)
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: value)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          value.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
              Slider(
                min: 0,
                max: 90,
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
