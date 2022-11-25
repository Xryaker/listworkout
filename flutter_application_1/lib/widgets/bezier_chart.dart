import 'package:flutter/material.dart';

import 'package:bezier_chart/bezier_chart.dart';

class BazierChartt extends StatelessWidget {
  const BazierChartt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      // decoration: const BoxDecoration(
      //     // gradient: LinearGradient(
      //     //   colors: [
      //     //     Colors.black54,
      //     //     Colors.black87,
      //     //     Colors.black87,
      //     //     Color.fromARGB(255, 190, 1, 1),
      //     //   ],
      //     //   begin: Alignment.topCenter,
      //     //   end: Alignment.bottomCenter,
      //     // ),
      //     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Сalorie burn chart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Center(
            child: Card(
              color: Colors.transparent,
              elevation: 12,
              child: Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: BezierChart(
                  bezierChartScale: BezierChartScale.CUSTOM,
                  selectedValue: 35,
                  xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                  footerValueBuilder: (double value) {
                    return "${formatAsIntOrDouble(value)}\ndays";
                  },
                  series: const [
                    BezierLine(
                      label: "kcal",
                      data: [
                        DataPoint<double>(value: 10, xAxis: 0),
                        DataPoint<double>(value: 130, xAxis: 5),
                        DataPoint<double>(value: 50, xAxis: 10),
                        DataPoint<double>(value: 150, xAxis: 15),
                        DataPoint<double>(value: 75, xAxis: 20),
                        DataPoint<double>(value: 0, xAxis: 25),
                        DataPoint<double>(value: 5, xAxis: 30),
                        DataPoint<double>(value: 50, xAxis: 35),
                      ],
                    ),
                  ],
                  config: BezierChartConfig(
                    startYAxisFromNonZeroValue: false,
                    bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                    footerHeight: 20,
                    verticalIndicatorStrokeWidth: 3.0,
                    verticalIndicatorColor: Colors.black26,
                    showVerticalIndicator: true,
                    verticalIndicatorFixedPosition: false,
                    displayYAxis: true,
                    stepsYAxis: 10,
                    // ignore: prefer_const_constructors
                    backgroundColor: Colors.transparent,
                    // backgroundGradient: LinearGradient(
                    //   colors: const [
                    //     Color.fromARGB(144, 158, 158, 158),
                    //     Color.fromARGB(169, 133, 133, 133),
                    //     Color.fromARGB(169, 80, 80, 80),
                    //     Color.fromARGB(169, 46, 45, 45),
                    //     Color.fromARGB(169, 18, 18, 18),
                    //   ],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    snap: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
