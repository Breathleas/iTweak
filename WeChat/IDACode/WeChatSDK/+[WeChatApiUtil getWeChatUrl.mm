id __cdecl +[WeChatApiUtil getWeChatUrl:withAppSupportContentFlag:](WeChatApiUtil_meta *self, SEL a2, id a3, unsigned __int64 a4)
{
  unsigned __int64 v4; // x20
  void *v5; // x19
  void *v6; // x0
  id result; // x0
  void *v8; // x19
  void *v9; // x0
  void *v10; // x0
  void *v11; // x0

  v4 = a4;
  if ( a3 )
  {
    v5 = objc_msgSend(&OBJC_CLASS___NSString, "stringWithFormat:", CFSTR("weixin://app/%@/"), a3);
    if ( v4 )
    {
      v6 = objc_msgSend(
             &OBJC_CLASS___NSString,
             "stringWithFormat:",
             CFSTR("?%@=%lld"),
             CFSTR("supportcontentfromwx"),
             v4);
      v5 = objc_msgSend(v5, "stringByAppendingString:", v6);
    }
    result = (id)objc_msgSend(&OBJC_CLASS___NSURL, "URLWithString:", v5);
  }
  else
  {
    v8 = objc_msgSend(&OBJC_CLASS___WXLogUtil, "sharedInstance");
    v9 = objc_msgSend(&OBJC_CLASS___NSString, "stringWithFormat:", CFSTR("app is nil"));
    v10 = objc_msgSend(&OBJC_CLASS___NSString, "stringWithFormat:", CFSTR("Error:%@"), v9);
    v11 = objc_msgSend(&OBJC_CLASS___NSString, "stringWithFormat:", CFSTR("wxlog:%@"), v10);
    objc_msgSend(v8, "printLog:level:", v11, 0LL);
    result = 0LL;
  }
  return result;
}