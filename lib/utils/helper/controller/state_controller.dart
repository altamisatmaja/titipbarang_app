import 'package:get/get.dart';

class StateController<T> extends GetxController with StateMixin<T> {
  void loadingState([T? value]) => change(value, status: RxStatus.loading());

  void loadingMoreState([T? value]) => change(value, status: RxStatus.loadingMore());

  void successState([T? value]) => change(value, status: RxStatus.success());

  void errorState([String? message]) => change(null, status: RxStatus.error(message));

  void emptyState() => change(null, status: RxStatus.empty());
}
