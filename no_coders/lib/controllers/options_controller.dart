import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:no_coders/extensions/extensions.dart';
import 'package:no_coders/image_controller.dart';

class OptionsController extends GetxController {
  ImageController imageCon = Get.find<ImageController>();

  String currentSelection = "";
  late String description;
  late String howToRecycle;
  late bool isRecyclable;
  bool canProceed = false;

  Map<String, Map> dictMap = {
    "Plastic Bottle": {
      "howToRecycle":
          "Given the nature of recycling, always remember to clean the water bottle before you recycle it. This is to prevent the contamination of the other items in the recycling bin. If the bottle still contains a lot of dirt that can’t be removed, it would be best to throw it away instead.",
      "isRecyclable": true,
      "description":
          "Plastics are used in our daily lives, but are all plastics recycled once in the recycling bin? Sadly, no, because the fact is that not all plastics are recyclable...\n\nThere are two types of plastics, mainly thermoset and and thermo plastics. Thermoset are plasters that can be heated and remoulded into new products."
    },
    "Laptop": {
      "howToRecycle":
          "Because of the severe consequences from not handling E-waste properly, E-waste have a dedicated E-waste bin for recycling of E-waste. Do find out the nearest E-waste bin in your area. Most of the time, community centres have one such bin. Your efforts to dispose these items properly will not only prevent the environment from more harm, but also help to conserve our resources.",
      "isRecyclable": true,
      "description":
          "E-Waste refer to electronic waste, be it spoilt laptops, or used batteries. Most of these E-waste cannot be directly recycled. This is because the E-waste would emit out toxic substances if not handled properly. Such leakages will pollute and damage the environment further."
    },
    "Wine glass": {
      "howToRecycle":
          "Given the nature of recycling, always remember to clean your items made of glass before disposing to prevent contamination of other items. Also, given how fragile glass is, do handle it properly and package it properly when disposing. This is to prevent injuries for you and the collectors. Thank you for your efforts in conserving the environment.",
      "isRecyclable": true,
      "description":
          "Glass can actually be recycled too! Do you know glass made of recycled glass reduces related air pollution by 20% and water pollution by 50%? In fact, glass can be directly recycled by disposing in the blue bin directly."
    },
    "Toothbrush": {
      "howToRecycle":
          "Toothbrushes come in all shapes and sizes. They are usually made out common materials which aren't biodegradable, so they take years to break down if not disposed of properly. By recycling, used materials from toothbrushes get converted into new products, reducing consumption of natural resource and reduces greenhouse gas emissions.",
      "isRecyclable": true,
      "description":
          "Old toothbrushes can be repurposed for household chores! Alternatively, your local recycling centre may also accept used toothbrushes. Colgate has a recycling wing that accepts all brands of used or empty oral care products and packaging. All you need to do is find your nearest local drop-off location!"
    },
    "Apple": {
      "howToRecycle":
          "Food is meant for consumption! Please do not waste food.",
      "isRecyclable": false,
      "description": "Savour every bite!"
    }
  };

  Map<String, List> listStringMap = {
    "plastic": ["Plastic Bottle"],
    "cardboard": [],
    "glass": ["Wine Glass"],
    "paper": [],
    "metal": [],
    "cloth": [],
  };

  void changeSelection(String category) {
    currentSelection = category;

    update();
  }

  void getDescription() {
    print(imageCon.itemName.capitalise());

    String itemName = imageCon.itemName.capitalise();
    bool isContain = listStringMap[currentSelection] == null
        ? false
        : (listStringMap[currentSelection] as List).contains(itemName);
    description = isContain ? "" : dictMap[itemName]!["description"] as String;

    howToRecycle =
        isContain ? "" : dictMap[itemName]!["howToRecycle"] as String;

    isRecyclable =
        isContain ? false : dictMap[itemName]!["isRecyclable"] as bool;
  }

  void resetSelection() {
    currentSelection = "";
  }
}
