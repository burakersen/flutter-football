class Country {
  String? name;
  String? code;
  String? flag;

  Country({this.name, this.code, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['flag'] = this.flag;
    return data;
  }
}