import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart';

class FormatConvert {
  static int convertToInt(value) {
    return value.toInt();
  }

  static String convertNumberDb(double? number) {
    String formatNumber =
        NumberFormat.compactCurrency(decimalDigits: 2, symbol: '')
            .format(number);
    return formatNumber;
  }

  static String digitNumber(num? dnumber) {
    String digitNum = NumberFormat.currency(name: '').format(dnumber ?? 0);
    return digitNum;
  }

  static String fileToBase64(File? imageFile) {
    final bytes = File(imageFile!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
    return base64Image;
  }

  //0,000.00 Double
  static formatCurrency(double number) {
    final result = NumberFormat("#,##0.00", "en_US");
    return result.format(number).replaceAll('.00', '');
  }

  //0,000 Int
  static formatCurrencyInt(int number) {
    final result = NumberFormat("#,##0", "en_US");
    return result.format(number);
  }

  //0,000.00 Num
  static formatLandArea(num number) {
    final result = NumberFormat("#,##0.00", "en_US");
    return result.format(number);
  }

  // convert 1000 to 1k
  static formatCompact(double number) {
    final result = NumberFormat.compact();
    return result.format(number);
  }

  static checkPhoneNumber(String str) {
    if (str[0] == "0") {
      return str.substring(1);
    }
    return '0$str';
  }

  static hideMiddlePhoneNumber(String phonenumber, String countryCode) {
    String getPhonenumber = phonenumber.replaceAll(countryCode, '0');
    return "${getPhonenumber.substring(0, 3)} *** ${getPhonenumber.substring(getPhonenumber.length - 3, getPhonenumber.length)}";
  }

  static remove0first(String str) {
    if (str.isNotEmpty && str[0] == "0") {
      return str.replaceFirst('0', '');
    }
    return str;
  }

  static bigCharactorFirst(String? title) {
    title = title!.capitalize;
    return title;
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  double onConvertToDouble(String value) {
    var values = value.replaceAll(",", ".");
    var doubleValue = double.parse(values);
    return doubleValue;
  }

  // Ex : 1000 -> 1K
  convertNumber(int currentBalance) {
    var formattedNumber = NumberFormat.compact().format(currentBalance);
    return formattedNumber;
  }

  formatDateTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formatDate = DateFormat('dd-MMM-yyyy', 'en_US').format(dateTime);
    return formatDate;
  }

  String? getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEEE, dd MMM yyyy');
    return outputFormat.format(inputDate);
  }

  String? eventDateTime(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEE, dd MMM yyyy');
    return outputFormat.format(inputDate);
  }

  static formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(0, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(0, '0');

    String? returnData;
    if (hours != '0') {
      returnData = '${hours}h';
      if (minutes != '0' || seconds != '0') {
        returnData = '$returnData:';
      }
    }
    if (minutes != '0') {
      returnData = '${returnData ?? ''}${minutes}mn';
      if (seconds != '0') {
        returnData = '$returnData:';
      }
    }
    if (seconds != '0') {
      returnData = '${returnData ?? ''}${seconds}s';
    }
    return returnData;
  }

  static String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} ';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} ';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} ';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} ';
    } else {
      return 'just now';
    }
  }
}

extension DateUtil on String {
  String toDMY() {
    final f = DateFormat('dd MMM yyyy', 'en_US');
    final d = DateTime.tryParse(this);
    if (d != null) {
      return f.format(d);
    } else {
      return this;
    }
  }
}
