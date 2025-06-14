import 'package:carousel_slider/carousel_slider.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:paradigma/common/uiTheme.dart';
import 'package:paradigma/service/vpnService.dart';
import '../../../model/ikev2.dart';
import 'package:get/get.dart';

List<Widget> getList(List<ikev2> data){
  List<Widget> _list=[];
  data.forEach((element) {
    _list.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent
              ),
              borderRadius: BorderRadius.all(Radius.circular(100))
          ),
          child: Flag.fromString(
            element.countryCode,
            // height: 10,
            // width: 100,
            fit: BoxFit.fill,
            borderRadius: 100,
          ),
        ),
      ),
    );
  });

  return _list;
}

class ListVpn extends StatefulWidget {
  List<ikev2> data;
  ListVpn({Key? key,required this.data}) : super(key: key);

  @override
  State<ListVpn> createState() => _ListVpnState();
}

class _ListVpnState extends State<ListVpn> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: UiTheme.textLightGreen,
                    width: 5.0
                ),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            height: 90,width: 90
        ),
        ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 100,
                  enlargeCenterPage: true,
                  viewportFraction: 0.2,
                  scrollDirection: Axis.horizontal,
                  enlargeFactor: 0.2,
                onPageChanged: (index, CarouselPageChangedReason){
                    Get.find<VpnService>().setSelected(index);
                }
                // autoPlay: true,
              ),
              items: getList(widget.data),
            ),
      ],
    );
  }
}
