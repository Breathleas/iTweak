void __cdecl -[BraceletHistoryViewController initData](BraceletHistoryViewController *self, SEL a2)
{
  BraceletHistoryViewController *v2; // x19
  struct objc_object *v3; // x0
  void **v4; // [xsp+8h] [xbp-78h]
  __int64 v5; // [xsp+10h] [xbp-70h]
  __int64 (__fastcall *v6)(); // [xsp+18h] [xbp-68h]
  void *v7; // [xsp+20h] [xbp-60h]
  __int64 v8; // [xsp+28h] [xbp-58h]
  void **v9; // [xsp+30h] [xbp-50h]
  __int64 v10; // [xsp+38h] [xbp-48h]
  __int64 (__fastcall *v11)(); // [xsp+40h] [xbp-40h]
  void *v12; // [xsp+48h] [xbp-38h]
  BraceletHistoryViewController *v13; // [xsp+50h] [xbp-30h]
  char v14; // [xsp+58h] [xbp-28h]

  v2 = self;
  objc_initWeak(&v14, self);
  v9 = _NSConcreteGlobalBlock;
  v10 = 3498049536LL;
  v11 = sub_100DC4CE4;
  v12 = &unk_1095F57E0;
  v13 = v2;
  v4 = _NSConcreteStackBlock;
  v5 = 3254779904LL;
  v6 = sub_100DC4DEC;
  v7 = &unk_1095FBD80;
  objc_copyWeak(&v8, &v14);
  v3 = +[WCCgiBlockHelper helperWithInitBlock:startBlock:successBlock:failBlock:](
         &OBJC_CLASS___WCCgiBlockHelper,
         "helperWithInitBlock:startBlock:successBlock:failBlock:",
         &unk_1095FBD60,
         &v9,
         &v4,
         &unk_1095FBDD0);
  objc_unsafeClaimAutoreleasedReturnValue(v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v14);
}


id __cdecl +[WCCgiBlockHelper helperWithInitBlock:startBlock:successBlock:failBlock:](WCCgiBlockHelper_meta *self, SEL a2, id a3, id a4, id a5, id a6)
{
  id v6; // x20
  id v7; // x21
  id v8; // x19
  id v9; // x23
  __int64 v10; // x24
  __int64 v11; // x1
  __int64 v12; // x19
  __int64 v13; // x1
  __int64 v14; // x22
  __int64 v15; // x1
  __int64 v16; // x21
  void *v17; // x0
  void *v18; // x20
  __int64 v19; // x0
  __int64 v20; // x23
  void *v21; // x0
  void *v22; // x23

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = j__objc_retain(a3, a2);
  v12 = j__objc_retain(v8, v11);
  v14 = j__objc_retain(v7, v13);
  v16 = j__objc_retain(v6, v15);
  v17 = (void *)j__objc_alloc(&OBJC_CLASS___WCCgiBlockHelper);
  v18 = j__objc_msgSend(v17, "init");
  v19 = (*(__int64 (__fastcall **)(id))(v10 + 16))(v9);
  v20 = j__objc_retainAutoreleasedReturnValue(v19);
  j__objc_release(v10);
  j__objc_msgSend(v18, "setBaseCgi:", v20);
  j__objc_release(v20);
  v21 = j__objc_msgSend(v18, "baseCgi");
  v22 = (void *)j__objc_retainAutoreleasedReturnValue(v21);
  j__objc_msgSend(v22, "setBaseDelegate:", v18);
  j__objc_release(v22);
  j__objc_msgSend(v18, "setSuccessBlock:", v14);
  j__objc_release(v14);
  j__objc_msgSend(v18, "setFailBlock:", v16);
  j__objc_release(v16);
  if ( v12 )
    (*(void (__fastcall **)(__int64, void *))(v12 + 16))(v12, v18);
  j__objc_release(v12);
  return (id)j__objc_autoreleaseReturnValue(v18);
}

__int64 sub_100DC4C84() //cgiBlock -> WCBaseCgi * ^();
{
  void *v0; // x0
  void *v1; // x19

  v0 = (void *)objc_alloc(&OBJC_CLASS___WCBaseCgi);
  v1 = objc_msgSend(v0, "init");
  objc_msgSend(v1, "setCgiNumber:", 4835LL);
  objc_msgSend(v1, "setDebugModuleName:", CFSTR("GetUserHistory"));
  return objc_autoreleaseReturnValue(v1);
}


