class TileLink {
  TileLink({
    required this.x,
    required this.y,
    required this.z,
  });
  int x;
  int y;
  int z;
  final _baseUrl = "https://core-carparks-renderer-lots.maps.yandex.net/";
  final _resourcePath = "maps-rdr-carparks/tiles?";
  get _queryParameters => "l=carparks&x=$x&y=$y&z=$z&scale=1&lang=ru_RU";
  get url => "$_baseUrl$_resourcePath$_queryParameters";
}
