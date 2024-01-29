class Establishment {
  String bName;
  String bType;
  String? status;
  String banner;
  Map location;
  Map contact;

  Establishment(
      {required this.bName,
      required this.bType,
      required this.banner,
      required this.contact,
      required this.location,
      this.status});

  Establishment.fromJson(Map<String, dynamic> item)
      : bName = item['b_info']['b_name'] ?? '',
        bType = item['b_info']['b_type'] ?? '',
        banner = item['banner'] ?? '',
        status = item['b_info']['status'] ?? '',
        location = item['location'] ?? {},
        contact = item['contact'] ?? {};

  Map<String, Object> toMap() {
    return {
      'bName': bName,
      'bType': bType,
      'status': status ?? '',
      'location': location,
      'contact': contact
    };
  }
}
