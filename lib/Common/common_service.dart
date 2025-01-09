import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CommonService {
  static final CommonService _singleton = CommonService._internal();
  CommonService._internal();
  static CommonService get instance => _singleton;

  RegExp passwordPattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{9,}$');

  int pageSize = 10;
  String deviceId = "";
  String deviceType = "";
  String deviceName = "";
  int counter = 0;

  bool rememberMe = false;
  bool userDefaultPassword = false;
  String accessToken = "";
  String refreshToken = "";
  String username = "";
  String mobile = "";
  String password = "";
  int userType = 0;
  // int department = 0;
  String userProfile = "";
  String signUpErrorMsg = "";
  String changePasswordErrorMsg = "";
  int userId = 0;
  List<String> departments = [];
  List<String> permissions = [];
  String? pushToken;
  String? apnsToken;

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  String reformatDateString(String dateString) {
    // Split the original date string into components
    List<String> components = dateString.split(' ');

    // Extract date and time components
    String date = components[0];
    String time = components[1];

    // Split the date component into day, month, and year
    List<String> dateComponents = date.split('/');
    int month = int.parse(dateComponents[0]);
    int day = int.parse(dateComponents[1]);
    int year = int.parse(dateComponents[2]);

    // Convert 12-hour time format to 24-hour time format
    if (time.endsWith('AM')) {
      time = time.replaceAll(' AM', '');
    } else {
      time = time.replaceAll(' PM', '');
      List<String> timeComponents = time.split(':');
      int hour = int.parse(timeComponents[0]);
      hour = (hour % 12) + 12; // Convert to 24-hour format
      time = '$hour:${timeComponents[1]}:${timeComponents[2]}';
    }

    // Return the reformatted date string
    return '$year-${_addLeadingZero(month)}-${_addLeadingZero(day)}T$time';
  }

  String _addLeadingZero(int value) {
    return value.toString().padLeft(2, '0');
  }
  DateTime focusIntToDate(int intVal) {
    int year = (intVal / 65536).floor();
    int month = ((intVal % 65536) / 256).floor();
    int day = intVal % 256;

    return DateTime(year, month, day);
  }
  DateTime parseDate(String dateString) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm a');
    return formatter.parse(dateString);
  }
}
