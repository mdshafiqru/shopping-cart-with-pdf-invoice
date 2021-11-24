// ignore_for_file: constant_identifier_names

class ApiString {
  static const WEBSITE_URL = 'https://ashshefa.com';

  // User authentication urls

  static const BASE_URL = 'http://10.0.2.2:8000';
  static const LOGIN_URL = BASE_URL + '/api/login';
  static const LOG_OUT_URL = BASE_URL + '/api/logout';
  static const REGISTER_URL = BASE_URL + '/api/register';
  static const USER_URL = BASE_URL + '/api/user';
  static const CHECK_IF_USER_EXISTS_URL =
      BASE_URL + '/api/checkIfAccountExists';
  static const CHECK_RESET_PASSWORD_URL = BASE_URL + '/api/checkResetPass';
  static const UPDATE_PASSWORD_URL = BASE_URL + '/api/updatePass';
  static const UPDATE_LOGGED_IN_USER_PASSWORD_URL =
      BASE_URL + '/api/updateLoggedinUserPass';
  static const UPDATE_USER_PROFILE_URL = BASE_URL + '/api/updateUserProfile';

  // Dashboard
  static const CAROUSEL_URL = BASE_URL + '/api/carousel/all';
  static const PRODUCT_URL = BASE_URL + '/api/product/all';
}
