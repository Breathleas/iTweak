bool __cdecl -[MicroMessengerAppDelegate handleOpenURL:bundleID:](MicroMessengerAppDelegate *self, SEL a2, id a3, id a4)
{
  id v4; // x19
  __int64 v5; // x20
  __int64 v6; // x1
  __int64 v7; // x19
  void *v8; // x0
  __int64 v9; // x1
  void *v10; // x20
  __int64 v11; // x1
  __int64 v12; // x28
  struct objc_object *v13; // x0
  void *v14; // x21
  void *v15; // x0
  void *v16; // x0
  void *v17; // x22
  char v18; // w23
  struct objc_object *v19; // x0
  void *v20; // x21
  void *v21; // x0
  void *v22; // x0
  void *v23; // x22
  void *v24; // x0
  void *v25; // x21
  __int64 v26; // x1
  char v27; // w22
  void *v28; // x23
  void *v29; // x0
  void *v30; // x0
  void *v31; // x0
  void *v32; // x19
  void *v33; // x0
  void *v34; // x0
  struct objc_object *v35; // x0
  void *v36; // x28
  void *v37; // x0
  void *v38; // x0
  void *v39; // x19
  int v40; // w20
  void *v41; // x0
  void *v42; // x28
  void *v43; // x0
  void *v44; // x0
  void *v45; // x19
  void *v46; // x20
  URLSourceInfo *v47; // x0
  URLSourceInfo *v48; // x23
  char *v49; // x0
  void *v50; // x0
  __int64 v51; // x19
  struct objc_object *v52; // x0
  void *v53; // x19
  void *v54; // x0
  void *v55; // x0
  __int64 v56; // x23
  void *v57; // x0
  __int64 v58; // x24
  __int64 v59; // x1
  __int64 v60; // x19
  __int64 v61; // x1
  __int64 v62; // x20
  struct objc_object *v63; // x0
  __int64 v64; // x21
  void *v65; // x0
  void *v66; // x0
  void *v67; // x19
  void *v68; // x0
  void *v69; // x22
  struct objc_object *v70; // x0
  void *v71; // x19
  void *v72; // x0
  void *v73; // x0
  void *v74; // x20
  void *v75; // x0
  __int64 v76; // x23
  void *v77; // x0
  void *v78; // x0
  __int64 v79; // x23
  void *v80; // x0
  __int64 v81; // x20
  __int64 v82; // x1
  __int64 v83; // x0
  __int64 v84; // x0
  void *v85; // x0
  __int64 v86; // x23
  void *v87; // x0
  __int64 v88; // x20
  __int64 v89; // x1
  __int64 v90; // x0
  struct objc_object *v91; // x0
  void *v92; // x19
  struct objc_object *v93; // x0
  void *v94; // x19
  void *v95; // x0
  void *v96; // x0
  void *v97; // x20
  void *v98; // x0
  bool result; // w0
  struct objc_object *v100; // x0
  void *v101; // x19
  void *v102; // x0
  void *v103; // x0
  void *v104; // x20
  int v105; // w22
  struct objc_object *v106; // x0
  void *v107; // x19
  void *v108; // x0
  void *v109; // x0
  void *v110; // x20
  char v111; // w22
  int v112; // w0
  struct objc_object *v113; // x0
  void *v114; // x19
  void *v115; // x0
  void *v116; // x0
  void *v117; // x20
  __int64 v118; // x0
  struct objc_object *v119; // x0
  void *v120; // x19
  void *v121; // x0
  void *v122; // x0
  void *v123; // x20
  void *v124; // x0
  void *v125; // x22
  struct objc_object *v126; // x0
  void *v127; // x19
  void *v128; // x0
  void *v129; // x0
  void *v130; // x20
  struct objc_object *v131; // x0
  void *v132; // x19
  MMURLHandler *v133; // x0
  MMURLHandler *v134; // x23
  void *v135; // x0
  __int64 v136; // x19
  void *v137; // x0
  __int64 v138; // x20
  void *v139; // x0
  void *v140; // x19
  struct objc_object *v141; // x0
  void *v142; // x20
  void *v143; // x0
  void *v144; // x0
  void *v145; // x23
  void *v146; // x0
  void *v147; // x0
  void *v148; // x0
  void *v149; // x0
  void *v150; // x23
  struct objc_object *v151; // x0
  void *v152; // x19
  void *v153; // x0
  void *v154; // x0
  void *v155; // x20
  void *v156; // x0
  void *v157; // x0
  __int64 v158; // x22
  void *v159; // x0
  void *v160; // x0
  dispatch_time_t v161; // x19
  __int64 v162; // x1
  __int64 v163; // x0
  __int64 v164; // x1
  void *v165; // [xsp+20h] [xbp-180h]
  __int64 v166; // [xsp+28h] [xbp-178h]
  void *v167; // [xsp+30h] [xbp-170h]
  __int64 v168; // [xsp+38h] [xbp-168h]
  void *v169; // [xsp+50h] [xbp-150h]
  MicroMessengerAppDelegate *v170; // [xsp+58h] [xbp-148h]
  void **v171; // [xsp+60h] [xbp-140h]
  __int64 v172; // [xsp+68h] [xbp-138h]
  __int64 (__fastcall *v173)(); // [xsp+70h] [xbp-130h]
  void *v174; // [xsp+78h] [xbp-128h]
  __int64 v175; // [xsp+80h] [xbp-120h]
  __int64 v176; // [xsp+88h] [xbp-118h]
  void **v177; // [xsp+90h] [xbp-110h]
  __int64 v178; // [xsp+98h] [xbp-108h]
  __int64 (__fastcall *v179)(); // [xsp+A0h] [xbp-100h]
  void *v180; // [xsp+A8h] [xbp-F8h]
  __int64 v181; // [xsp+B0h] [xbp-F0h]
  void **v182; // [xsp+B8h] [xbp-E8h]
  __int64 v183; // [xsp+C0h] [xbp-E0h]
  __int64 (__fastcall *v184)(); // [xsp+C8h] [xbp-D8h]
  void *v185; // [xsp+D0h] [xbp-D0h]
  __int64 v186; // [xsp+D8h] [xbp-C8h]
  void *v187; // [xsp+E0h] [xbp-C0h]
  __int64 v188; // [xsp+E8h] [xbp-B8h]
  void **v189; // [xsp+F0h] [xbp-B0h]
  __int64 v190; // [xsp+F8h] [xbp-A8h]
  __int64 (__fastcall *v191)(); // [xsp+100h] [xbp-A0h]
  void *v192; // [xsp+108h] [xbp-98h]
  void *v193; // [xsp+110h] [xbp-90h]
  __int64 v194; // [xsp+118h] [xbp-88h]
  const __CFString *v195; // [xsp+120h] [xbp-80h]
  __int64 v196; // [xsp+128h] [xbp-78h]
  __int64 v197; // [xsp+130h] [xbp-70h]

  v4 = a4;
  v170 = self;
  v5 = objc_retain(a3, a2);
  v7 = objc_retain(v4, v6);
  v8 = +[CUtility genCurrentTimeInMsFrom1970](&OBJC_CLASS___CUtility, "genCurrentTimeInMsFrom1970");
  +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
    &OBJC_CLASS___iConsole,
    "logWithLevel:module:errorCode:file:line:func:format:",
    2LL,
    "|WCPay|LaunchPin|",
    0LL,
    "MicroMessengerAppDelegate.mm",
    1802LL,
    "-[MicroMessengerAppDelegate handleOpenURL:bundleID:]",
    CFSTR("before handle openUrl:%llu"),
    v8);
  +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
    &OBJC_CLASS___iConsole,
    "logWithLevel:module:errorCode:file:line:func:format:",
    2LL,
    "|WCPay|LaunchPin|",
    0LL,
    "MicroMessengerAppDelegate.mm",
    1803LL,
    "-[MicroMessengerAppDelegate handleOpenURL:bundleID:]",
    CFSTR("url[%@]"),
    v5);
  v189 = _NSConcreteStackBlock;
  v190 = 3254779904LL;
  v191 = sub_100D012C0;
  v192 = &unk_106C6B920;
  v10 = (void *)objc_retain(v5, v9);
  v193 = v10;
  v12 = objc_retain(v7, v11);
  v194 = v12;
  sub_10001D7C4(&OBJC_PROTOCOL___MMKernelExt, "onHandleOpenURL:bundleID:", &v189);
  v13 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
  v14 = (void *)objc_retainAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(&OBJC_CLASS___AppDataMgr, "class");
  v16 = objc_msgSend(v14, "getService:", v15);
  v17 = (void *)objc_retainAutoreleasedReturnValue(v16);
  v18 = (unsigned __int64)objc_msgSend(v17, "isAppDataChecked");
  if ( !(v18 & 1) )
  {
    v19 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
    v20 = (void *)objc_retainAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(&OBJC_CLASS___AppDataMgr, "class");
    v22 = objc_msgSend(v20, "getService:", v21);
    v23 = (void *)objc_retainAutoreleasedReturnValue(v22);
    objc_msgSend(v23, "checkAndUpdateAppData");
  }
  v24 = objc_msgSend(v10, "absoluteString");
  v25 = (void *)objc_retainAutoreleasedReturnValue(v24);
  v27 = 0;
  if ( !objc_msgSend(v25, "rangeOfString:options:", CFSTR("weixin://"), 1LL) && v26 )
  {
    v28 = objc_msgSend(v25, "length");
    if ( v28 <= objc_msgSend(CFSTR("weixin://"), "length") )
    {
      v27 = 0;
      goto LABEL_46;
    }
    v29 = objc_msgSend(CFSTR("weixin://"), "length");
    v30 = objc_msgSend(v25, "substringFromIndex:", v29);
    v31 = (void *)objc_retainAutoreleasedReturnValue(v30);
    v32 = v31;
    v33 = objc_msgSend(v31, "componentsSeparatedByString:", CFSTR("/"));
    v34 = (void *)objc_retainAutoreleasedReturnValue(v33);
    if ( !v34 )
    {
      v27 = 0;
LABEL_45:
      goto LABEL_46;
    }
    v169 = v34;
    if ( objc_msgSend(v34, "count") )
    {
      v167 = v32;
      v168 = (__int64)v10;
      v166 = v12;
      v35 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
      v36 = (void *)objc_retainAutoreleasedReturnValue(v35);
      v37 = objc_msgSend(&OBJC_CLASS___KindaBizMgr, "class");
      v38 = objc_msgSend(v36, "getService:", v37);
      v39 = (void *)objc_retainAutoreleasedReturnValue(v38);
      v40 = (unsigned __int64)objc_msgSend(v39, "canHandleOpenUrl");
      if ( v40 )
      {
        v41 = objc_msgSend(v169, "firstObject");
        v42 = (void *)objc_retainAutoreleasedReturnValue(v41);
        v43 = objc_msgSend(v169, "count");
        +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
          &OBJC_CLASS___iConsole,
          "logWithLevel:module:errorCode:file:line:func:format:",
          2LL,
          0LL,
          0LL,
          "MicroMessengerAppDelegate.mm",
          1837LL,
          "-[MicroMessengerAppDelegate handleOpenURL:bundleID:]",
          CFSTR("nsCommand=%@, aryString.count=%lu"),
          v42,
          v43);
        v165 = v42;
        if ( !objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("jumpurl"))
          && (unsigned __int64)objc_msgSend(v169, "count") >= 2 )
        {
          v44 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
          v45 = (void *)objc_retainAutoreleasedReturnValue(v44);
          v46 = objc_msgSend(v45, "length");
          if ( v46 )
          {
            v47 = objc_msgSend(&OBJC_CLASS___URLSourceInfo, "alloc");
            v48 = objc_msgSend(v47, "init");
            v49 = (char *)objc_msgSend(v42, "length");
            v50 = objc_msgSend(v167, "substringFromIndex:", v49 + 1);
            v51 = objc_retainAutoreleasedReturnValue(v50);
            -[URLSourceInfo setM_url:](v48, "setM_url:", v51);
            v12 = v166;
            -[URLSourceInfo setM_bundleId:](v48, "setM_bundleId:", v166);
            v52 = +[CAppViewControllerManager getAppViewControllerManager](
                    &OBJC_CLASS___CAppViewControllerManager,
                    "getAppViewControllerManager");
            v53 = (void *)objc_retainAutoreleasedReturnValue(v52);
            objc_msgSend(v53, "jumpToURLShardBy3rdApp:", v48);
            v54 = v53;
            v32 = v167;
            v27 = 1;
            v10 = (void *)v168;
LABEL_43:
            objc_release(v165);
            goto LABEL_44;
          }
          v27 = 0;
          goto LABEL_49;
        }
        if ( !objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("app"))
          && (unsigned __int64)objc_msgSend(v169, "count") >= 2 )
        {
          v55 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
          v56 = objc_retainAutoreleasedReturnValue(v55);
          v57 = objc_msgSend(v169, "safeObjectAtIndex:", 2LL);
          v58 = objc_retainAutoreleasedReturnValue(v57);
          v187 = v25;
          v188 = v168;
          -[MicroMessengerAppDelegate process3rdAppSupportContentFlagFromOpenUrl:andUrlStr:appID:](
            v170,
            "process3rdAppSupportContentFlagFromOpenUrl:andUrlStr:appID:",
            &v188,
            &v187,
            v56);
          v60 = objc_retain(v188, v59);
          v62 = objc_retain(v187, v61);
          v12 = v166;
          v63 = +[OpenApiHandler createOpenParamWithUrl:apiName:appID:bundleID:isLaunchByUniversalLink:](
                  &OBJC_CLASS___OpenApiHandler,
                  "createOpenParamWithUrl:apiName:appID:bundleID:isLaunchByUniversalLink:",
                  v60,
                  v58,
                  v56,
                  v166,
                  0LL);
          v64 = objc_retainAutoreleasedReturnValue(v63);
          v27 = (unsigned __int64)+[OpenApiHandler handleOpenApiUrlWithOpenParam:](
                                    &OBJC_CLASS___OpenApiHandler,
                                    "handleOpenApiUrlWithOpenParam:",
                                    v64);
          v25 = (void *)v62;
          v10 = (void *)v60;
LABEL_20:
          v32 = v167;
          goto LABEL_43;
        }
        v10 = (void *)v168;
        if ( !objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("sign-in-twitter.wechatapp"))
          && (unsigned __int64)objc_msgSend(v169, "count") >= 2 )
        {
          v65 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
          v66 = (void *)objc_retainAutoreleasedReturnValue(v65);
          v67 = v66;
          v68 = objc_msgSend(v66, "componentsSeparatedByString:", CFSTR("?"));
          v69 = (void *)objc_retainAutoreleasedReturnValue(v68);
          if ( objc_msgSend(v69, "count") == (void *)2 )
          {
            v70 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v71 = (void *)objc_retainAutoreleasedReturnValue(v70);
            v72 = objc_msgSend(&OBJC_CLASS___MMTwitterMgr, "class");
            v73 = objc_msgSend(v71, "getService:", v72);
            v74 = (void *)objc_retainAutoreleasedReturnValue(v73);
            v75 = objc_msgSend(v69, "safeObjectAtIndex:", 1LL);
            v76 = objc_retainAutoreleasedReturnValue(v75);
            objc_msgSend(v74, "didTwitterLogin:", v76);
            v77 = v74;
            v10 = (void *)v168;
          }
          v27 = 0;
          goto LABEL_42;
        }
        if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("verifysms"))
          || (unsigned __int64)objc_msgSend(v169, "count") < 3 )
        {
          if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("verifyemail"))
            || (unsigned __int64)objc_msgSend(v169, "count") < 3 )
          {
            if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("scanqrcode")) )
            {
              if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("cardpackage")) )
              {
                if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("dl")) )
                {
                  v32 = v167;
                  if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("connectToFreeWifi")) )
                  {
                    if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("wap")) )
                    {
                      if ( objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("shareExt")) )
                      {
                        v27 = 0;
                      }
                      else
                      {
                        v27 = 1;
                        v139 = objc_msgSend(v169, "objectAtIndex:", 1LL);
                        v140 = (void *)objc_retainAutoreleasedReturnValue(v139);
                        v141 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                        v142 = (void *)objc_retainAutoreleasedReturnValue(v141);
                        v143 = objc_msgSend(&OBJC_CLASS___MMShareExtMgr, "class");
                        v144 = objc_msgSend(v142, "getService:", v143);
                        v145 = (void *)objc_retainAutoreleasedReturnValue(v144);
                        v146 = objc_msgSend(v140, "uint64Value");
                        objc_msgSend(v145, "shareMessageToFriend:", v146);
                        v147 = v142;
                        v10 = (void *)v168;
                        v148 = v140;
                        v32 = v167;
                      }
                      v12 = v166;
                    }
                    else
                    {
                      v12 = v166;
                      if ( (unsigned __int64)objc_msgSend(v169, "count") >= 2 )
                      {
                        v149 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
                        v150 = (void *)objc_retainAutoreleasedReturnValue(v149);
                        if ( (unsigned int)objc_msgSend(v150, "hasPrefix:", CFSTR("pay?")) )
                        {
                          v151 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                          v152 = (void *)objc_retainAutoreleasedReturnValue(v151);
                          v153 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
                          v154 = objc_msgSend(v152, "getService:", v153);
                          v155 = (void *)objc_retainAutoreleasedReturnValue(v154);
                          v156 = objc_msgSend(CFSTR("pay?"), "length");
                          v157 = objc_msgSend(v150, "substringFromIndex:", v156);
                          v158 = objc_retainAutoreleasedReturnValue(v157);
                          objc_msgSend(v155, "doWCPayWapWithPayInfo:bundleID:", v158, v166);
                          v159 = v155;
                          v10 = (void *)v168;
                          v160 = v152;
                          v32 = v167;
                          v27 = 1;
                        }
                        else
                        {
                          v27 = 0;
                        }
                      }
                      else
                      {
                        v27 = 0;
                      }
                    }
                    goto LABEL_43;
                  }
                  v119 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                  v120 = (void *)objc_retainAutoreleasedReturnValue(v119);
                  v121 = objc_msgSend(&OBJC_CLASS___PublicWifiManager, "class");
                  v122 = objc_msgSend(v120, "getService:", v121);
                  v123 = (void *)objc_retainAutoreleasedReturnValue(v122);
                  objc_msgSend(v123, "handle3rdAppWithUrl:", v168);
                  if ( (unsigned __int64)objc_msgSend(v169, "count") < 2 )
                  {
                    v27 = 1;
LABEL_49:
                    v12 = v166;
LABEL_71:
                    v32 = v167;
                    v10 = (void *)v168;
                    goto LABEL_43;
                  }
                  v124 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
                  v125 = (void *)objc_retainAutoreleasedReturnValue(v124);
                  v12 = v166;
                  if ( (unsigned int)objc_msgSend(v125, "hasPrefix:", CFSTR("friendWifi?")) )
                  {
                    v126 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                    v127 = (void *)objc_retainAutoreleasedReturnValue(v126);
                    v128 = objc_msgSend(&OBJC_CLASS___WCDeviceFriendWifiMgr, "class");
                    v129 = objc_msgSend(v127, "getService:", v128);
                    v130 = (void *)objc_retainAutoreleasedReturnValue(v129);
                    objc_msgSend(v130, "handle3rdAppUrl:", v168);
                  }
                  v118 = (__int64)v125;
                }
                else
                {
                  v12 = v166;
                  if ( !(unsigned int)+[CAppViewControllerManager hasEnterWechatMain](
                                        &OBJC_CLASS___CAppViewControllerManager,
                                        "hasEnterWechatMain") )
                  {
                    v27 = 0;
                    goto LABEL_20;
                  }
                  v100 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                  v101 = (void *)objc_retainAutoreleasedReturnValue(v100);
                  v102 = objc_msgSend(&OBJC_CLASS___WCBusinessJumpMgr, "class");
                  v103 = objc_msgSend(v101, "getService:", v102);
                  v104 = (void *)objc_retainAutoreleasedReturnValue(v103);
                  v105 = (unsigned __int64)objc_msgSend(v104, "isBusinessJump:", v25);
                  if ( !v105 )
                  {
                    if ( (unsigned int)+[WCDeepLinkHandler isDeepLink:](
                                         &OBJC_CLASS___WCDeepLinkHandler,
                                         "isDeepLink:",
                                         v25) )
                    {
                      v131 = +[CAppViewControllerManager getAppViewControllerManager](
                               &OBJC_CLASS___CAppViewControllerManager,
                               "getAppViewControllerManager");
                      v132 = (void *)objc_retainAutoreleasedReturnValue(v131);
                      objc_msgSend(v132, "moveToRootViewController");
                      v133 = objc_msgSend(&OBJC_CLASS___MMURLHandler, "alloc");
                      v134 = -[MMURLHandler init](v133, "init");
                      v27 = 1;
                      -[MMURLHandler setM_isDisableShare:](v134, "setM_isDisableShare:", 1LL);
                      -[MMURLHandler setM_viewController:](v134, "setM_viewController:", 0LL);
                      -[MMURLHandler setM_urlPermittedSet:](v134, "setM_urlPermittedSet:", 255LL);
                      v195 = CFSTR("GetA8KeyScene");
                      v135 = objc_msgSend(&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 23LL);
                      v136 = objc_retainAutoreleasedReturnValue(v135);
                      v196 = v136;
                      v137 = objc_msgSend(
                               &OBJC_CLASS___NSDictionary,
                               "dictionaryWithObjects:forKeys:count:",
                               &v196,
                               &v195,
                               1LL);
                      v138 = objc_retainAutoreleasedReturnValue(v137);
                      -[MMURLHandler handleURL:withExtraInfo:](v134, "handleURL:withExtraInfo:", v25, v138);
                    }
                    else
                    {
                      v27 = 0;
                    }
                    goto LABEL_71;
                  }
                  v106 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                  v107 = (void *)objc_retainAutoreleasedReturnValue(v106);
                  v108 = objc_msgSend(&OBJC_CLASS___WCPayControlMgr, "class");
                  v109 = objc_msgSend(v107, "getService:", v108);
                  v110 = (void *)objc_retainAutoreleasedReturnValue(v109);
                  v111 = (unsigned __int64)objc_msgSend(v110, "cancelAllLogicByOpenApi");
                  v112 = (unsigned __int64)-[MicroMessengerAppDelegate dismissCurrentWAAPP](v170, "dismissCurrentWAAPP");
                  if ( v111 & 1 || v112 )
                  {
                    v161 = dispatch_time(0LL, 660000000LL);
                    v171 = _NSConcreteStackBlock;
                    v172 = 3254779904LL;
                    v173 = sub_101BC7830;
                    v174 = &unk_106B1FD20;
                    v163 = objc_retain(v25, v162);
                    v25 = (void *)v163;
                    v175 = v163;
                    v176 = objc_retain(v166, v164);
                    dispatch_after(v161, &_dispatch_main_q, &v171);
                    v118 = v175;
                  }
                  else
                  {
                    v113 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
                    v114 = (void *)objc_retainAutoreleasedReturnValue(v113);
                    v115 = objc_msgSend(&OBJC_CLASS___WCBusinessJumpMgr, "class");
                    v116 = objc_msgSend(v114, "getService:", v115);
                    v117 = (void *)objc_retainAutoreleasedReturnValue(v116);
                    objc_msgSend(v117, "handleJumpFromOuter:bundleId:parentViewController:", v25, v166, 0LL);
                    v118 = (__int64)v114;
                  }
                }
                v27 = 1;
                goto LABEL_71;
              }
              v93 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v94 = (void *)objc_retainAutoreleasedReturnValue(v93);
              v95 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v96 = objc_msgSend(v94, "getService:", v95);
              v97 = (void *)objc_retainAutoreleasedReturnValue(v96);
              objc_msgSend(v97, "doSMSAddCardApi:", v168);
              v98 = v97;
              v10 = (void *)v168;
              v27 = 1;
