import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/data/remote/api_service.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/utils/helper/controller/base_controller.dart';
import 'package:titipbarang_app/utils/helper/error_helper.dart';

class ProductDetailController extends BaseObjectController<Product> {
  String tag = 'ProductDetail::->';

  late final int id;

  @override
  void onInit() {
    id = Get.arguments;

    getCache();

    refreshPage();
    super.onInit();
  }

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
  }

  @override
  String get cacheKey => 'ProductDetail($id)';

  @override
  Future<IndicatorResult> onLoadData() async {
    if (isRefreshing) loadingState();

    try {
      ApiClient? apiClient = await createApiClient();

      if (apiClient == null) {
        if (isRefreshing) emptyState();
        return IndicatorResult.fail;
      }

      value = await apiClient.getSingleProduct(
        id: id,
        cancelToken: cancelToken,
      );

      return saveCacheAndFinish();
    } catch (e) {
      ErrorHelper.handleError(e);
      errorState(e.toString());
      return IndicatorResult.fail;
    }
  }
}
