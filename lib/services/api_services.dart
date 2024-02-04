import 'dart:convert';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/utility.dart';
import 'package:http/http.dart' as http;

Future<bool> logInRequest(formValues) async {
  var url = Uri.parse("$baseUrl/login");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    customSuccessMessage(message: 'Successfully Login');
    await writeUserData(resultBody);
    return true;
  } else {
    customErrorMessage(message: 'Login Failed');
    return false;
  }
}

Future<bool> registrationRequest(formValues) async {
  var url = Uri.parse("$baseUrl/registration");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    customSuccessMessage(message: 'Successfully Registration');
    return true;
  } else {
    customErrorMessage(message: 'Registration Failed');
    return false;
  }
}

Future<bool> verifyEmailRequest(verifyEmail) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$verifyEmail");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    await writeEmailVerification(verifyEmail);
    customSuccessMessage(message: 'Sent OTP your email');
    return true;
  } else {
    customErrorMessage(message: 'Verification Failed');
    return false;
  }
}

Future<bool> verifyPinCodeRequest(email, otp) async {
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$email/$otp");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    await writeOTPVerification(otp);
    customSuccessMessage(message: 'OTP verified');
    return true;
  }else{
    customErrorMessage(message: 'OTP is not verified');
    return false;
  }
}

Future<bool> setPasswordRequest(formValues) async {
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    customSuccessMessage(message: 'Password Reset Successful');
    return true;
  }else{
    customErrorMessage(message: 'Password Reset Failed');
    return false;
  }
}

Future<List> taskListRequest(status) async{
  String? token = await readUserData("token");
  Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "token": "$token"};
  var url = Uri.parse("$baseUrl/listTaskByStatus/$status");
  var response = await http.get(url, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    customSuccessMessage(message: 'Request Success');
    return resultBody["data"];
  }else{
    return [];
  }
}

Future<bool> createTaskRequest(formValues) async {
  String? token = await readUserData("token");
  Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "token": "$token"};
  var url = Uri.parse("$baseUrl/createTask");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeaderWithToken, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"]=="success"){
    customSuccessMessage(message: 'Successfully Task Created');
    return true;
  }else{
    customErrorMessage(message: 'Task Creation Failed');
    return false;
  }
}

Future<bool> taskDeleteRequest(id) async {
  String? token = await readUserData("token");
  Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "token": "$token"};
  var url = Uri.parse("$baseUrl/deleteTask/$id");
  var response = await http.get(url, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    customSuccessMessage(message: 'Successfully Task Delete');
    return true;
  }else{
    customErrorMessage(message: 'Task Deletion Failed');
    return false;
  }
}

Future<List> taskCountListRequest() async{
  String? token = await readUserData("token");
  Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "token": "$token"};
  var url = Uri.parse("$baseUrl/taskStatusCount");
  var response = await http.get(url, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    customSuccessMessage(message: 'Request Success');
    return resultBody["data"];
  }else{
    return [];
  }
}

Future<bool> taskUpdateRequest(id, status) async {
  String? token = await readUserData("token");
  Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "token": "$token"};
  var url = Uri.parse("$baseUrl/updateTaskStatus/$id/$status");
  var response = await http.get(url, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody["status"] == "success"){
    customSuccessMessage(message: 'Successfully Task Update');
    return true;
  }else{
    customErrorMessage(message: 'Task Updated Failed');
    return false;
  }
}
