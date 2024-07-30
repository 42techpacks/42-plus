interface FormConfigItem {
  header: string;
  inputTitle: string;
  inputType: string;
  inputPlaceholder: string;
  inputLength: number;
  country: boolean;
  footer: string;
  buttonLabel: string;
  error: string;
  description?: string;
}

interface LoginFormConfig {
  phoneNumber: FormConfigItem;
  otpVerify: FormConfigItem;
  registerPrompt: FormConfigItem;
}

interface RegisterFormConfig {
  phoneNumber: FormConfigItem;
  otpVerify: FormConfigItem;
  personalInfo: FormConfigItem;
}

export const loginFormConfig: LoginFormConfig = {
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

  registerPrompt: {
    header: "Account Not Found.",
    description:
      "This phone number is not currently registered. Proceed to registration?",
    inputTitle: "",
    inputType: "",
    inputPlaceholder: "",
    inputLength: 6,
    country: true,
    footer: ``,
    buttonLabel: "REGISTER NOW",
    error: "ERROR: Invalid Verification Code",
  },
};

export const registerFormConfig: RegisterFormConfig = {
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
