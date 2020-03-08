

void __cdecl -[PDBusinessManager yuYueTimeEnd:](PDBusinessManager *self, SEL a2, bool a3)
{
  PDBusinessManager *v3; // x19
  __int64 (*v4)(void); // x23
  NewProductModel *v5; // x0
  void *v6; // x0
  void *v7; // x21
  void *v8; // x0
  __int64 v9; // x22
  __int64 (*v10)(void); // x24
  NewProductModel *v11; // x0
  void *v12; // x0
  void *v13; // x22
  void *v14; // x0
  __int64 v15; // x23
  PDWeakTimer *v16; // x0
  void *v17; // x22
  void *v18; // x0
  void *v19; // x22
  NewProductModel *v20; // x0
  void *v21; // x0
  void *v22; // x19
  void *v23; // x0
  __int64 v24; // x20
  void *v25; // x0
  __int64 v26; // x21
  const __CFString *v27; // [xsp+8h] [xbp-48h]
  __int64 v28; // [xsp+10h] [xbp-40h]

  if ( a3 )
  {
    v3 = self;
    v4 = (__int64 (*)(void))off_104B953D0;
    v5 = -[PDBusinessManager model](self, "model");
    v6 = (void *)objc_retainAutoreleasedReturnValue(v5);
    v7 = v6;
    v8 = objc_msgSend(v6, "yuyueType");
    v9 = objc_retainAutoreleasedReturnValue(v8);
    LODWORD(v4) = v4();
    objc_release(v9);
    objc_release(v7);
    if ( (_DWORD)v4 )
    {
      v10 = (__int64 (*)(void))off_104B953D0;
      v11 = -[PDBusinessManager model](v3, "model");
      v12 = (void *)objc_retainAutoreleasedReturnValue(v11);
      v13 = v12;
      v14 = objc_msgSend(v12, "productCode");
      v15 = objc_retainAutoreleasedReturnValue(v14);
      LODWORD(v10) = v10();
      objc_release(v15);
      objc_release(v13);
      if ( (_DWORD)v10 )
      {
        v16 = -[PDBusinessManager weakTimer](v3, "weakTimer");
        v17 = (void *)objc_retainAutoreleasedReturnValue(v16);
        objc_msgSend(v17, "invalidate");
        objc_release(v17);
        v18 = objc_msgSend(&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
        v19 = (void *)objc_retainAutoreleasedReturnValue(v18);
        v27 = CFSTR("wareId");
        v20 = -[PDBusinessManager model](v3, "model");
        v21 = (void *)objc_retainAutoreleasedReturnValue(v20);
        v22 = v21;
        v23 = objc_msgSend(v21, "productCode");
        v24 = objc_retainAutoreleasedReturnValue(v23);
        v28 = v24;
        v25 = objc_msgSend(&OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1LL);
        v26 = objc_retainAutoreleasedReturnValue(v25);
        objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("changeWare"), 0LL, v26);
        objc_release(v26);
        objc_release(v24);
        objc_release(v22);
        objc_release(v19);
      }
    }
  }
}