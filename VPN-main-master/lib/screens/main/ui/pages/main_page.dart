import 'package:carousel_slider/carousel_slider.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:flutter_vpn/state.dart';
import 'package:get/get.dart';
import 'package:paradigma/common/uiTheme.dart';
import 'package:paradigma/service/vpnService.dart';

import '../../widgets/list_vpn.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CarouselController _controller = CarouselController();
   VpnService vpnServicrX=Get.find<VpnService>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 2,child:
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    child:
                  Image(image: AssetImage('assets/world_map.png'),fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,8,0),
                    child:
                        Obx((){
                          return
                            PingWidget(
                              ping: vpnServicrX.vpnList.value[vpnServicrX.selectedIndex.value].ping.toString()+' ms',
                            );
                        }),
                  ),
                ],
              )
              ),
              Container(
                height: 100,
                child:
                    Obx((){
                      if( Get.find<VpnService>().vpnList.isNotEmpty)
                        {
                          return
                            ListVpn(data: Get.find<VpnService>().vpnList,);
                        }
                      else {
                    return Container(child: Center(child: Text('Пусто',style: Get.textTheme.headline1,)),);
                  }
                }),
              ),

            ],
          ),
        )),
        Divider(),
        Expanded(child:
        Container(
          child: Column(
            children: [
              Obx((){
                return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Get.find<VpnService>().vpnList.value[Get.find<VpnService>().selectedIndex.value].countryName!,style: Get.textTheme.headline1,),
                  );
              }),

              Expanded(
                child:
                    Obx((){
                      if(vpnServicrX.connectionStatus.value==FlutterVpnState.disconnected)
                        {
                          return
                            ElevatedButton(onPressed: (){
                              vpnServicrX.setConnectedIndex(vpnServicrX.selectedIndex.value);
                              FlutterVpn.disconnect();
                              FlutterVpn.connectIkev2EAP(
                                  server: vpnServicrX.vpnList.value[vpnServicrX.connectedIndex.value].server,
                                  username: vpnServicrX.vpnList.value[vpnServicrX.connectedIndex.value].user,
                                  password: vpnServicrX.vpnList.value[vpnServicrX.connectedIndex.value].password);

                            },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: UiTheme.selectColor,
                                  shape: const CircleBorder(),
                                ),
                                child:
                                Container(
                                  child: Center(child: Icon(Icons.key_off,size:100,),),
                                )
                            );
                        }
                      else{
                        return
                          ElevatedButton(onPressed: (){
                            if(vpnServicrX.connectionStatus.value==FlutterVpnState.disconnected)
                            {
                              FlutterVpn.connectIkev2EAP(
                                  server: vpnServicrX.vpnList.value[vpnServicrX.selectedIndex.value].server,
                                  username: vpnServicrX.vpnList.value[vpnServicrX.selectedIndex.value].user,
                                  password: vpnServicrX.vpnList.value[vpnServicrX.selectedIndex.value].password);
                            }
                            if(vpnServicrX.connectionStatus.value==FlutterVpnState.connecting){
                              FlutterVpn.disconnect();
                            }
                            if(vpnServicrX.connectionStatus.value==FlutterVpnState.connected){
                              FlutterVpn.disconnect();
                            }
                            if(vpnServicrX.connectionStatus.value==FlutterVpnState.error){
                              FlutterVpn.disconnect();
                            }
                          },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: UiTheme.selectColor,
                                shape: const CircleBorder(),
                              ),
                              child:
                              Container(
                                child: Center(child: Icon(Icons.key,size:100,color: UiTheme.textLightGreen,),),
                              )
                          );

                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: UiTheme.selectColor,

                      // shape: const CircleBorder(),
                    ),
                    child:
                    Text('Получить бесконечный доступ'),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}

class PingWidget extends StatelessWidget {
  String ping;
  PingWidget({
    Key? key,
    required this.ping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 20,child:Text(ping,style: Get.textTheme.headline3,textAlign: TextAlign.end,),);
  }
}

