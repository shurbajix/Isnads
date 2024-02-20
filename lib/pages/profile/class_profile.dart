class Profile {
  bool? success;
  Data? data;
  String? message;

  Profile({this.success, this.data, this.message});

  Profile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? callingCode;
  String? mobile;
  String? image;
  bool? isVerified;
  Null codeVerified;
  bool? isOrganization;
  OrganizationType? organizationType;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.callingCode,
      this.mobile,
      this.image,
      this.isVerified,
      this.codeVerified,
      this.isOrganization,
      this.organizationType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    callingCode = json['calling_code'];
    mobile = json['mobile'];
    image = json['image'];
    isVerified = json['is_verified'];
    codeVerified = json['code_verified'];
    isOrganization = json['is_organization'];
    organizationType = json['organization_type'] != null
        ? OrganizationType.fromJson(json['organization_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['email'] = email;
    data['calling_code'] = callingCode;
    data['mobile'] = mobile;
    data['image'] = image;
    data['is_verified'] = isVerified;
    data['code_verified'] = codeVerified;
    data['is_organization'] = isOrganization;
    if (organizationType != null) {
      data['organization_type'] = organizationType!.toJson();
    }
    return data;
  }
}

class OrganizationType {
  int? id;
  String? title;
  String? image;
  int? sort;

  OrganizationType({this.id, this.title, this.image, this.sort});

  OrganizationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['sort'] = sort;
    return data;
  }
}
