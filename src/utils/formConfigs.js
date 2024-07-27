export const loginFormConfig = {
  phoneNumber: {
    header: "Login with Phone Number.",
    inputTitle: "Phone Number",
    inputType: "phone",
    inputPlaceholder: "4077470791",
    inputLength: 10,
    country: true,
    footer: `Standard messaging rates will apply. View our terms and conditions for more details`,
    buttonLabel: "SEND CODE",
    error: "ERROR: Invalid Phone Number",
  },

  otpVerify: {
    header: "OTP Verification",
    description: "Enter the 6-digit code sent to +",
    inputTitle: "OTP Verification",
    inputType: "verify",
    inputPlaceholder: "4077470791",
    inputLength: 6,
    country: true,
    footer: ``,
    buttonLabel: "LOGIN",
    error: "ERROR: Invalid Verification Code",
  },
};

export const registerFormConfig = {
  phoneNumber: {
    header: "Register with Phone Number.",
    inputTitle: "Phone Number",
    inputType: "phone",
    inputPlaceholder: "4077470791",
    inputLength: 10,
    country: true,
    footer: `Standard messaging rates will apply. View our terms and conditions for more details`,
    buttonLabel: "SEND CODE",
    error: "ERROR: Invalid Phone Number",
  },

  otpVerify: {
    header: "OTP Verification",
    description: "Enter the 6-digit code sent to +",
    inputTitle: "OTP Verification",
    inputType: "verify",
    inputPlaceholder: "4077470791",
    inputLength: 6,
    country: true,
    footer: ``,
    buttonLabel: "VERIFY",
    error: "ERROR: Invalid Verification Code",
  },

  personalInfo: {
    header: "Registration Complete",
    description: "Welcome to 42+. Set your account username below.",
    inputTitle: "Username",
    inputType: "username",
    inputPlaceholder: "npcmilo",
    inputLength: -1,
    country: true,
    footer: ``,
    buttonLabel: "ENTER 42+",
    error: "ERROR: Username is already taken",
  },
};
