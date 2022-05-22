import 'package:get/get.dart';

class BooleanController extends GetxController {
  RxBool _value = false.obs;
  void flip() => _value.value = !_value.value;
  void setValue(bool value) => _value.value = value;
  bool get value => _value.value;
  void set value(bool value) => _value.value = value;
}
