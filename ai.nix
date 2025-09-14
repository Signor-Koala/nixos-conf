{
  config,
  lib,
  pkgs,
  ...
}: {
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1031";
    };
    rocmOverrideGfx = "10.3.0";
    loadModels = ["gemma3:12b" "deepseek-r1:8b" "llama3.2:3b" "mistral"];
  };
  services.open-webui = {
    port = 8081;
    enable = true;
  };
}
