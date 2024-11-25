{
  config,
  pkgs,
  ...
}: {
  pkgs.aerospace = {
    enable = true;

    settings = {
      start-at-login = true;
    };
  };
}
