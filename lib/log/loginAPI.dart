import 'dart:convert';

LoginAPI loginAPI(String str) => LoginAPI.fromJson(
      json.decode(str),
    );

class LoginAPI {
  bool? success;
  Data? data;
  String? message;

  LoginAPI.dart({this.success, this.data, this.message});

  LoginAPI.fromJson(Map<String, dynamic> json) {
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
  String? accessToken;
  User? user;
  String? tokenType;
  String? expiresAt;

  Data({
    this.accessToken,
    this.user,
    this.tokenType,
    this.expiresAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token_type'] = tokenType;
    data['expires_at'] = expiresAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? callingCode;
  String? mobile;
  String? image;
  bool? isVerified;
  Null codeVerified;
  bool? isOrganization;
  OrganizationType? organizationType;

  User(
      {this.id,
      this.name,
      this.email,
      this.callingCode,
      this.mobile,
      this.image,
      this.isVerified,
      this.codeVerified,
      this.isOrganization,
      this.organizationType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
    data['name'] = name;
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
