class TileLink {
  TileLink(this.xyz);
  (int, int, int) xyz;

  final _baseUrl = "https://core-carparks-renderer-lots.maps.yandex.net/";
  final _resourcePath = "maps-rdr-carparks/tiles?";
  get _queryParameters =>
      "l=carparks&x=${xyz.$1}&y=${xyz.$2}&z=${xyz.$3}&scale=1&lang=ru_RU";
  get url => "$_baseUrl$_resourcePath$_queryParameters";
}
