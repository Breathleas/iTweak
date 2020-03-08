bool __cdecl -[MicroMessengerAppDelegate internalApplication:openURL:sourceApplication:annotation:](MicroMessengerAppDelegate *self, SEL a2, id a3, id a4, id a5, id a6)
{
  id v6; // x23
  id v7; // x22
  id v8; // x20
  MicroMessengerAppDelegate *v9; // x21
  __int64 v10; // x19
  __int64 v11; // x1
  __int64 v12; // x20
  __int64 v13; // x1
  __int64 v14; // x22
  __int64 v15; // x1
  __int64 v16; // x23
  void *v17; // x0
  void *v18; // x24

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = self;
  v10 = objc_retain(a3, a2);
  v12 = objc_retain(v8, v11);
  v14 = objc_retain(v7, v13);
  v16 = objc_retain(v6, v15);
  +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
    &OBJC_CLASS___iConsole,
    "logWithLevel:module:errorCode:file:line:func:format:",
    2LL,
    0LL,
    0LL,
    "MicroMessengerAppDelegate.mm",
    2113LL,
    "-[MicroMessengerAppDelegate internalApplication:openURL:sourceApplication:annotation:]",
    CFSTR("source app[%@], url[%@], annotation[%@]"),
    v14,
    v12,
    v16);
  v17 = objc_msgSend(&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  v18 = (void *)objc_retainAutoreleasedReturnValue(v17);
  objc_msgSend(
    v18,
    "postNotificationName:object:userInfo:",
    CFSTR("MMApplicationWillHandleOpenURLNotification"),
    0LL,
    0LL);
  objc_release(v18);
  LOBYTE(v9) = (unsigned __int64)-[MicroMessengerAppDelegate application:handleOpenURL:bundleID:annotation:](
                                   v9,
                                   "application:handleOpenURL:bundleID:annotation:",
                                   v10,
                                   v12,
                                   v14,
                                   v16);
  objc_release(v16);
  objc_release(v14);
  objc_release(v12);
  objc_release(v10);
  return (char)v9;
}