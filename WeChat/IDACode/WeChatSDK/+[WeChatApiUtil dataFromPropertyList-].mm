id __cdecl +[WeChatApiUtil dataFromPropertyList:](WeChatApiUtil_meta *self, SEL a2, id a3)
{
  id v3; // x19
  id result; // x0
  __int64 v5; // [xsp+8h] [xbp-28h]

  v3 = a3;
  if ( !a3 )
    return 0LL;
  if ( (unsigned int)objc_msgSend(
                       &OBJC_CLASS___NSPropertyListSerialization,
                       "respondsToSelector:",
                       "dataWithPropertyList:format:options:error:") )
  {
    v5 = 0LL;
    result = (id)objc_msgSend(
                   &OBJC_CLASS___NSPropertyListSerialization,
                   "dataWithPropertyList:format:options:error:",
                   v3,
                   200LL,
                   0LL,
                   &v5);
  }
  else
  {
    v5 = 0LL;
    result = (id)objc_msgSend(
                   &OBJC_CLASS___NSPropertyListSerialization,
                   "dataFromPropertyList:format:errorDescription:",
                   v3,
                   200LL,
                   &v5);
  }
  return result;
}