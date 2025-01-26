import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/data/remote/api_service.dart';
import 'package:titipbarang_app/feature/product/detail/product_detail_page.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/utils/helper/controller/base_controller.dart';
import 'package:titipbarang_app/utils/helper/error_helper.dart';
import 'package:titipbarang_app/utils/mixin/search_mixin.dart';

class ProductListController extends BaseListController<Product> with SearchMixin {
  String tag = 'ProductList::->';

  @override
  void onInit() {
    // getCache();

    refreshPage();
    super.onInit();
  }

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
  }

  @override
  Future<IndicatorResult> onLoadData() async {
    cancelToken.cancel();
    cancelToken = CancelToken();

    if (isRefreshing) loadingState();

    try {
      ApiClient? apiClient = await createApiClient();

      if (apiClient == null) {
        if (isRefreshing) emptyState();
        return IndicatorResult.fail;
      }

      final result = await apiClient.getSearchProducts(
        q: querySearch ?? '',
        limit: perPage,
        skip: (page - 1) * perPage,
        cancelToken: cancelToken,
      );

      if (page == 1) {
        value = result.data;
      } else {
        value?.addAll(result.data ?? []);
      }

      hasNextPage = !((result.data?.length ?? 0) < (perPage));

      if (page == 1) {
        return saveCacheAndFinish();
      }
      return finishLoadData();
    } catch (e) {
      if (e is DioException && e.type != DioExceptionType.cancel) {
        ErrorHelper.handleError(e);
        errorState(e.toString());
      }
      return IndicatorResult.fail;
    }
  }

  void toDetail(Product item) => Get.toNamed(ProductDetailPage.route, arguments: item.id);
}
