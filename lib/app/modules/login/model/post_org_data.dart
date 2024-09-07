class PostOrgData {
  String? type;
  String? orgDomain;
  List<String>? loginDomains;

  PostOrgData({this.type, this.orgDomain, this.loginDomains});

  PostOrgData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    orgDomain = json['orgDomain'];
    loginDomains = json['loginDomains'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['orgDomain'] = this.orgDomain;
    data['loginDomains'] = this.loginDomains;
    return data;
  }
}