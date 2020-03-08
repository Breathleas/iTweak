id __cdecl +[AppCommunicate propertyListForAppID:](AppCommunicate_meta *self, SEL a2, id a3)
{
  AppCommunicate_meta *v3; // x20
  void *v4; // x0
  void *v5; // x19
  void *v6; // x0
  void *v7; // x0
  void *v8; // x20
  void *v9; // x0
  __int64 v10; // x21

  v3 = self;
  v4 = (void *)objc_retain(a3, a2);
  v5 = v4;
  if ( v4 && objc_msgSend(v4, "length") )
  {
    v6 = objc_msgSend(v3, "propertyListForAllApp");
    v7 = (void *)objc_retainAutoreleasedReturnValue(v6);
    v8 = v7;
    if ( v7 )
    {
      v9 = objc_msgSend(v7, "objectForKey:", v5);
      v10 = objc_retainAutoreleasedReturnValue(v9);
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
        75LL,
        "+[AppCommunicate propertyListForAppID:]",
        CFSTR("pasteDictionary is nil"));
      v10 = 0LL;
    }
    objc_release(v8);
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
      68LL,
      "+[AppCommunicate propertyListForAppID:]",
      CFSTR("appID[%@] invaild"),
      v5);
    v10 = 0LL;
  }
  objc_release(v5);
  return (id)objc_autoreleaseReturnValue(v10);
}