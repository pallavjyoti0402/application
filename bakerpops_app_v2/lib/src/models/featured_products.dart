class FeatureProducts {
  final String name;
  final String image;
  final String rating;
  final String vendorId;
  final String itemId;
  final bool wishlist;

  FeatureProducts({
    required this.name,
    required this.image,
    required this.rating,
    required this.vendorId,
    required this.itemId,
    required this.wishlist,
  });

  factory FeatureProducts.fromJson(Map<String, dynamic> json) {
    return FeatureProducts(
        name: json['name'].toString(),
        image: json['flagship_cake'].toString(),
        vendorId: json['vendor_id'].toString(),
        rating: json['rating'].toString(),
        itemId: json['vendor_id'].toString(),
        wishlist: true);
  }
}
