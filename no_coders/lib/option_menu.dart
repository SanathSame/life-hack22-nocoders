import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:no_coders/controllers/options_controller.dart';

class OptionsMenu extends StatefulWidget {
  const OptionsMenu({Key? key}) : super(key: key);

  @override
  State<OptionsMenu> createState() => _OptionsMenuState();
}

class _OptionsMenuState extends State<OptionsMenu> {
  @override
  void initState() {
    Get.put(OptionsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff454955),
          leading: GestureDetector(
              onTap: () => Get.back(), child: Icon(Icons.arrow_back_ios)),
          actions: [
            Icon(Icons.help),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: Text("What material is your item made of?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF454955),
                  fontSize: 23,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Text("Select an item",
              style: TextStyle(
                color: Color(0xFFb7b7b7),
                fontSize: 15,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GreenButton(
                        category: "Plastic",
                      ),
                      GreenButton(category: "Cardboard")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GreenButton(
                        category: "Glass",
                      ),
                      GreenButton(category: "Paper")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GreenButton(
                        category: "Metal",
                      ),
                      GreenButton(category: "Cloth")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )),
          LongGreenButton(category: "Is my item recyclable?")
        ]),
      ),
    );
  }
}

class GreenButton extends StatefulWidget {
  GreenButton({Key? key, required this.category}) : super(key: key);
  String category;

  @override
  State<GreenButton> createState() => _GreenButtonState();
}

class _GreenButtonState extends State<GreenButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OptionsController>(
      builder: (optionsCon) => GestureDetector(
        onTap: (() {
          optionsCon.changeSelection(widget.category);
        }),
        child: Container(
          height: 45,
          width: 125,
          decoration: BoxDecoration(
              color: (optionsCon.currentSelection == widget.category)
                  ? const Color(0xff73937e)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: (optionsCon.currentSelection == widget.category)
                      ? Colors.transparent
                      : const Color(0xff73937e),
                  width: 2)),
          child: Center(
            child: Text(widget.category,
                style: TextStyle(
                  color: (optionsCon.currentSelection == widget.category)
                      ? Colors.white
                      : const Color(0xff73937e),
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ),
    );
  }
}

class LongGreenButton extends StatefulWidget {
  LongGreenButton({Key? key, required this.category}) : super(key: key);

  String category;

  @override
  State<LongGreenButton> createState() => _LongGreenButtonState();
}

class _LongGreenButtonState extends State<LongGreenButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OptionsController>(
      builder: (optionsCon) => GestureDetector(
        onTap: (() {
          if (optionsCon.currentSelection.isNotEmpty) {}
        }),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Container(
            height: 45,
            child: Center(
              child: Text(widget.category,
                  style: TextStyle(
                    color: (optionsCon.currentSelection.isNotEmpty)
                        ? Colors.white
                        : Color(0xff73937e),
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  )),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                  color: (optionsCon.currentSelection.isNotEmpty)
                      ? Colors.transparent
                      : const Color(0xff73937e),
                  width: 2),
              color: (optionsCon.currentSelection.isNotEmpty)
                  ? const Color(0xff73937e)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
