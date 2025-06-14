import 'dart:async';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:test_work_kalchuk/provider/model_provider.dart';
import 'package:test_work_kalchuk/ui/widgets/build_appbar.dart';
import 'package:test_work_kalchuk/ui/widgets/build_rich_text.dart';
import 'package:test_work_kalchuk/ui/widgets/build_scroll_country.dart';
import 'package:test_work_kalchuk/ui/widgets/build_vpn_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0c0c0c),
      appBar: BuildAppBar(),
      body: Stack(
        children: [
          Image(image: AssetImage("assets/images/karta-mira-chernyi-fon-zemlia.jpg"),),
          Column(
            children: [
              SizedBox(height: 50,),
              BuildScrollCountry(),
              SizedBox(height: 50,),
              BuildRichText(),
              SizedBox(height: 50,),
              BuildVpnButton(),
            ],
          )
        ],
      ),
    );
  }
}
