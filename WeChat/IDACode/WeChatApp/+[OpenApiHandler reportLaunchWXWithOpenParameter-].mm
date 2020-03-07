void __cdecl +[OpenApiHandler reportLaunchWXWithOpenParameter:](OpenApiHandler_meta *self, SEL a2, id a3)
{
  OpenApiHandler_meta *v3; // x21
  void *v4; // x19
  signed __int64 v5; // x1
  void *v6; // x0
  __int64 v7; // x23
  unsigned int v8; // w22
  unsigned int v9; // w24
  signed __int64 v10; // x1
  void *v11; // x0
  void *v12; // x22
  void *v13; // x23
  signed __int64 v14; // x1
  signed __int64 v15; // x1
  void *v16; // x0
  void *v17; // x22
  void *v18; // x23
  void *v19; // x0
  void *v20; // x22
  void *v21; // x23
  int v22; // w23
  void *v23; // x0
  void *v24; // x0
  void *v25; // x0
  void *v26; // x0
  void *v27; // x0
  void *v28; // x0
  void *v29; // x0
  void *v30; // x0
  void *v31; // x0
  void *v32; // x0
  void *v33; // x0
  void *v34; // x0
  void *v35; // x0
  void *v36; // x0
  void *v37; // x0
  void *v38; // x0
  void *v39; // x0
  void *v40; // x0
  void *v41; // x0
  void *v42; // x0
  void *v43; // x0
  void *v44; // x0
  void *v45; // x0
  void *v46; // x0
  void *v47; // x0
  void *v48; // x0
  void *v49; // x20
  void *v50; // x0
  __int64 v51; // x21
  void *v52; // x0
  void *v53; // x0
  void *v54; // x22
  void *v55; // x0
  __int64 v56; // x24
  void *v57; // x0
  void *v58; // x0
  __int64 v59; // x25
  signed int v60; // w27
  void *v61; // x0
  __int64 v62; // x26
  signed int v63; // w23
  void *v64; // x0
  void *v65; // x0
  __int64 v66; // x28
  void *v67; // [xsp+70h] [xbp-E0h]
  void *v68; // [xsp+78h] [xbp-D8h]
  void *v69; // [xsp+80h] [xbp-D0h]
  void *v70; // [xsp+88h] [xbp-C8h]
  void *v71; // [xsp+90h] [xbp-C0h]
  void *v72; // [xsp+A0h] [xbp-B0h]
  signed int v73; // [xsp+A8h] [xbp-A8h]
  signed int v74; // [xsp+ACh] [xbp-A4h]
  __int64 v75; // [xsp+B0h] [xbp-A0h]
  __int64 v76; // [xsp+B8h] [xbp-98h]
  __int64 v77; // [xsp+C0h] [xbp-90h]
  __int64 v78; // [xsp+C8h] [xbp-88h]
  __int64 v79; // [xsp+D0h] [xbp-80h]
  __int64 v80; // [xsp+D8h] [xbp-78h]
  __int64 v81; // [xsp+E0h] [xbp-70h]
  __int64 v82; // [xsp+E8h] [xbp-68h]
  __int64 v83; // [xsp+F0h] [xbp-60h]

  v3 = self;
  v4 = (void *)objc_retain(a3, a2);
  if ( (unsigned int)objc_msgSend(v4, "isLaunchByUniversalLink") )
  {
    sub_10003A5C0(1154LL, 0LL, 1LL, 0LL);
    if ( (unsigned int)objc_msgSend(v4, "tokenVerifyResult") )
    {
      if ( (unsigned int)objc_msgSend(v4, "tokenVerifyResult") == 1 )
      {
        v5 = 2LL;
      }
      else
      {
        if ( (unsigned int)objc_msgSend(v4, "tokenVerifyResult") != 2 )
          goto LABEL_15;
        v5 = 3LL;
      }
    }
    else
    {
      v5 = 1LL;
    }
    sub_10003A5C0(1154LL, v5, 1LL, 0LL);
LABEL_15:
    if ( !(unsigned int)objc_msgSend(v4, "isSDKResendByRefreshToken") )
      goto LABEL_30;
    sub_10003A5C0(1154LL, 4LL, 1LL, 0LL);
    if ( (unsigned int)objc_msgSend(v4, "tokenVerifyResult") == 1 )
    {
      v15 = 5LL;
    }
    else
    {
      if ( (unsigned int)objc_msgSend(v4, "tokenVerifyResult") )
      {
LABEL_21:
        +[OpenApiHandler reportRefreshTokenResultWithOpenParameter:errMsg:](
          &OBJC_CLASS___OpenApiHandler,
          "reportRefreshTokenResultWithOpenParameter:errMsg:",
          v4,
          0LL);
        goto LABEL_30;
      }
      v15 = 6LL;
    }
    sub_10003A5C0(1154LL, v15, 1LL, 0LL);
    goto LABEL_21;
  }
  sub_10003A5C0(1154LL, 16LL, 1LL, 0LL);
  v6 = objc_msgSend(v4, "sdkVersion");
  v7 = objc_retainAutoreleasedReturnValue(v6);
  v8 = (unsigned __int64)+[OpenApiHandler convertVersionStrToInt:](
                           &OBJC_CLASS___OpenApiHandler,
                           "convertVersionStrToInt:",
                           v7);
  v9 = (unsigned __int64)+[OpenApiHandler convertVersionStrToInt:](
                           &OBJC_CLASS___OpenApiHandler,
                           "convertVersionStrToInt:",
                           CFSTR("1.8.6.0"));
  if ( v8 >= v9 )
    v10 = 17LL;
  else
    v10 = 18LL;
  sub_10003A5C0(1154LL, v10, 1LL, 0LL);
  if ( (unsigned int)+[DeviceInfo isiOS13plus](&OBJC_CLASS___DeviceInfo, "isiOS13plus") )
  {
    sub_10003A5C0(1154LL, 19LL, 1LL, 0LL);
    v11 = objc_msgSend(v4, "bundleID");
    v12 = (void *)objc_retainAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "length");
    if ( v13 )
      v14 = 20LL;
    else
      v14 = 21LL;
    sub_10003A5C0(1154LL, v14, 1LL, 0LL);
  }
  if ( (unsigned int)objc_msgSend(v4, "isDegradeLaunchByScheme") )
  {
    sub_10003A5C0(1154LL, 22LL, 1LL, 0LL);
    v16 = objc_msgSend(v4, "bundleID");
    v17 = (void *)objc_retainAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v17, "length");
    if ( !v18 )
      sub_10003A5C0(1154LL, 23LL, 1LL, 0LL);
  }
  if ( (unsigned int)objc_msgSend(v4, "isSDKResendByRefreshToken") )
  {
    sub_10003A5C0(1154LL, 24LL, 1LL, 0LL);
    v19 = objc_msgSend(v4, "bundleID");
    v20 = (void *)objc_retainAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(v20, "length");
    if ( !v21 )
      sub_10003A5C0(1154LL, 25LL, 1LL, 0LL);
  }
