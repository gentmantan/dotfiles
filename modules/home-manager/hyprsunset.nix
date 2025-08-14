{
  services.hyprsunset = {
    enable = true;
    settings = {
      profile = [
      {
        time = "7:00";
        identity = true;
      }
      {
        time = "20:00";
        temperature = 2000;
      }
      ];
    };
  };
}
