class RouteInfo {
  final String name;
  final String path;
  final Map<String, String>? defaultParams;

  static final RouteInfo mainPage = RouteInfo(
    path: r'/:index(\d+)',
    name: 'main',
  );

  RouteInfo({
    required this.name,
    required this.path,
    this.defaultParams,
  });

  Map<String, String> getParams({Map<String, String>? extraParams}) {
    return defaultParams != null
        ? {...defaultParams!, ...(extraParams ?? {})}
        : extraParams ?? {};
  }
}
