self: super: {
  google-chrome = super.google-chrome.override {
    commandLineArgs =
      "--force-device-scale-factor=1.5";
  };
}
