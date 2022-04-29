import 'package:app_aihieuquochoi/models/MessageItem.dart';
import 'package:app_aihieuquochoi/models/NguoiDungItem.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import "package:dio/dio.dart";

String token = '';
NguoiDungItem? nguoidungsession = NguoiDungItem();
var urlsourcedomain = "http://192.168.1.23:8095/";

// ignore: camel_case_types
class Base_service {
  final baseUrl = 'http://192.168.1.23:8094//api';

  static final Base_service _internal = Base_service.internal();
  factory Base_service() => _internal;
  Base_service.internal();
  getHeaders() {
    return {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
      'Authorization': "**",
      'User-Aagent': "4.1.0;android;6.0.1;default;A001",
      "HZUID": "2",
    };
  }

// ignore: unused_element
  Future<dynamic> getlogin(data1) async {
    Dio dio = Dio();
    NguoiDungItem? user;
    try {
      dio.options.headers = getHeaders();
      var response = await dio.post('$baseUrl/NguoiDung/Login', data: data1);
      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['Data'] != null &&
            response.data["StatusCode"] == 0) {
          var objdata = response.data['Data'];
          user = NguoiDungItem.fromMap(objdata);
        } else {
          basemessage = 'Thông tin đăng nhập không đúng';
        }
      } else {
        ischeckurl = false;
        basemessage = 'Thông tin đăng nhập không đúng';
      }
    } catch (ex) {
      ischeckurl = false;
      basemessage = 'Đã có lỗi xảy ra vui lòng đăng nhập lại: ' + ex.toString();
    }
    return user;
  }

  Future<dynamic> dangky(data1) async {
    Dio dio = Dio();
    MessageItem? obj;
    try {
      dio.options.headers = getHeaders();
      var response = await dio.post('$baseUrl/NguoiDung/dangky', data: data1);
      if (response.statusCode == 200) {
        if (response.data != null && response.data['Data'] != null) {
          var objdata = response.data['Data'];
          obj = MessageItem.fromMap(objdata);
        } else {
          basemessage = 'Đăng ký không thành công';
        }
      } else {
        ischeckurl = false;
        basemessage = 'Đăng ký không thành công';
      }
    } catch (ex) {
      ischeckurl = false;
      basemessage = 'Đã có lỗi xảy ra vui lòng đăng nhập lại: ' + ex.toString();
    }
    dispose(dio);
    return obj;
  }

  Future getbase<T>(dynamic data, urlapi) async {
    Dio dio = Dio();
    if (token.isEmpty) {
      return null;
    }
    // ignore: prefer_typing_uninitialized_variables
    var objdata;
    try {
      var response = await dio.get('$baseUrl/$urlapi',
          queryParameters: data,
          options: Options(headers: {
            'Authorization': '$token',
          }, contentType: 'application/json; charset=utf-8'));
      if (response.statusCode == 200) {
        if (response.data['Data'] != null && response.data["StatusCode"] == 0) {
          objdata = response.data['Data'];
          return objdata;
        }
      } else {
        throw Exception('Failed to get data');
      }
    } catch (e) {
      throw Exception('Failed to get data');
    }
    dispose(dio);
  }

  dynamic post(data, urlapi) async {
    Dio dio = Dio();
    var response = await dio.post('$baseUrl/$urlapi',
        data: data,
        options: Options(headers: {
          'Authorization': '$token',
        }, contentType: 'application/json; charset=utf-8'));
    if (response.statusCode == 200) {
      if (response.data != null &&
          response.data['Data'] != null &&
          response.data["StatusCode"] == 0) {
        if (response.data['Message'] != null) {
          basemessage = response.data['Message'];
        }
        var objdata = response.data['Data'];
        dispose(dio);
        return objdata;
      }
    }
    dispose(dio);
    return null;
  }

  Future<dynamic> postcauhinhnhannotification(dataquery) async {
    try {
      var url = "/NguoiDung/cauhinhnhannotification";
      var message = await post(dataquery, url);
      return message;
    } catch (ex) {
      return ex;
    }
  }

  void dispose(dio) {
    dio.close();
  }
}
