

bool __cdecl -[MicroMessengerAppDelegate application:handleOpenURL:bundleID:annotation:](MicroMessengerAppDelegate *self, SEL a2, id a3, id a4, id a5, id a6)
{
  id v6; // x22
  id v7; // x21
  id v8; // x20
  MicroMessengerAppDelegate *self; // x23
  __int64 v10; // x19
  __int64 v11; // x1
  void *openURL; // x20
  __int64 v13; // x1
  void *bundleid; // x21
  __int64 v15; // x1
  __int64 v16; // x22
  void *v17; // x0
  __int64 v18; // x25
  void *v19; // x0
  void *v20; // x25
  int v21; // w26
  void *v22; // x0
  void *v23; // x25
  void *v24; // x0
  void *v25; // x0
  WWKMsgForwarder *v26; // x24
  struct objc_object *v27; // x0
  void *v28; // x23
  void *v29; // x0
  void *v30; // x0
  void *v31; // x25
  char v32; // w25
  void *v33; // x0
  void *v34; // x25
  void *v35; // x0
  __int64 v36; // x0
  __int64 v37; // x26
  void *v38; // x0
  void *v39; // x23
  __int64 v40; // x1
  void *v41; // x0
  __int64 v42; // x26
  WWKMsgForwarder *v43; // x0
  WWKMsgForwarder *v44; // x23
  struct objc_object *v45; // x0
  void *v46; // x24
  void *v47; // x0
  void *v48; // x0
  struct objc_object *v49; // x0
  void *v50; // x0
  void *v51; // x24
  void *v52; // x0
  __int64 v53; // x25
  signed __int64 v54; // x2
  void *v55; // x0
  void *v56; // x26
  unsigned __int64 v57; // x25
  WWKMsgForwarder *v58; // x0
  struct objc_object *v60; // x0
  void *v61; // x26
  void *v62; // x0
  void *v63; // x0
  void *v64; // x27
  __int64 v65; // [xsp+18h] [xbp-58h]

  v6 = a6;
  v7 = a5; //bundleid
  v8 = a4; //openURL
  self = self;
  v10 = objc_retain(a3, a2); //Application
  openURL = (void *)objc_retain(v8, v11); //openURL
  bundleid = (void *)objc_retain(v7, v13); //bundleid
  v16 = objc_retain(v6, v15);
  v17 = objc_msgSend(openURL, "absoluteString");
  v18 = objc_retainAutoreleasedReturnValue(v17);
  -[MicroMessengerAppDelegate reportHandleOpenUrl:schemeUrl:](self, "reportHandleOpenUrl:schemeUrl:", bundleid, v18);
  objc_release(v18);
  v19 = objc_msgSend(openURL, "absoluteString");
  v20 = (void *)objc_retainAutoreleasedReturnValue(v19);
  v21 = (unsigned __int64)objc_msgSend(v20, "hasPrefix:", CFSTR("weixinapp://betalogin/"));
  objc_release(v20);
  if ( !v21 )
  {
    if ( (unsigned __int64)-[MicroMessengerAppDelegate handleOpenURL:bundleID:](self, "handleOpenURL:bundleID:", openURL, bundleid) & 1 )
    {
      v32 = 1;
      goto LABEL_33;
    }
    if ( !(unsigned int)objc_msgSend(openURL, "isFileURL") )
    {
      if ( (unsigned int)-[MicroMessengerAppDelegate isWeWorkURL:](self, "isWeWorkURL:", openURL) )
      {
        v43 = objc_msgSend(&OBJC_CLASS___WWKMsgForwarder, "alloc");
        v44 = -[WWKMsgForwarder init](v43, "init");
        v32 = (unsigned __int64)+[WWKApi handleOpenURL:delegate:](
                                  &OBJC_CLASS___WWKApi,
                                  "handleOpenURL:delegate:",
                                  openURL,
                                  v44);
      }
      else
      {
        v45 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v46 = (void *)objc_retainAutoreleasedReturnValue(v45);
        v47 = objc_msgSend(&OBJC_CLASS___MMFacebookMgr, "class");
        v48 = objc_msgSend(v46, "getService:", v47);
        v44 = (WWKMsgForwarder *)objc_retainAutoreleasedReturnValue(v48);
        objc_release(v46);
        if ( !(unsigned int)objc_msgSend(v44, "hasInitSDK") )
          goto LABEL_37;
        if ( (unsigned int)objc_msgSend(v44, "needSetFacebookUsageType") )
        {
          v49 = +[CAppViewControllerManager getAppViewControllerManager](
                  &OBJC_CLASS___CAppViewControllerManager,
                  "getAppViewControllerManager");
          v50 = (void *)objc_retainAutoreleasedReturnValue(v49);
          v51 = v50;
          v52 = objc_msgSend(v50, "getNewMainFrameViewController");
          v53 = objc_retainAutoreleasedReturnValue(v52);
          objc_release(v53);
          if ( v53 )
            v54 = 1LL;
          else
            v54 = 2LL;
          objc_msgSend(v44, "setFacebookUsageType:", v54);
          objc_release(v51);
        }
        if ( (unsigned __int64)objc_msgSend(
                                 v44,
                                 "application:openURL:sourceApplication:annotation:",
                                 v10,
                                 openURL,
                                 bundleid,
                                 v16) & 1 )
          v32 = 1;
        else
LABEL_37:
          v32 = 0;
      }
      v58 = v44;
      goto LABEL_32;
    }
    v33 = objc_msgSend(&OBJC_CLASS___NSFileManager, "defaultManager");
    v34 = (void *)objc_retainAutoreleasedReturnValue(v33);
    v35 = objc_msgSend(openURL, "path");
    v36 = objc_retainAutoreleasedReturnValue(v35);
    v37 = v36;
    v65 = 0LL;
    v38 = objc_msgSend(v34, "attributesOfItemAtPath:error:", v36, &v65);
    v39 = (void *)objc_retainAutoreleasedReturnValue(v38);
    v26 = (WWKMsgForwarder *)objc_retain(v65, v40);
    objc_release(v37);
    objc_release(v34);
    if ( v26 )
    {
      v41 = objc_msgSend(v26, "localizedDescription");
      v42 = objc_retainAutoreleasedReturnValue(v41);
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        4LL,
        0LL,
        0LL,
        "MicroMessengerAppDelegate.mm",
        2071LL,
        "-[MicroMessengerAppDelegate application:handleOpenURL:bundleID:annotation:]",
        CFSTR("handle open url error:%@"),
        v42);
      objc_release(v42);
    }
    else
    {
      v55 = objc_msgSend(v39, "objectForKey:", NSFileSize);
      v56 = (void *)objc_retainAutoreleasedReturnValue(v55);
      v57 = (unsigned __int64)objc_msgSend(v56, "unsignedLongLongValue");
      objc_release(v56);
      if ( v57 < 0x8000001 )
      {
        +[OpenApiMgrHelper makeFileInternalMessage:](&OBJC_CLASS___OpenApiMgrHelper, "makeFileInternalMessage:", openURL);
        v60 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v61 = (void *)objc_retainAutoreleasedReturnValue(v60);
        v62 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        v63 = objc_msgSend(v61, "getService:", v62);
        v64 = (void *)objc_retainAutoreleasedReturnValue(v63);
        v32 = 1;
        objc_msgSend(v64, "doShareApi:bundleID:fromSysCopy:", CFSTR("wx4310bbd51be7d979"), bundleid, 1LL);
        objc_release(v64);
        objc_release(v61);
        goto LABEL_27;
      }
      +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
        &OBJC_CLASS___iConsole,
        "logWithLevel:module:errorCode:file:line:func:format:",
        4LL,
        0LL,
        0LL,
        "MicroMessengerAppDelegate.mm",
        2063LL,
        "-[MicroMessengerAppDelegate application:handleOpenURL:bundleID:annotation:]",
        CFSTR("file size over limit 128MB, fileSize:%0.3fMB"),
        v57 >> 20);
    }
    v32 = 0;
