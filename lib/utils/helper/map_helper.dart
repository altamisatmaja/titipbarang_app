abstract class MapHelper {
  static Map<String, dynamic> convertDynamicMap(dynamic originalMap) {
    Map<String, dynamic> convertedMap = {};

    originalMap.forEach((key, value) {
      if (key is String) {
        if (value is Map) {
          convertedMap[key] = convertDynamicMap(value);
        } else if (value is List) {
          convertedMap[key] = value.map((e) => e is Map ? convertDynamicMap(e) : e).toList();
        } else {
          convertedMap[key] = value;
        }
      }
    });

    return convertedMap;
  }
}
