// local variable allocation has failed, the output may be wrong!
id __cdecl +[OpenApiHandler createOpenParamWithUrl:apiName:appID:bundleID:isLaunchByUniversalLink:](OpenApiHandler_meta *self, SEL a2, id a3, id a4, id a5, id a6, bool a7)
{
  _BOOL8 isLaunchByUniversalLink; // x22
  id v8; // x19
  id v9; // x21
  id v10; // x23
  __int64 openURL; // x20
  __int64 v12; // x1
  __int64 apiName; // x23
  __int64 v14; // x1
  __int64 appid; // x21
  __int64 v16; // x1
  __int64 bundleid; // x26
  OpenApiParameter *v18; // x0
  OpenApiParameter *v19; // x19
  struct objc_object *v20; // x0
  __int64 v21; // x22
  struct objc_object *v22; // x0
  __int64 v23; // x22
  NSString *v24; // x0
  void *v25; // x22
  void *v26; // x23
  NSString *v27; // x0
  __int64 v28; // x20
  NSString *v29; // x0
  __int64 v30; // x23
  signed __int64 v31; // x2
  struct objc_object *v32; // x0
  __int64 v33; // x21
  NSString *v34; // x0
  void *v35; // x21
  void *v36; // x22
  NSString *v37; // x0
  void *v38; // x21
  NSString *v39; // x0
  void *v40; // x22
  void *v41; // x20
  __int64 v43; // [xsp+8h] [xbp-58h]
  __int128 v44; // [xsp+10h] [xbp-50h]

  isLaunchByUniversalLink = a7; //isLaunchByUniversalLink
  v8 = a6; //bundleid: com.taofang.iphone
  v9 = a5; //appid: wxc7929cc3d3fda545
  v10 = a4; //apiName :sendreq
  openURL = objc_retain(a3, a2); //url: weixin://app/wxc7929cc3d3fda545/sendreq/?
  apiName = objc_retain(v10, v12); 
  appid = objc_retain(v9, v14); //appid
  bundleid = objc_retain(v8, v16); //bundleid
  v18 = objc_msgSend(&OBJC_CLASS___OpenApiParameter, "alloc");
  v19 = objc_msgSend(v18, "init");
  -[OpenApiParameter setApiName:](v19, "setApiName:", apiName);
  -[OpenApiParameter setAppID:](v19, "setAppID:", appid);
  -[OpenApiParameter setBundleID:](v19, "setBundleID:", bundleid);
  -[OpenApiParameter setIsLaunchByUniversalLink:](v19, "setIsLaunchByUniversalLink:", isLaunchByUniversalLink);
  v20 = +[AppCommunicate appCommunicateDataForAppID:](&OBJC_CLASS___AppCommunicate, "appCommunicateDataForAppID:", appid);
  v21 = objc_retainAutoreleasedReturnValue(v20);
  -[OpenApiParameter setAppData:](v19, "setAppData:", v21);
  -[OpenApiParameter setTokenVerifyResult:](v19, "setTokenVerifyResult:", 0LL);
  if ( (unsigned int)-[OpenApiParameter isLaunchByUniversalLink](v19, "isLaunchByUniversalLink") )
  {
    v44 = 0uLL;
    v43 = 0LL;
    v22 = +[OpenApiHandler parseAndRemoveAppExtraDataFromUrl:token:contextID:sdkBundleID:](
            &OBJC_CLASS___OpenApiHandler,
            "parseAndRemoveAppExtraDataFromUrl:token:contextID:sdkBundleID:",
            openURL,
            (char *)&v44 + 8,
            &v44,
            &v43);
    v23 = objc_retainAutoreleasedReturnValue(v22);
    objc_release(openURL);
    -[OpenApiParameter setUrl:](v19, "setUrl:", v23);
    objc_release(v23);
    -[OpenApiParameter setToken:](v19, "setToken:", *((_QWORD *)&v44 + 1));
    -[OpenApiParameter setContextID:](v19, "setContextID:", (_QWORD)v44);
    -[OpenApiParameter setSdkBundleID:](v19, "setSdkBundleID:", v43);
    v24 = -[OpenApiParameter token](v19, "token");
    v25 = (void *)objc_retainAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v25, "length");
    objc_release(v25);
    if ( v26 )
    {
      v27 = -[OpenApiParameter token](v19, "token");
      v28 = objc_retainAutoreleasedReturnValue(v27);
      v29 = -[OpenApiParameter universalLink](v19, "universalLink");
      v30 = objc_retainAutoreleasedReturnValue(v29);
      if ( (unsigned int)+[OpenApiHandler checkTokenValid:universalLink:](
                           &OBJC_CLASS___OpenApiHandler,
                           "checkTokenValid:universalLink:",
                           v28,
                           v30) )
        v31 = 1LL;
      else
        v31 = 2LL;
      -[OpenApiParameter setTokenVerifyResult:](v19, "setTokenVerifyResult:", v31);
      objc_release(v30);
      objc_release(v28);
    }
  }
  else
  {
    LOBYTE(v44) = 0;
    *((_QWORD *)&v44 + 1) = 0LL;
    v32 = +[OpenApiHandler parseAndRemoveAppExtraDataFromUrl:sdkBundleID:isDegradeLaunchByScheme:](
            &OBJC_CLASS___OpenApiHandler,
            "parseAndRemoveAppExtraDataFromUrl:sdkBundleID:isDegradeLaunchByScheme:",
            openURL,
            (char *)&v44 + 8,
            &v44);
    v33 = objc_retainAutoreleasedReturnValue(v32);
    -[OpenApiParameter setUrl:](v19, "setUrl:", v33);
    -[OpenApiParameter setSdkBundleID:](v19, "setSdkBundleID:", *((_QWORD *)&v44 + 1));
    -[OpenApiParameter setIsDegradeLaunchByScheme:](v19, "setIsDegradeLaunchByScheme:", (unsigned __int8)v44);
    v34 = -[OpenApiParameter universalLink](v19, "universalLink");
    v35 = (void *)objc_retainAutoreleasedReturnValue(v34);
    v36 = objc_msgSend(v35, "length");
    if ( v36 )
    {
      v37 = -[OpenApiParameter apiName](v19, "apiName");
      v38 = (void *)objc_retainAutoreleasedReturnValue(v37);
      if ( objc_msgSend(v38, "caseInsensitiveCompare:", CFSTR("auth")) )
      {
        objc_release(v38);
      }
      else
      {
        v39 = -[OpenApiParameter bundleID](v19, "bundleID");
        v40 = (void *)objc_retainAutoreleasedReturnValue(v39);
        v41 = objc_msgSend(v40, "length");
        if ( !v41 )
          return (id)objc_autoreleaseReturnValue(v19);
      }
      -[OpenApiParameter clearAppDataUniversalLink](v19, "clearAppDataUniversalLink");
      return (id)objc_autoreleaseReturnValue(v19);
    }
  }
  return (id)objc_autoreleaseReturnValue(v19);
}