import 'dart:convert';

List<BranchModel> BranchModelModelListFromJson(String str) =>
    List<BranchModel>.from(json.decode(str).map((x) => BranchModel.fromJson(x)));


class BranchModel{
  String uid;
  String utype;
  String pid;
  String BankId;
  String BranchName;
  String Name;
  String Mobile;
  String Email;
  String Address;
  String gst;
  String Password;
  String ProfilePic;
  String token;
  String isactive;
  String isblock;
  String is_delete;
  String created_time;
  String create_by;
  String update_time;
  String update_by;

  BranchModel({
    this.uid,
    this.utype,
    this.pid,
    this.BankId,
    this.BranchName,
    this.Name,
    this.Mobile,
    this.Email,
    this.Address,
    this.gst,
    this.Password,
    this.ProfilePic,
    this.token,
    this.isactive,
    this.isblock,
    this.is_delete,
    this.created_time,
    this.create_by,
    this.update_time,
    this.update_by,

  });
  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
    uid: json['uid'],
    utype: json['utype'],
    pid: json['pid'],
    BankId: json['BankId'],
    BranchName: json['BranchName'],
    Name: json['Name'],
    Mobile: json['Mobile'],
    Email: json['Email'],
    Address: json['Address'],
    gst: json['gst'],
    Password: json['Password'],
    ProfilePic: json['ProfilePic'],
    token: json['token'],
    isactive: json['isactive'],
    isblock: json['isblock'],
    is_delete: json['is_delete'],
    created_time: json['created_time'],
    create_by: json['create_by'],
    update_time: json['for'],
    update_by: json['update_by'],
  );
}