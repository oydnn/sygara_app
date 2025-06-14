

// ini digunakan untuk konfigurasi (koneksi ke web service, membuat function)
import 'package:intl/intl.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

class Config {

  // membuat fungsi format currency
  static String convertToIdr(dynamic number, int decimalDigit){
    NumberFormat currencyFormater = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp.',
      decimalDigits: decimalDigit,
    );
    return currencyFormater.format(number);
  }

  // convert tag html to text
  static String htmlToText(String htmlString){
    dom.Document document = parse(htmlString);
    return document.body?.text ?? '';
  }

// sediakan variabel penampung alamat url (backend / web service)
static String urlAPI = 'http://192.168.18.145:8000/api';
// sediakan variabel penampung file/gambar, url ini adalah url utama website (backend)
static String urlMain = 'http://192.168.18.145:8000/';

// variabel untuk end point point yang sudah dites pakai postman
// Autentikasi
String urlLogin = '$urlAPI/login';
String urlRegister = '$urlAPI/register';

// product
String urlProductRekomendasi = '$urlAPI/product-rekomendasi';
String urlProductBuah = '$urlAPI/product-buah';
String urlProductSayur = '$urlAPI/product-sayur';

}