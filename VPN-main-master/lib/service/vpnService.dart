import 'dart:convert';

import 'package:dart_ping/dart_ping.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:flutter_vpn/state.dart';
import 'package:get/get.dart';
import '../model/ikev2.dart';
import '../storage/storage.dart';

class VpnService extends GetxController{
  Rx<FlutterVpnState> connectionStatus=FlutterVpnState.disconnected.obs;
  RxList<ikev2> vpnList=<ikev2>[ikev2(server: '91.149.255.155', password: 'YdNcrspkzsmgneTa', user: 'vpnuser',countryCode: 'cd',countryName: 'Canada')].obs;
  RxInt selectedIndex=(0).obs;
  RxInt connectedIndex=(-1).obs;

  @override
  void onInit() async{
    await getVpnList();
    await updVpnState();
        checkStatus();
  }

  checkStatus(){
    FlutterVpn.onStateChanged.listen((event){
      connectionStatus.value=event;
      connectionStatus.refresh();
    });

  }
  Future<void> updVpnState()async{
    connectionStatus.value = await FlutterVpn.currentState;
  }

  Future<void> getVpnList() async{
    String _temp=await LocalStorage().getHistory();
    if(_temp.isNotEmpty){
      final results =  jsonDecode(_temp) as List;
        List<ikev2> _list = List<ikev2>.from(results.map((model)=> ikev2.fromJson(model)));
        vpnList.value=_list;
      }
    else{
      vpnList.value.add(ikev2(server: 'us105.vpnsvr1.xyz', password: '1234', user: '1234',countryCode: 'us',countryName: 'USA'));
      vpnList.value.add(ikev2(server: 'us105.vpnsvr1.xyz', password: '1234', user: '1234',countryCode: 'tr',countryName: 'Turkey'));
      vpnList.value.add(ikev2(server: 'us105.vpnsvr1.xyz', password: '1234', user: '1234',countryCode: 'in',countryName: 'India'));
      vpnList.value.add(ikev2(server: 'us105.vpnsvr1.xyz', password: '1234', user: '1234',countryCode: 'af',countryName: 'Afganistan'));
      vpnList.value.add(ikev2(server: 'us105.vpnsvr1.xyz', password: '1234', user: '1234',countryCode: 'ru',countryName: 'Russia'));
    }
    vpnList.refresh();
  }

  setSelected(int index){
    selectedIndex.value=index;
    pingServerByIndex(index);
    selectedIndex.refresh();
    vpnList.refresh();
  }
  setConnectedIndex(int index){
    connectedIndex.value=index;
  }

  addVpnProfile(ikev2 data)async{
    vpnList.value.add(data);
    LocalStorage().setHistory(vpnList.value);
    vpnList.refresh();
  }
  deleteVpnProfile(int index)async{
    if(vpnList.value.length>0)
      {
        vpnList.value.removeAt(index);
        LocalStorage().setHistory(vpnList.value);
        vpnList.refresh();
      }
    selectedIndex.refresh();
    vpnList.refresh();
  }

  Future<void> pingServerByIndex(int index)async{
    final ping = Ping(vpnList.value[index].server, count: 1);
    ping.stream.listen((event) {
      // print(event);
      if(event.response!=null){
        vpnList.value[index].ping=event.response!.time!.inMicroseconds/ Duration.millisecondsPerSecond;
        vpnList.refresh();
      }
      if(event.error!=null){
        vpnList.value[index].ping=-0.0;
        vpnList.refresh();
      }
    },
      onDone: (){
      ping.stop();
      }
    );
    vpnList.refresh();
  }

}