id __cdecl +[WeChatApiUtil propertyListFromData:](WeChatApiUtil_meta *self, SEL a2, id a3)
{
  id v3; // x19
  const char *v4; // x1
  __int64 v6; // [xsp+0h] [xbp-30h]
  char v7; // [xsp+8h] [xbp-28h]

  v3 = a3;
  if ( !a3 )
    return 0LL;
  if ( (unsigned int)objc_msgSend(
                       &OBJC_CLASS___NSPropertyListSerialization,
                       "respondsToSelector:",
                       "propertyListWithData:options:format:error:") )
  {
    v6 = 0LL;
    v4 = "propertyListWithData:options:format:error:";
  }
  else
  {
    v6 = 0LL;
    v4 = "propertyListFromData:mutabilityOption:format:errorDescription:";
  }
  return (id)objc_msgSend(&OBJC_CLASS___NSPropertyListSerialization, v4, v3, 0LL, &v7, &v6, v6);
}