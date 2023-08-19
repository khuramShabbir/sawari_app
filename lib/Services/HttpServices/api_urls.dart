// ignore_for_file: constant_identifier_names

class ApiUrls {
  static const String BASE_URL = "https://daresni.net/";
  static const String PREFIX = "api/";

  /// OTP
  static const String SEND_OTP = "${BASE_URL + PREFIX}send_otp";
  static const String VERIFY_OTP = "${BASE_URL + PREFIX}verifyOtp";
  static const String VERIFY_EMAIL_OTP = "${BASE_URL + PREFIX}varify_email_otp";
  static const String RE_EMAIL_OTP = "${BASE_URL + PREFIX}send_email_otp_request";

  /// Location

  static const String GET_COUNTRY = "${BASE_URL + PREFIX}country_list";
  static const String GET_STATE = "${BASE_URL + PREFIX}state_list?country_id=";
  static const String GET_CITY = "${BASE_URL + PREFIX}city_by_state/";
  static const String GET_AREA = "${BASE_URL + PREFIX}area_list?";
  static const String GET_MULTI_STATE = "${BASE_URL + PREFIX}get_multi_states_from_country";
  static const String GET_MULTI_CITIES_FORM_STATE =
      "${BASE_URL + PREFIX}get_multi_cities_from_states";

  /// Tutor

  /// Registration
  static const String REGISTER_TUTOR = "${BASE_URL + PREFIX}tutor-register";
  static const String LOGIN_USER = "${BASE_URL + PREFIX}login";
  static const String GET_TUTOR_PROFILE = "${BASE_URL + PREFIX}getTutorProfile";
  static const String GET_STUDENT_PROFILE = "${BASE_URL + PREFIX}getStudentProfile";
  static const String LOGOUT_USER = "${BASE_URL + PREFIX}logoutuser";
  static const String UPDATE_PROFILE = "${BASE_URL + PREFIX}updateTutorProfile";
  static const String UPDATE_PROFILE_PICTURE = "${BASE_URL + PREFIX}profileImageUpdate";
  static const String UPDATE_DOCUMENTS = "${BASE_URL + PREFIX}tutor-documents";
  static const String FORGET_PASSWORD = "${BASE_URL + PREFIX}forget-password";

  /// Get Tutor List
  static const String GET_TUTOR_LIST = "${BASE_URL + PREFIX}tutors";
  static const String GET_SINGLE_TUTOR = "${BASE_URL + PREFIX}getSingleTutorDetail";

  /// Add To Cart
  static const String ADD_TO_CART = "${BASE_URL + PREFIX}add_to_cart";

  /// get languages

  static const String GET_LANGUAGES = "${BASE_URL + PREFIX}language_list";

  /// Get Subjects
  static const String GET_SUBJECTS = "${BASE_URL + PREFIX}subject_list";
  static const String GET_QUALIFICATION_LIST = "${BASE_URL + PREFIX}qualification_list";

  /// Bank Details

  static const String GET_ALL_BANKS = "${BASE_URL + PREFIX}all_bank_list";
  static const String GET_ALL_TUTOR_BANK = "${BASE_URL + PREFIX}getAllTutorBanks";

  static const String GET_BANK_DETAILS = "${BASE_URL + PREFIX}getallbankdetail";
  static const String SAVE_BANK_DETAIL = "${BASE_URL + PREFIX}saveBankDetail";
  static const String REMOVE_BANK_DETAIL = "${BASE_URL + PREFIX}removeBankDetail";
  static const String UPDATE_BANK_DETAIL = "${BASE_URL + PREFIX}updateBankDetail";

  /// Schedule

  static const String ADD_SCHEDULE = "${BASE_URL + PREFIX}saveTutorSchedule";
  static const String UPDATE_SCHEDULE = "${BASE_URL + PREFIX}updateTutorSchedule";
  static const String GET_SCHEDULE = "${BASE_URL + PREFIX}getTutorSchedule";
  static const String DELETE_SCHEDULE = "${BASE_URL + PREFIX}removeTutorSchedule";

  /// Booking
  static const String GET_ALL_BOOKINGS = "${BASE_URL + PREFIX}view-bookings";
  static const String GET_SINGLE_BOOKING = "${BASE_URL + PREFIX}view-single-booking";

  /// Student APIS

  /// Register
  static const String STUDENT_REGISTRATION = "${BASE_URL + PREFIX}student-registration";

  /// GET WALLET AND REQUEST FOR WITH DRAWAL
  static const String GET_WALLET = "${BASE_URL + PREFIX}my-balance";
  static const String LIST_OF_WITHDRAWAL = "${BASE_URL + PREFIX}list-of-withdraws";
  static const String REQUEST_FOR_WITHDRAWAL = "${BASE_URL + PREFIX}request-withdraw";
}
