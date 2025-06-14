import 'package:flutter/material.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:paradigma/screens/main/ui/pages/main_page.dart';
import 'package:get/get.dart';

import '../../../service/vpnService.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController();

  @override
  void initState() {
    FlutterVpn.prepare();

    // controller.jumpToPage(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final vpn_service = Get.put(VpnService());
    return Scaffold(
      appBar: AppBar(
        title: Text('paradigma'),
        centerTitle: true,

      ),
        body: PageView(
          controller: controller,
            children:[
              MainPage(),

        ]),
    );
  }
}
