import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RadioController<T> extends GetxController {
  RadioController({
    T? value,
    required this.options,
  }) {
    currentValue = value == null ? options.first.obs : value.obs;
  }

  late final List<T> options;
  late final Rx<T> currentValue;

  set value(T value) {
    currentValue.value = value;
  }

  T get value => currentValue.value;
  List<T> get optionsList => options;

  void onChange(T? value) {
    if (value != null) currentValue.value = value;
  }
}
