import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work_kalchuk/provider/model_provider.dart';

class BuildScrollCountry extends StatefulWidget {
  const BuildScrollCountry({Key? key}) : super(key: key);

  @override
  State<BuildScrollCountry> createState() => _BuildScrollCountryState();
}

class _BuildScrollCountryState extends State<BuildScrollCountry> {
  @override
  Widget build(BuildContext context) {

    var modelProviderItem = Provider.of<ModelCountry>(context);

    return Consumer<ModelCountry>(
      builder: (context, modelCountry, child) {
        return Container(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 50,),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[0] = !modelProviderItem.selected[0];
                              if(modelProviderItem.selected[0] == true) {
                                modelProviderItem.countrySize[0] = 30.0;
                                modelProviderItem.pathImage[0] = 'assets/images/countries/canada.jpg';
                                modelProviderItem.colors[0] =modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[0] == false){
                                modelProviderItem.countrySize[0] = 16.0;
                                modelProviderItem.pathImage[0] = 'assets/images/shadowCountries/canada-black.jpeg';
                                modelProviderItem.colors[0] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[0] + 4.0,
                            backgroundColor: modelProviderItem.colors[0],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[0],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[0]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Canada', style: TextStyle(color: modelProviderItem.colors[0]),),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[1] = !modelProviderItem.selected[1];
                              if(modelProviderItem.selected[1] == true) {
                                modelProviderItem.countrySize[1] = 30.0;
                                modelProviderItem.pathImage[1] = 'assets/images/countries/russia.jpg';
                                modelProviderItem.colors[1] = modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[1] == false){
                                modelProviderItem.countrySize[1] = 16.0;
                                modelProviderItem.pathImage[1] = 'assets/images/shadowCountries/russia-black.jpeg';
                                modelProviderItem.colors[1] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[1] + 4.0,
                            backgroundColor: modelProviderItem.colors[1],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[1],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[1]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Russia', style: TextStyle(color: modelProviderItem.colors[1]),),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[2] = !modelProviderItem.selected[2];
                              if(modelProviderItem.selected[2] == true) {
                                modelProviderItem.countrySize[2] = 30.0;
                                modelProviderItem.pathImage[2] = 'assets/images/countries/japan.jpg';
                                modelProviderItem.colors[2] = modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[2] == false){
                                modelProviderItem.countrySize[2] = 16.0;
                                modelProviderItem.pathImage[2] = 'assets/images/shadowCountries/japan-black.jpeg';
                                modelProviderItem.colors[2] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[2] + 4.0,
                            backgroundColor: modelProviderItem.colors[2],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[2],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[2]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Japan', style: TextStyle(color: modelProviderItem.colors[2]),),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[3] = !modelProviderItem.selected[3];
                              if(modelProviderItem.selected[3] == true) {
                                modelProviderItem.countrySize[3] = 30.0;
                                modelProviderItem.pathImage[3] = 'assets/images/countries/usa.jpg';
                                modelProviderItem.colors[3] = modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[3] == false){
                                modelProviderItem.countrySize[3] = 16.0;
                                modelProviderItem.pathImage[3] = 'assets/images/shadowCountries/usa-black.jpeg';
                                modelProviderItem.colors[3] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[3] + 4.0,
                            backgroundColor: modelProviderItem.colors[3],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[3],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[3]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Usa', style: TextStyle(color: modelProviderItem.colors[3]),),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[4] = !modelProviderItem.selected[4];
                              if(modelProviderItem.selected[4] == true) {
                                modelProviderItem.countrySize[4] = 30.0;
                                modelProviderItem.pathImage[4] = 'assets/images/countries/uar.jpg';
                                modelProviderItem.colors[4] = modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[4] == false){
                                modelProviderItem.countrySize[4] = 16.0;
                                modelProviderItem.pathImage[4] = 'assets/images/shadowCountries/uar-black.jpeg';
                                modelProviderItem.colors[4] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[4] + 4.0,
                            backgroundColor: modelProviderItem.colors[4],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[4],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[4]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Uar', style: TextStyle(color: modelProviderItem.colors[4]),),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[5] = !modelProviderItem.selected[5];
                              if(modelProviderItem.selected[5] == true) {
                                modelProviderItem.countrySize[5] = 30.0;
                                modelProviderItem.pathImage[5] = 'assets/images/countries/india.jpg';
                                modelProviderItem.colors[5] = modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[5] == false){
                                modelProviderItem.countrySize[5] = 16.0;
                                modelProviderItem.pathImage[5] = 'assets/images/shadowCountries/india-black.jpeg';
                                modelProviderItem.colors[5] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[5] + 4.0,
                            backgroundColor: modelProviderItem.colors[5],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[5],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[5]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('India', style: TextStyle(color: modelProviderItem.colors[5]),),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              modelProviderItem.selected[6] = !modelProviderItem.selected[6];
                              if(modelProviderItem.selected[6] == true) {
                                modelProviderItem.countrySize[6] = 30.0;
                                modelProviderItem.pathImage[6] = 'assets/images/countries/germany.jpg';
                                modelProviderItem.colors[6] = modelProviderItem.generalColor;

                              }else if(modelProviderItem.selected[6] == false){
                                modelProviderItem.countrySize[6] = 16.0;
                                modelProviderItem.pathImage[6] = 'assets/images/shadowCountries/germany-black.jpeg';
                                modelProviderItem.colors[6] = Colors.transparent;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            radius: modelProviderItem.countrySize[6] + 4.0,
                            backgroundColor: modelProviderItem.colors[6],
                            child: CircleAvatar(
                              radius: modelProviderItem.countrySize[6],
                              backgroundImage: AssetImage(modelProviderItem.pathImage[6]),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Germany', style: TextStyle(color: modelProviderItem.colors[6]),),
                      ],
                    ),
                  ),
                  SizedBox(width: 50,),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