LABEL_42:
              v12 = v166;
              v32 = v167;
              goto LABEL_43;
            }
            v91 = +[CAppViewControllerManager getAppViewControllerManager](
                    &OBJC_CLASS___CAppViewControllerManager,
                    "getAppViewControllerManager");
            v92 = (void *)objc_retainAutoreleasedReturnValue(v91);
            v27 = 1;
            objc_msgSend(v92, "jumpToCameraScan:", 1LL);
            v84 = (__int64)v92;
          }
          else
          {
            v27 = 1;
            v85 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
            v86 = objc_retainAutoreleasedReturnValue(v85);
            +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
              &OBJC_CLASS___iConsole,
              "logWithLevel:module:errorCode:file:line:func:format:",
              1LL,
              0LL,
              0LL,
              "MicroMessengerAppDelegate.mm",
              1882LL,
              "-[MicroMessengerAppDelegate handleOpenURL:bundleID:]",
              CFSTR("%@"),
              v86);
            v87 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
            v88 = objc_retainAutoreleasedReturnValue(v87);
            v177 = _NSConcreteStackBlock;
            v178 = 3254779904LL;
            v179 = sub_10343ED0C;
            v180 = &unk_106C690B0;
            v181 = objc_retain(v169, v89);
            sub_100054554(&OBJC_PROTOCOL___IAutoVerifySMSExt, v88, "OnHandleOpenAutoVerifySMS:", &v177);
            v90 = v88;
            v10 = (void *)v168;
            v84 = v181;
          }
        }
        else
        {
          v27 = 1;
          v78 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
          v79 = objc_retainAutoreleasedReturnValue(v78);
          +[iConsole logWithLevel:module:errorCode:file:line:func:format:](
            &OBJC_CLASS___iConsole,
            "logWithLevel:module:errorCode:file:line:func:format:",
            1LL,
            0LL,
            0LL,
            "MicroMessengerAppDelegate.mm",
            1876LL,
            "-[MicroMessengerAppDelegate handleOpenURL:bundleID:]",
            CFSTR("%@"),
            v79);
          v80 = objc_msgSend(v169, "safeObjectAtIndex:", 1LL);
          v81 = objc_retainAutoreleasedReturnValue(v80);
          v182 = _NSConcreteStackBlock;
          v183 = 3254779904LL;
          v184 = sub_10343EC94;
          v185 = &unk_106C690B0;
          v186 = objc_retain(v169, v82);
          sub_100054554(&OBJC_PROTOCOL___IAutoVerifySMSExt, v81, "OnHandleOpenAutoVerifySMS:", &v182);
          v83 = v81;
          v10 = (void *)v168;
          v84 = v186;
        }
        goto LABEL_42;
      }
      v27 = 0;
      v12 = v166;
      v32 = v167;
      v10 = (void *)v168;
    }
    else
    {
      v27 = 0;
    }
LABEL_44:
    v34 = v169;
    goto LABEL_45;
  }
LABEL_46:
  result = objc_release(v10);
  if ( __stack_chk_guard == v197 )
    result = v27;
  return result;
}