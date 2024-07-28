{ pkgs }: {
  channel = "stable-23.11";
  packages = [
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip
  ];
  idx.workspace.onStart = {
    set-git-email = "git config --global user.email '51991640+lakshit1@users.noreply.github.com'";
  };
  idx.extensions = [
    "Dart-Code.dart-code"
    "Dart-Code.flutter"
    "robert-brunhage.flutter-riverpod-snippets"
  ];
  idx.previews = {
    previews = {
      # web = {
      #   command = [
      #     "flutter"
      #     "run"
      #     "--machine"
      #     "-d"
      #     "web-server"
      #     "--web-hostname"
      #     "0.0.0.0"
      #     "--web-port"
      #     "$PORT"
      #   ];
      #   manager = "flutter";
      # };
      android = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "android"
          "-d"
          "emulator-5554"
        ];
        manager = "flutter";
      };
    };
  };
}
