let
  # 使用 builtins.fetchurl 从 URL 获取内容
  keysFile = builtins.fetchurl {
    url = "https://github.com/4t145.keys";
  };

  # 读取文件内容并拆分为行
  keys = builtins.readFile keysFile;
  keyList = builtins.split "\n" keys;

  # 过滤掉空行
  sshKeys = builtins.filter (key: builtins.isString key && key != "") keyList;
in
sshKeys
