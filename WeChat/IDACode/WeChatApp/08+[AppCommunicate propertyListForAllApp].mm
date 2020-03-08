id __cdecl +[AppCommunicate propertyListForAllApp](AppCommunicate_meta *self, SEL a2)
{
  void *v2; // x0
  void *v3; // x0
  void *v4; // x19
  void *v5; // x0
  __int64 v6; // x20
  struct objc_object *v7; // x0
  void *v8; // x21
  void *v9; // x0
  __int64 v10; // x23
  void *v11; // x0
  void *v12; // x0
  void *v13; // x23
  __int64 v14; // x1
  __int64 v15; // x22
  __int64 v17; // [xsp+8h] [xbp-38h]

  v2 = objc_msgSend(self, "getDataPasteboard");
  v3 = (void *)objc_retainAutoreleasedReturnValue(v2);
  v4 = v3;
  if ( v3 )
  {
    v5 = objc_msgSend(v3, "dataForPasteboardType:", CFSTR("content"));
    v6 = objc_retainAutoreleasedReturnValue(v5);
    if ( !v6 )
    {
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        4LL,
        0LL,
        0LL,
        "AppCommunicate.m",
        38LL,
        "+[AppCommunicate propertyListForAllApp]",
        CFSTR("pasteData is nil"),
        0LL);
      v15 = 0LL;
LABEL_14:
      objc_release(v6);
      goto LABEL_15;
    }
    v7 = +[WeChatApiUtil propertyListFromData:](&OBJC_CLASS___WeChatApiUtil, "propertyListFromData:", v6);
    v8 = (void *)objc_retainAutoreleasedReturnValue(v7);
    if ( v8 )
    {
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        2LL,
        0LL,
        0LL,
        "AppCommunicate.m",
        49LL,
        "+[AppCommunicate propertyListForAllApp]",
        CFSTR("clear pastboard data"));
      v9 = objc_msgSend(&OBJC_CLASS___NSData, "data");
      v10 = objc_retainAutoreleasedReturnValue(v9);
      objc_msgSend(v4, "setData:forPasteboardType:", v10, CFSTR("content"));
      objc_release(v10);
      v11 = objc_msgSend(&OBJC_CLASS___NSDictionary, "class");
      if ( (unsigned __int64)objc_msgSend(v8, "isKindOfClass:", v11) & 1 )
      {
        v12 = objc_msgSend(v8, "stringForKey:", CFSTR("old_text"));
        v13 = (void *)objc_retainAutoreleasedReturnValue(v12);
        if ( objc_msgSend(v13, "length") )
          objc_msgSend(v4, "setString:", v13);
        v15 = objc_retain(v8, v14);
        objc_release(v13);
        goto LABEL_13;
      }
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        4LL,
        0LL,
        0LL,
        "AppCommunicate.m",
        53LL,
        "+[AppCommunicate propertyListForAllApp]",
        CFSTR("idPaste[%@] is not dictionary"),
        v8);
    }
    else
    {
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        4LL,
        0LL,
        0LL,
        "AppCommunicate.m",
        44LL,
        "+[AppCommunicate propertyListForAllApp]",
        CFSTR("idPaste is nil"),
        v17);
    }
    v15 = 0LL;
LABEL_13:
    objc_release(v8);
    goto LABEL_14;
  }
  +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
    &OBJC_CLASS___iConsole,
    "logWithLevel:module:errorCode:file:line:func:format:",
    4LL,
    0LL,
    0LL,
    "AppCommunicate.m",
    31LL,
    "+[AppCommunicate propertyListForAllApp]",
    CFSTR("get general pasteboard fail "));
  v15 = 0LL;
LABEL_15:
  objc_release(v4);
  return (id)objc_autoreleaseReturnValue(v15);
}