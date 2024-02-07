class Establishment {
  String docId;
  String bName;
  String? bAbout;
  String bType;
  String status;
  String banner;
  Map location;
  Map contact;

  Establishment(
      {required this.docId,
      required this.bName,
      this.bAbout,
      required this.bType,
      required this.banner,
      required this.contact,
      required this.location,
      required this.status});

  Establishment.fromJson(String doc, Map<String, dynamic> item)
      : docId = doc,
        bName = item['b_info']['b_name'] ?? '',
        bAbout = item['b_info']['about'] ?? '',
        bType = item['b_info']['b_type'] ?? '',
        banner = item['banner'] ?? '',
        status = item['b_info']['status'] ?? '',
        location = item['location'] ?? {},
        contact = item['contact'] ?? {};

  Map<String, dynamic> toMap() {
    return {
      'bName': bName,
      'about': bAbout,
      'bType': bType,
      'status': status,
      'location': location,
      'contact': contact
    };
  }
}
