import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // login authentication
  static Future setRememberMe(bool rememberMe) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', rememberMe);
  }

  static Future getRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    final rememberMe = prefs.getBool('rememberMe');
    if (rememberMe == null) {
      return false;
    } else {
      return rememberMe;
    }
  }

  static Future setAccessToken(String? accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken!);
  }

  static Future getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    if (accessToken == null) {
      return '';
    } else {
      return accessToken;
    }
  }

  static Future setRefreshToken(String? refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refreshToken', refreshToken!);
  }

  static Future getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');
    if (refreshToken == null) {
      return '';
    } else {
      return refreshToken;
    }
  }

  static Future setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  static Future getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    if (username == null) {
      return '';
    } else {
      return username;
    }
  }

  static Future setFullname(String fullname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullname', fullname);
  }

  static Future getFullname() async {
    final prefs = await SharedPreferences.getInstance();
    final fullname = prefs.getString('fullname');
    if (fullname == null) {
      return '';
    } else {
      return fullname;
    }
  }

  static Future setUserProfile(String userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userProfile', userProfile);
  }

  static Future getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final userProfile = prefs.getString('userProfile');
    if (userProfile == null) {
      return '';
    } else {
      return userProfile;
    }
  }

  static Future setUserMobile(String userMobile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userMobile', userMobile);
  }

  static Future getUserMobile() async {
    final prefs = await SharedPreferences.getInstance();
    final userMobile = prefs.getString('userMobile');
    if (userMobile == null) {
      return '';
    } else {
      return userMobile;
    }
  }

  static Future setPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
  }

  static Future getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final password = prefs.getString('password');
    return password;
  }

  static Future setUserEmail(String userEmail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', userEmail);
  }

  static Future getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final userEmail = prefs.getString('userEmail');
    if (userEmail == null) {
      return '';
    } else {
      return userEmail;
    }
  }

  static Future setPermissions(List<String> permissions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('permissions', permissions);
  }

  static Future getPermissions() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('permissions') != null) {
      final permissions = prefs.getStringList('permissions');
      return permissions;
    } else {
      final permissions = [''];
      return permissions;
    }
  }

  static Future setUserId(String? userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId!);
  }

  static Future getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId == null) {
      return '';
    } else {
      return userId;
    }
  }

  static Future setIsFirstTime(bool firstTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', firstTime);
  }

  static Future getIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final firstTime = prefs.getBool('isFirstTime');
    if (firstTime == null) {
      return false;
    } else {
      return firstTime;
    }
  }

  static Future setRetailerId(String? retailerId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('retailerId', retailerId!);
  }

  static Future getRetailerId() async {
    final prefs = await SharedPreferences.getInstance();
    final retailerId = prefs.getString('retailerId');
    if (retailerId == null) {
      return '';
    } else {
      return retailerId;
    }
  }

  static Future setRetailerName(String? retailerName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('retailerName', retailerName!);
  }

  static Future getRetailerName() async {
    final prefs = await SharedPreferences.getInstance();
    final retailerName = prefs.getString('retailerName');
    if (retailerName == null) {
      return '';
    } else {
      return retailerName;
    }
  }
}
