import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tencent_im_sdk_plugin_example/pages/login/login.dart';
import 'package:tencent_im_sdk_plugin_example/provider/conversion.dart';
import 'package:tencent_im_sdk_plugin_example/provider/currentMessageList.dart';
import 'package:tencent_im_sdk_plugin_example/provider/friend.dart';
import 'package:tencent_im_sdk_plugin_example/provider/friendApplication.dart';
import 'package:tencent_im_sdk_plugin_example/provider/groupApplication.dart';
import 'package:tencent_im_sdk_plugin_example/provider/keybooadshow.dart';
import 'package:tencent_im_sdk_plugin_example/provider/user.dart';

// 应用初始化时就加在登录页

void main() {
  // 先设置状态栏样式
  SystemUiOverlayStyle style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
  // 看看有没有sessionID和token;如果有，直接登录了
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ConversionModel()),
      ChangeNotifierProvider(create: (_) => UserModel()),
      ChangeNotifierProvider(create: (_) => CurrentMessageListModel()),
      ChangeNotifierProvider(create: (_) => FriendListModel()),
      ChangeNotifierProvider(create: (_) => FriendApplicationModel()),
      ChangeNotifierProvider(create: (_) => GroupApplicationModel()),
      ChangeNotifierProvider(create: (_) => KeyBoradModel()),
    ],
    child: MaterialApp(home: LoginPage()),
  ));
}
