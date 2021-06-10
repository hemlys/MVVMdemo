class versionBean {
  String message;
  String key;
  String eNC;
  String eNV;

  versionBean({ this.message,  this.key,  this.eNC,  this.eNV});

  versionBean.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    key = json['key'];
    eNC = json['ENC'];
    eNV = json['ENV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['key'] = this.key;
    data['ENC'] = this.eNC;
    data['ENV'] = this.eNV;
    return data;
  }
}
