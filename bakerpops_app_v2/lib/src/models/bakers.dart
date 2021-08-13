class Bakers {
  final String vendor_id;
  final String name;
  final String email_id;
  final String phone_number;
  final String description;
  final String address;
  final String area;
  final String city;
  final String state;
  final String pincode;
  final bool availability;
  final String rating;
  final String logo;
  final String flagship_cake;
  final String latitude;
  final String longitude;
  final List<String> categories;

  Bakers(
      {required this.name,
      required this.vendor_id,
      required this.email_id,
      required this.phone_number,
      required this.description,
      required this.address,
      required this.area,
      required this.city,
      required this.state,
      required this.pincode,
      required this.availability,
      required this.rating,
      required this.logo,
      required this.flagship_cake,
      required this.latitude,
      required this.longitude,
      required this.categories});

  factory Bakers.fromJson(Map<String, dynamic> json) {
    return Bakers(
        name: json['name'].toString(),
        vendor_id: json['vendor_id'].toString(),
        email_id: json['email_id'].toString(),
        phone_number: json['phone_number'].toString(),
        description: json['description'].toString(),
        address: json['address'].toString(),
        area: json['area'].toString(),
        city: json['city'].toString(),
        state: json['state'].toString(),
        pincode: json['pincode'].toString(),
        availability: json['availability'],
        rating: json['rating'].toString(),
        logo: json['logo'].toString(),
        flagship_cake: json['flagship_cake'].toString(),
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        categories: List<String>.from(json['categories']));
  }
}
