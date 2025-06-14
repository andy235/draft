import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work_kalchuk/provider/model_provider.dart';

class BuildRichText extends StatefulWidget {
  const BuildRichText({Key? key}) : super(key: key);

  @override
  State<BuildRichText> createState() => _BuildRichTextState();
}

class _BuildRichTextState extends State<BuildRichText> {
  @override
  Widget build(BuildContext context) {

    var modelProviderItem = Provider.of<ModelCountry>(context);

    return Consumer<ModelCountry>(
      builder: (context, modelCountry, child) {
        return RichText(
            text: TextSpan(
                text: "1", style: TextStyle(color: modelProviderItem.generalColor, fontSize: 52),
                children: [
                  TextSpan(
                      text: ':', style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: '15', style: TextStyle(color: modelProviderItem.generalColor),
                            children: [
                              TextSpan(
                                  text: ':', style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: '34', style: TextStyle(color: modelProviderItem.generalColor),
                                    )
                                  ]
                              )
                            ]
                        )
                      ]
                  )
                ]
            )
        );
      },
    );
  }
}

