// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    String id;
    String profile;
    String userToken;

    LoginResponseModel({
        required this.id,
        required this.profile,
        required this.userToken,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["_id"],
        profile: json["profile"],
        userToken: json["userToken"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "profile": profile,
        "userToken": userToken,
    };
}