LABEL_27:
    objc_release(v39);
LABEL_31:
    v58 = v26;
LABEL_32:
    objc_release(v58);
    goto LABEL_33;
  }
  if ( objc_msgSend(bundleid, "length")
    && ((unsigned __int64)objc_msgSend(bundleid, "isEqualToString:", CFSTR("com.tencent.wc.xin")) & 1
     || (unsigned int)objc_msgSend(bundleid, "isEqualToString:", CFSTR("com.tencent.wx")))
    && (unsigned int)+[CAppViewControllerManager hasEnterWechatMain](
                       &OBJC_CLASS___CAppViewControllerManager,
                       "hasEnterWechatMain") )
  {
    v22 = objc_msgSend(openURL, "absoluteString");
    v23 = (void *)objc_retainAutoreleasedReturnValue(v22);
    v24 = objc_msgSend(CFSTR("weixinapp://betalogin/"), "length");
    v25 = objc_msgSend(v23, "substringFromIndex:", v24);
    v26 = (WWKMsgForwarder *)objc_retainAutoreleasedReturnValue(v25);
    objc_release(v23);
    if ( objc_msgSend(v26, "length") )
    {
      v27 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
      v28 = (void *)objc_retainAutoreleasedReturnValue(v27);
      v29 = objc_msgSend(&OBJC_CLASS___PushLoginURLMgr, "class");
      v30 = objc_msgSend(v28, "getService:", v29);
      v31 = (void *)objc_retainAutoreleasedReturnValue(v30);
      objc_msgSend(v31, "loginFormOtherApp:bundleID:", v26, bundleid);
      objc_release(v31);
      objc_release(v28);
      v32 = 1;
    }
    else
    {
      v32 = 0;
    }
    goto LABEL_31;
  }
  v32 = 0;
LABEL_33:
  objc_release(v16);
  objc_release(bundleid);
  objc_release(openURL);
  objc_release(v10);
  return v32;
}