LABEL_30:
  v22 = (unsigned __int64)objc_msgSend(v3, "checkAndReportReadPasteboardFail:", v4);
  if ( (unsigned int)objc_msgSend(v4, "isLaunchByUniversalLink") )
  {
    v23 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    v83 = objc_retainAutoreleasedReturnValue(v23);
    v74 = 0;
    v73 = 1;
  }
  else
  {
    v74 = 1;
    v24 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
    v83 = objc_retainAutoreleasedReturnValue(v24);
    v73 = 0;
  }
  v25 = objc_msgSend(v4, "appID");
  v26 = (void *)objc_retainAutoreleasedReturnValue(v25);
  v72 = v26;
  v27 = objc_msgSend(v26, "stringByUrlEncoded");
  v82 = objc_retainAutoreleasedReturnValue(v27);
  v28 = objc_msgSend(v4, "universalLink");
  v29 = (void *)objc_retainAutoreleasedReturnValue(v28);
  v71 = v29;
  v30 = objc_msgSend(v29, "stringByUrlEncoded");
  v81 = objc_retainAutoreleasedReturnValue(v30);
  v31 = objc_msgSend(v4, "apiName");
  v32 = (void *)objc_retainAutoreleasedReturnValue(v31);
  v70 = v32;
  v33 = objc_msgSend(v32, "stringByUrlEncoded");
  v80 = objc_retainAutoreleasedReturnValue(v33);
  v34 = objc_msgSend(v4, "bundleID");
  v35 = (void *)objc_retainAutoreleasedReturnValue(v34);
  v69 = v35;
  v36 = objc_msgSend(v35, "stringByUrlEncoded");
  v79 = objc_retainAutoreleasedReturnValue(v36);
  v37 = objc_msgSend(v4, "sdkBundleID");
  v38 = (void *)objc_retainAutoreleasedReturnValue(v37);
  v68 = v38;
  v39 = objc_msgSend(v38, "stringByUrlEncoded");
  v78 = objc_retainAutoreleasedReturnValue(v39);
  v40 = objc_msgSend(v4, "sdkVersion");
  v41 = (void *)objc_retainAutoreleasedReturnValue(v40);
  v67 = v41;
  v42 = objc_msgSend(v41, "stringByUrlEncoded");
  v77 = objc_retainAutoreleasedReturnValue(v42);
  v43 = objc_msgSend(v4, "isDegradeLaunchByScheme");
  v44 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithBool:", v43);
  v76 = objc_retainAutoreleasedReturnValue(v44);
  v45 = objc_msgSend(v4, "isSDKResendByRefreshToken");
  v46 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v75 = objc_retainAutoreleasedReturnValue(v46);
  v47 = objc_msgSend(v4, "token");
  v48 = (void *)objc_retainAutoreleasedReturnValue(v47);
  v49 = v48;
  v50 = objc_msgSend(v48, "stringByUrlEncoded");
  v51 = objc_retainAutoreleasedReturnValue(v50);
  v52 = objc_msgSend(v4, "contextID");
  v53 = (void *)objc_retainAutoreleasedReturnValue(v52);
  v54 = v53;
  v55 = objc_msgSend(v53, "stringByUrlEncoded");
  v56 = objc_retainAutoreleasedReturnValue(v55);
  v57 = objc_msgSend(v4, "tokenVerifyResult");
  v58 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v57);
  v59 = objc_retainAutoreleasedReturnValue(v58);
  if ( v22 )
  {
    v60 = 1;
    v61 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
    v62 = objc_retainAutoreleasedReturnValue(v61);
    v63 = 0;
  }
  else
  {
    v64 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    v62 = objc_retainAutoreleasedReturnValue(v64);
    v60 = 0;
    v63 = 1;
  }
  v65 = objc_msgSend(
          &OBJC_CLASS___NSString,
          "stringWithFormat:",
          CFSTR("%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@"),
          v83,
          v82,
          v81,
          v80,
          v79,
          v78,
          v77,
          v76,
          v75,
          v51,
          v56,
          v59,
          v62);
  v66 = objc_retainAutoreleasedReturnValue(v65);
  if ( v63 )
    objc_release(v62);
  if ( v60 )
    objc_release(v62);
  if ( v74 )
    objc_release(v83);
  if ( v73 )
    objc_release(v83);
  +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
    &OBJC_CLASS___iConsole,
    "logWithLevel:module:errorCode:file:line:func:format:",
    1LL,
    0LL,
    0LL,
    "OpenApiHandler+Report.mm",
    207LL,
    "+[OpenApiHandler(Report) reportLaunchWXWithOpenParameter:]",
    CFSTR("reportEvent = %@"),
    v66);
  sub_100051B2C(18191LL, v66, 0LL, 0LL);
}