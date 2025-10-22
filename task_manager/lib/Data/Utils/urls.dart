class Urls{
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static const String registrationUrl ='$_baseUrl/Registration';
  static const String loginUrl ='$_baseUrl/Login';
  static const String createTaskUrl ='$_baseUrl/createTask';
  static const String taskStatusCount ='$_baseUrl/taskStatusCount';
  static const String newTaskListUrl ='$_baseUrl/listTaskByStatus/New';
  static  String updateTaskStatusUrl(String id,String newStatus) =>
      '$_baseUrl/updateTaskStatus/$id/$newStatus';
  static const String progressTaskListUrl ='$_baseUrl/listTaskByStatus/Progress';
  static const String cancelledTaskListUrl ='$_baseUrl/listTaskByStatus/Cancelled';
  static const String completedTaskListUrl ='$_baseUrl/listTaskByStatus/Completed';
  static  String deleteTaskStatusUrl(String id) =>
      '$_baseUrl/deleteTask/$id';
  static const String updateProfileUrl = '$_baseUrl/ProfileUpdate';
  static  String emailVerifyUrl(String email) =>
      '$_baseUrl/RecoverVerifyEmail/$email';
  static  String otpVerifyUrl(String email,String otp) =>
      '$_baseUrl/RecoverVerifyOtp/$email/$otp';
  static const String changePasswordUrl = '$_baseUrl/RecoverResetPassword';
}
