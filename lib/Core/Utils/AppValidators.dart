class Appvalidators {
  // هنعمل private constractor عشان ميتعملش منه  obj بعد كده
  Appvalidators._();

  //todo : Emali Validator
  static String? EmailValidator(String? email) {
    RegExp emailRegx = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email == null || email.trim().isEmpty) {
      return 'This field is Required !';
    } else if (emailRegx.hasMatch(email) == false) {
      return 'enter a valid email';
    } else {
      // ال validator لو رجع null يبقي القيمه صح
      // لو رحع string يبقي في حاجه غلط
      return null;
    }
  }

  //todo : Password Validator
  static String? PasswordValidator(String? Password) {
    RegExp passRegx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (Password == null || Password.trim().isEmpty) {
      return 'This field is Required !';
    } else if (passRegx.hasMatch(Password) == false) {
      return 'Password must be at least 8 characters and include uppercase, lowercase, number and symbol';
    } else {
      return null;
    }
  }

  //todo: mobile number Validator
  static String? MobileNumberValidator(String? MobileNumber) {
    RegExp MobileNumberRegx = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    if (MobileNumber == null || MobileNumber.trim().isEmpty) {
      return 'This field is Required !';
    } else if (MobileNumberRegx.hasMatch(MobileNumber) == false) {
      return 'enter a valid Mobile Number !';
    } else if (MobileNumber.trim().length != 11) {
      return ' Mobile Number must equal 11 digit !';
    } else if (int.tryParse(MobileNumber.trim()) == false) {
      return ' enter Numbers only !';
    } else {
      return null;
    }
  }

  //todo: Confirm Password Validator
  static String? ValidateConfirmPasswird(
    String? Password,
    String? ConfirmedPassword,
  ) {
    if (Password == null || Password.trim().isEmpty == false) {
      return 'This field is Required !';
    } else if (Password != ConfirmedPassword) {
      return 'Passwords not matching !';
    } else {
      return null;
    }
  }

  //todo: UserName Validator
  static String? UserNameValidator(String? UserName) {
    RegExp UserNameRegx = RegExp(r'^[a-zA-Z0-9._]{3,20}$');
    if (UserName == null || UserName.trim().isEmpty == false) {
      return 'This field is Required !';
    } else if (UserNameRegx.hasMatch(UserName) == false) {
      return 'enter a valid UserName !';
    } else {
      return null;
    }
  }

  //todo: FullName Validator
  static String? FullNameValidator(String? FullName) {
    RegExp FullNameRegx = RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)+$');
    if (FullName == null || FullName.trim().isEmpty == false) {
      return 'This field is Required !';
    } else if (FullNameRegx.hasMatch(FullName) == false) {
      return 'enter a valid FullName !';
    } else {
      return null;
    }
  }
}
