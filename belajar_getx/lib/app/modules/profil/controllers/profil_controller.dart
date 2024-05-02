import 'package:belajar_getx/app/providers/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilController extends GetxController {
  var isLoading = true.obs;
  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      // Get the token from SharedPreferences
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      String? token = localStorage.getString('token');

    if (token == null) {
      throw Exception('Token Not Found');
    }

      String tokenWithoutQuotation = token.replaceAll('"', '');

      

      // Set the Authorization header with the token
      var headers = {'Authorization': 'Bearer $tokenWithoutQuotation'};

      print(headers);

      // Perform user details API request
      var apiUrl = '/user/me';
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        user.value = apiResponse['data'];
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      // Clear token or user data from local storage
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');

      // Navigate to login page
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}