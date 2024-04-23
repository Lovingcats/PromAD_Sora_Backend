import 'package:flutter/material.dart';
import 'package:promad_sora/model/videostyle_model.dart';

class StyleProvider extends ChangeNotifier {
  final List<SelectVideoStyleModel> _selectVideoStyleModel =
      <SelectVideoStyleModel>[];
  int _modelSelectIndex = 0;
  int _modelSelectedIndex = 0;

  List<SelectVideoStyleModel> get selectVideoStyleModel =>
      _selectVideoStyleModel;
  int get modelSelectIndex => _modelSelectIndex; //새롭게 선택된
  int get modelSelectedIndex => _modelSelectedIndex; //선택되어있던

  void setSelectedIndex(int index) {
    _modelSelectedIndex = index;
    notifyListeners();
  }

  void setSelectIndex(int index) {
    _modelSelectIndex = index;
    notifyListeners();
  }

  void changeIsSelected() {
    selectVideoStyleModel[modelSelectedIndex].isSelected = true;
    selectVideoStyleModel[modelSelectIndex].isSelected = false;
    notifyListeners();
  }

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
