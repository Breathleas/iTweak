

bool __cdecl -[MicroMessengerAppDelegate application:openURL:sourceApplication:annotation:](MicroMessengerAppDelegate *self, SEL a2, id a3, id a4, id a5, id a6)
{
  id v6; // x22
  id v7; // x21
  id v8; // x20
  MicroMessengerAppDelegate *v9; // x23
  __int64 v10; // x19
  __int64 v11; // x1
  __int64 v12; // x20
  __int64 v13; // x1
  __int64 v14; // x21
  __int64 v15; // x1
  __int64 v16; // x1
  __int64 v17; // x22
  char v18; // w23
  __int64 v19; // x1
  __int64 v20; // x1
  __int64 v21; // x1
  void **v23; // [xsp+8h] [xbp-78h]
  __int64 v24; // [xsp+10h] [xbp-70h]
  void *(__fastcall *v25)(__int64); // [xsp+18h] [xbp-68h]
  void *v26; // [xsp+20h] [xbp-60h]
  MicroMessengerAppDelegate *v27; // [xsp+28h] [xbp-58h]
  __int64 v28; // [xsp+30h] [xbp-50h]
  __int64 v29; // [xsp+38h] [xbp-48h]
  __int64 v30; // [xsp+40h] [xbp-40h]
  __int64 v31; // [xsp+48h] [xbp-38h]

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = self;
  v10 = objc_retain(a3, a2);
  v12 = objc_retain(v8, v11);
  v14 = objc_retain(v7, v13);
  v17 = objc_retain(v6, v15);
  if ( v9->m_bLaunchFinish )
  {
    v18 = (unsigned __int64)-[MicroMessengerAppDelegate internalApplication:openURL:sourceApplication:annotation:](
                              v9,
                              "internalApplication:openURL:sourceApplication:annotation:",
                              v10,
                              v12,
                              v14,
                              v17);
  }
  else
  {
    v23 = _NSConcreteStackBlock;
    v24 = 3254779904LL;
    v25 = sub_101C9D758;
    v26 = &unk_106B1F178;
    v27 = v9;
    v28 = objc_retain(v10, v16);
    v29 = objc_retain(v12, v19);
    v30 = objc_retain(v14, v20);
    v31 = objc_retain(v17, v21);
    dispatch_async(&_dispatch_main_q, &v23);
    objc_release(v31);
    objc_release(v30);
    objc_release(v29);
    objc_release(v28);
    v18 = 1;
  }
  objc_release(v17);
  objc_release(v14);
  objc_release(v12);
  objc_release(v10);
  return v18;
}