import 'dart:convert';
import 'package:get/get.dart';
import '../../../data/Utils/api_urls.dart';
import '../../../data/Utils/memory_management/memory_management.dart';
import '../../../data/Utils/memory_management/shared_pref_keys.dart';
import '../../../routes/app_pages.dart';
import '../model/loginUser_data.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


  Future<LoginUserData?> loginMethod({required String username, required String password}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request('POST', Uri.parse('https://dummyjson.com/auth/login'));

      request.body = json.encode({
        "username": "$username",
        "password": "$password",
        "expiresInMins": 30
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Parse the streamed response body as a string
        String responseBody = await response.stream.bytesToString();

        // Convert the response string to a JSON object
        Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

        // Parse the JSON object into a LoginUserData instance
        LoginUserData userData = LoginUserData.fromJson(jsonResponse);
        // Print user data or handle it further as needed
        print('User Token: ${userData.token}');
        print('Username: ${userData.username}');
        print('Email: ${userData.email}');
        Get.offNamed(Routes.HOME);
        String token = jsonResponse['token'] ?? '';

        // Save the token using SharedPreferences
        await SharedPreferencesRepository.saveData(
            SharedPrefsKeys.JWT_Token,
            token
        );

        Get.snackbar('Login Successful', 'Welcome ${userData.username}', isDismissible: true);

        return userData;
      } else {
        // Print the error reason if the status code is not 200
        print('Error: ${response.reasonPhrase}');
        Get.snackbar("Error", 'Login failed with status code ${response.statusCode}', isDismissible: true);
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      Get.snackbar("Error", 'An error occurred: $e', isDismissible: true);
    }

    return null;  // Return null in case of an error or unsuccessful login
  }













}
