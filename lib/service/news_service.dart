// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:http/http.dart' as http;
import 'package:test_solusi_digital/model/news_model.dart';

class NewsServices {
  final String ip = "newsapi.org";
  // static String url = "http://" + BaseServices().ip + "/service/api";

  // ignore: duplicate_ignore
  Future<List> getNews({String page}) async {
    var x;
    // String apiKey = "84226bacad394a68ab654a217e558bd8";
    // final res = await http.get(Uri.http(
    //     "newsapi.org", "/v2/everything?q=bitcoin&pageSize=10&apiKey=$apiKey"));
    final queryParameters = {
      'q': 'bitcoin',
      'pageSize': '10',
      'apiKey': '84226bacad394a68ab654a217e558bd8'
    };
    final res = await http
        .get(Uri.https("newsapi.org", "/v2/everything", queryParameters));
    if (res.statusCode == 200) {
      var response = newsModelFromJson(res.body);
      if (response.status == "ok") {
        x = ["ok", response.articles];
      } else {
        x = ["gak ok", response.status];
      }
    } else {
      x = ["gak 200", res.statusCode];
    }

    return x;
  }

  // Future<Barang> detailBarang({String id}) async {
  //   var x;
  //   final res = await http.get(Uri.http(
  //       BaseServices().ip, "/service/api/Barang/cek", {"serial_number": id}));
  //   if (res.statusCode == 200) {
  //     var response = json.decode(res.body);
  //     if (response['status'] == true) {
  //       final json = barangModelFromJson(res.body);
  //       x = json.data[0];
  //     } else {
  //       x = null;
  //     }
  //   } else {
  //     x = null;
  //   }

  //   return x;
  // }

  // static Future<List> deleteBarang({String id}) async {
  //   var x;

  //   final response = await http.get(
  //     Uri.http(BaseServices().ip, "/service/api/barang/delete", {
  //       "id": id,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     x = ["berhasil"];
  //   } else {
  //     x = ["gagal", "2"];
  //   }

  //   return x;
  // }

  // static Future<List> addBarang(
  //     {String serialNumber,
  //     String seri,
  //     String type,
  //     String jenisBarang}) async {
  //   List x;
  //   var uri = await http
  //       .post(Uri.http(BaseServices().ip, "/service/api/Barang"), body: {
  //     "serial_number": serialNumber,
  //     "seri": seri,
  //     "type": type,
  //     "jenis_barang": jenisBarang,
  //   });
  //   Map<String, dynamic> res = json.decode(uri.body);

  //   if (uri.statusCode == 201 && res['status'] == true) {
  //     x = ["berhasil"];
  //   } else {
  //     x = ["Gagal", res['status'], uri.statusCode];
  //   }
  //   return x;
  // }

  // static Future<List> editBarang(
  //     {String serialNumber,
  //     String seri,
  //     String type,
  //     String jenisBarang,
  //     String id}) async {
  //   List x;
  //   var uri = await http
  //       .post(Uri.http(BaseServices().ip, "/service/api/Barang/edit"), body: {
  //     "jenis_barang": jenisBarang,
  //     "id": id,
  //     "type": type,
  //     "seri": seri,
  //     "serial_number": serialNumber,
  //   });
  //   Map<String, dynamic> res = json.decode(uri.body);

  //   if (uri.statusCode == 201 && res['status'] == true) {
  //     x = ["berhasil"];
  //   } else {
  //     x = ["Gagal", res['status'], uri.statusCode];
  //   }
  //   return x;
  // }
}
