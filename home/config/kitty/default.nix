{ ... }:

{
  programs.kitty = {
    enable = true;
    font.size = 14;
    settings = {
      enable_audio_bell = false;
      update_check_interval = 0;
    };
    shellIntegration.enableZshIntegration = true;
  };

}
