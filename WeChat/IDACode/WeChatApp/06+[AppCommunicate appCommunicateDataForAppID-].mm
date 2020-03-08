id __cdecl +[AppCommunicate appCommunicateDataForAppID:](AppCommunicate_meta *self, SEL a2, id a3)
{
  AppCommunicate_meta *v3; // x20
  void *v4; // x0
  void *v5; // x19
  void *v6; // x0
  void *v7; // x20
  AppCommunicateData *v8; // x0
  AppCommunicateData *v9; // x21
  void *v10; // x0
  __int64 v11; // x22

  v3 = self;
  v4 = (void *)objc_retain(a3, a2);
  v5 = v4;
  if ( v4 && objc_msgSend(v4, "length") )
  {
    v6 = objc_msgSend(v3, "propertyListForAppID:", v5);
    v7 = (void *)objc_retainAutoreleasedReturnValue(v6);
    if ( v7 )
    {
      v8 = objc_msgSend(&OBJC_CLASS___AppCommunicateData, "alloc");
      v9 = -[AppCommunicateData initWithPropertList:](v8, "initWithPropertList:", v7);
      if ( v9 )
      {
        v10 = objc_msgSend(v7, "objectForKey:", CFSTR("fileData"));
        v11 = objc_retainAutoreleasedReturnValue(v10);
        -[AppCommunicateData setFileData:](v9, "setFileData:", v11);
        objc_release(v11);
      }
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
        138LL,
        "+[AppCommunicate appCommunicateDataForAppID:]",
        CFSTR("dict is nil"));
      v9 = 0LL;
    }
    objc_release(v7);
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
      132LL,
      "+[AppCommunicate appCommunicateDataForAppID:]",
      CFSTR("appID[%@] invaild"),
      v5);
    v9 = 0LL;
  }
  objc_release(v5);
  return (id)objc_autoreleaseReturnValue(v9);
}