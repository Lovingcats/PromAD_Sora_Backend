import 'package:flutter/material.dart';
import 'package:promad_sora/model/videostyle_model.dart';

class StyleProvider extends ChangeNotifier {
  final List<SelectVideoStyleModel> _selectVideoStyleModel =
      <SelectVideoStyleModel>[];

  List<SelectVideoStyleModel> get selectVideoStyleModel =>
      _selectVideoStyleModel;

  void addList(String styleName, String imageUrl, bool isSelected) {
    selectVideoStyleModel
        .add(SelectVideoStyleModel(styleName, imageUrl, isSelected));
    notifyListeners();
  }

  void clearList() {
    selectVideoStyleModel.clear();
    notifyListeners();
  }
}
