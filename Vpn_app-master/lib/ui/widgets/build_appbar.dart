import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSize {
  const BuildAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget get child => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff0c0c0c),
      elevation: 0,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
            text: 'X',
            style: TextStyle(
              fontSize: 36,
              color: Colors.yellow[700],
            ),
            children: [
              TextSpan(
                text: 'vpn',
                style: TextStyle(color: Colors.white, fontSize: 32),
              )
            ]
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          child: ImageIcon(AssetImage("assets/icons/icons8-grid-2-96.png")),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff25252c)),
              foregroundColor: MaterialStateProperty.all(Color(0xffdbc261)),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ),
        ),
      ),
      actions: [
        Container(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              child: ImageIcon(AssetImage("assets/icons/icons8-crown-67.png")),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffdbc261)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  fixedSize: MaterialStateProperty.all(Size(-1000, 100))
              ),
            ),
          ),
        ),
      ],
    );
  }
}