__int64 __fastcall sub_100DC4CE4(__int64 a1, void *a2) //startBlock -> void ^(WCCgiBlockHelper *);
{
  void *v2; // x21
  __int64 v3; // x22
  __int64 v4; // x20
  void *v5; // x0
  void *v6; // x19
  void *v7; // x0
  __int64 v8; // x22
  void *v9; // x0
  void *v10; // x23
  void *v11; // x0
  void *v12; // x21

  v2 = a2;
  v3 = a1;
  v4 = objc_retain(a2);
  v5 = (void *)objc_alloc(&OBJC_CLASS___GetUserHistoryPageRequest);
  v6 = objc_msgSend(v5, "init");
  v7 = objc_msgSend(*(void **)(v3 + 32), "username");
  v8 = objc_retainAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "setUsername:", v8);
  objc_release(v8);

  v9 = objc_msgSend(v2, "baseCgi"); //WCCgiBlockHelper
  v10 = (void *)objc_retainAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "setRequest:", v6);
  objc_release(v10);

  v11 = objc_msgSend(v2, "baseCgi");
  v12 = (void *)objc_retainAutoreleasedReturnValue(v11);
  objc_release(v4);
  
  objc_msgSend(v12, "start");
  objc_release(v12);
  return objc_release(v6);
}

__int64 __fastcall sub_100DC4DEC(__int64 a1, __int64 a2, __int64 a3, __int64 a4) //successBlock -> void ^(WCCgiBlockHelper *, WCBaseCgi *, GetUserHistoryPageResponse *);
{
  __int64 v4; // x20
  void *v5; // x19
  void *v6; // x0
  void *v7; // x20
  _BYTE *v8; // x21
  _BYTE *v9; // x0
  struct objc_object *v10; // x0
  void *v11; // x23
  void *v12; // x0
  void *v13; // x0
  void *v14; // x0
  void *v15; // x24
  void *v16; // x0
  __int64 v17; // x22
  void *v18; // x0
  __int64 v19; // x25
  void *v20; // x23
  void *v21; // x0
  void *v22; // x0
  void *v23; // x24
  void *v24; // x0

  v4 = a1;
  v5 = (void *)objc_retain(a4);
  v6 = (void *)objc_loadWeakRetained(v4 + 32);
  if ( v6 )
  {
    v7 = v6;
    objc_msgSend(v6, "onGetUserHistoryPage:", v5);

    if ( (unsigned int)objc_msgSend(v7, "isSelf") )
    {
      v10 = +[MMContext currentContext](&OBJC_CLASS___MMContext, "currentContext");
      v11 = (void *)objc_retainAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(&OBJC_CLASS___DeviceRankProfileMgr, "class");
      v13 = objc_msgSend(v11, "getService:", v12);
      v14 = (void *)objc_retainAutoreleasedReturnValue(v13);
      v15 = v14;
      v16 = objc_msgSend(v14, "getRankProfileHistoryPath");
      v17 = objc_retainAutoreleasedReturnValue(v16);
      objc_release(v15);
      objc_release(v11);
      
      v18 = objc_msgSend(v5, "dailySportList");
      v19 = objc_retainAutoreleasedReturnValue(v18);

      v20 = +[PBCoder encodeObject:toFile:](&OBJC_CLASS___PBCoder, "encodeObject:toFile:", v19, v17);
      objc_release(v19);
      v21 = objc_msgSend(v5, "dailySportList");
      v22 = (void *)objc_retainAutoreleasedReturnValue(v21);
      v23 = v22;
      v24 = objc_msgSend(v22, "count");
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        2LL,
        0LL,
        0LL,
        "BraceletHistoryViewController.mm",
        128LL,
        "-[BraceletHistoryViewController initData]_block_invoke_3",
        CFSTR("PBCoder ret:%u dailySportList count:%lu"),
        v20,
        v24);
      objc_release(v23);
      objc_release(v17);
    }
    objc_release(v7);
  }
  return objc_release(v5);
}