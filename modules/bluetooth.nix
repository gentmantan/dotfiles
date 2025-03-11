{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.pipewire.wireplumber.extraConfig.disablehfp= {
    "monitor.bluez.properties" = {
      "bluez5.roles" = [ "a2dp_sink" "a2dp_source" ];
    };
  };
}
