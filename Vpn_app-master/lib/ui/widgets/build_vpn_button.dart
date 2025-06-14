import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work_kalchuk/provider/model_provider.dart';
import 'package:im_animations/im_animations.dart';
import 'dart:async';

class BuildVpnButton extends StatefulWidget {
  const BuildVpnButton({Key? key}) : super(key: key);

  @override
  State<BuildVpnButton> createState() => _BuildVpnButtonState();
}

class _BuildVpnButtonState extends State<BuildVpnButton> {
  @override
  Widget build(BuildContext context) {

    var modelProviderItem = Provider.of<ModelCountry>(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),),
          color: modelProviderItem.generalColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            ColorSonar(
              contentAreaRadius: 90,
              waveFall: 15,
              innerWaveColor: modelProviderItem.generalColor,
              middleWaveColor: Colors.white.withOpacity(0.4),
              outerWaveColor: Colors.white.withOpacity(0.2),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    modelProviderItem.generalColor = Colors.amber;
                    modelProviderItem.textConnect[0] = modelProviderItem.textConnect[1];
                    modelProviderItem.switchColorInRichText(Colors.amber);
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        modelProviderItem.generalColor= Colors.red;
                        modelProviderItem.textConnect[0] = modelProviderItem.textConnect[2];
                        modelProviderItem.switchColorInRichText(Colors.red);
                      });
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.power_settings_new, size: 90, color: modelProviderItem.generalColor,),
                      Text(modelProviderItem.textConnect[0], style: TextStyle(fontWeight: FontWeight.bold, color: modelProviderItem.generalColor),),
                      SizedBox(height: 5,),
                      Text('139.99.69.219', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_upward),
                      Text("4.36 MB/s", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_downward),
                      Text("2.68 MB/s", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}