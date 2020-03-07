bool __cdecl +[OpenApiHandler handleOpenApiUrlWithOpenParam:](OpenApiHandler_meta *self, SEL a2, id a3)
{
  OpenApiHandler_meta *v3; // x23
  void *openApiParameter; // x19
  void *v5; // x0
  void *v6; // x20
  void *v7; // x0
  __int64 v8; // x21
  struct objc_object *v9; // x0
  void *v10; // x25
  void *v11; // x0
  void *v12; // x0
  void *v13; // x0
  void *v14; // x26
  const char *v15; // x1
  signed __int64 v16; // x26
  void *v17; // x0
  void *v18; // x25
  struct objc_object *v19; // x0
  void *v20; // x26
  void *v21; // x0
  void *v22; // x0
  void *v23; // x0
  void *v24; // x27
  const char *v25; // x1
  void *v26; // x0
  struct objc_object *v27; // x0
  void *v28; // x0
  void *v29; // x0
  struct objc_object *v30; // x0
  void *v31; // x0
  void *v32; // x0
  void *v33; // x0
  const char *v34; // x1
  struct objc_object *v35; // x0
  void *v36; // x0
  void *v37; // x0
  bool v38; // w25
  struct objc_object *v39; // x0
  void *openApiParameter0; // x0
  void *openApiParameter1; // x0
  struct objc_object *openApiParameter2; // x0
  void *openApiParameter3; // x0
  void *openApiParameter4; // x0
  struct objc_object *openApiParameter5; // x0
  void *openApiParameter6; // x0
  void *openApiParameter7; // x0
  struct objc_object *openApiParameter8; // x0
  void *openApiParameter9; // x0
  void *v50; // x0
  struct objc_object *v51; // x0
  void *v52; // x0
  void *v53; // x0
  struct objc_object *v54; // x0
  void *v55; // x0
  void *v56; // x0
  struct objc_object *v57; // x0
  void *v58; // x0
  void *v59; // x0
  struct objc_object *v60; // x0
  void *v61; // x22
  void *v62; // x0
  void *v63; // x0
  void *v64; // x23
  struct objc_object *v66; // x0
  void *v67; // x25
  void *v68; // x0
  void *v69; // x0
  void *v70; // x26
  char v71; // w27
  struct objc_object *v72; // x0
  void *v73; // x25
  void *v74; // x0
  void *v75; // x0
  void *v76; // x0
  void *v77; // x27
  void *v78; // x0
  __int64 v79; // x28
  struct objc_object *v80; // x0
  void *v81; // x22
  void *v82; // x0
  void *v83; // x0
  void *v84; // x0
  void *v85; // x23
  void *v86; // x0
  __int64 v87; // x24
  struct objc_object *v88; // x0
  struct objc_object *v89; // x0
  void *v90; // x0
  void *v91; // x0
  struct objc_object *v92; // x0
  void *v93; // x0
  void *v94; // x0
  struct objc_object *v95; // x0
  void *v96; // x0
  void *v97; // x0
  struct objc_object *v98; // x0
  void *v99; // x0
  void *v100; // x0
  struct objc_object *v101; // x0
  void *v102; // x0
  void *v103; // x0
  struct objc_object *v104; // x0
  void *v105; // x0
  void *v106; // x0
  struct objc_object *v107; // x0
  void *v108; // x0
  void *v109; // x0
  struct objc_object *v110; // x0
  void *v111; // x0
  void *v112; // x0
  struct objc_object *v113; // x0
  void *v114; // x25
  void *v115; // x0
  void *v116; // x0
  void *v117; // x26
  int v118; // w27
  struct objc_object *v119; // x0
  void *v120; // x0
  void *v121; // x0
  void *v122; // x0
  void *v123; // x0
  struct objc_object *v124; // x0
  void *v125; // x0
  void *v126; // x0
  void *v127; // x0
  void *v128; // x0
  struct objc_object *v129; // x0
  void *v130; // x0
  void *v131; // x0

  v3 = self;
  openApiParameter = (void *)objc_retain(a3, a2); //OpenApiParameter
  objc_msgSend(v3, "reportLaunchWXWithOpenParameter:", openApiParameter);
  v5 = objc_msgSend(openApiParameter, "apiName");
  apiName = (void *)objc_retainAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(openApiParameter, "appID");
  appID = objc_retainAutoreleasedReturnValue(v7);
  if ( !objc_msgSend(apiName, "length") )
  {
    v16 = 0LL;
LABEL_32:
    v38 = 1;
    goto LABEL_33;
  }
  if ( !objc_msgSend(apiName, "caseInsensitiveCompare:", CFSTR("pay")) )
  {
    objc_msgSend(v3, "reportWCPayLaunchWithOpenParameter:", openApiParameter);
    v17 = objc_msgSend(openApiParameter, "covertToWCPayOpenApiParamter");
    v18 = (void *)objc_retainAutoreleasedReturnValue(v17);
    v19 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
    v20 = (void *)objc_retainAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
    v22 = objc_msgSend(v20, "getService:", v21);
    v23 = (void *)objc_retainAutoreleasedReturnValue(v22);
    v24 = v23;
    v25 = "doWCPayOpenApi:";
LABEL_11:
    objc_msgSend(v23, v25, v18);
    goto LABEL_15;
  }
  if ( !objc_msgSend(apiName, "caseInsensitiveCompare:", CFSTR("jointpay")) )
  {
    objc_msgSend(v3, "reportWCPayLaunchWithOpenParameter:", openApiParameter);
    v26 = objc_msgSend(openApiParameter, "covertToWCPayOpenApiParamter");
    v18 = (void *)objc_retainAutoreleasedReturnValue(v26);
    v27 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
    v20 = (void *)objc_retainAutoreleasedReturnValue(v27);
    v28 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
    v29 = objc_msgSend(v20, "getService:", v28);
    v23 = (void *)objc_retainAutoreleasedReturnValue(v29);
    v24 = v23;
    v25 = "doWCPayJointPayOpenApi:";
    goto LABEL_11;
  }
  if ( objc_msgSend(apiName, "caseInsensitiveCompare:", CFSTR("hb")) )
  {
    if ( objc_msgSend(apiName, "caseInsensitiveCompare:", CFSTR("auth")) )
    {
      if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("cardpackage")) )
      {
        v9 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(v9);
        v11 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        v12 = objc_msgSend(v10, "getService:", v11);
        v13 = (void *)objc_retainAutoreleasedReturnValue(v12);
        v14 = v13;
        v15 = "doAppAddCard:";
      }
      else if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("choosecard")) )
      {
        v39 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(v39);
        openApiParameter0 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        openApiParameter1 = objc_msgSend(v10, "getService:", openApiParameter0);
        v13 = (void *)objc_retainAutoreleasedReturnValue(openApiParameter1);
        v14 = v13;
        v15 = "doChooseCard:";
      }
      else if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("chooseinvoice")) )
      {
        openApiParameter2 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(openApiParameter2);
        openApiParameter3 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        openApiParameter4 = objc_msgSend(v10, "getService:", openApiParameter3);
        v13 = (void *)objc_retainAutoreleasedReturnValue(openApiParameter4);
        v14 = v13;
        v15 = "doChooseInvoice:";
      }
      else if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("opentempsession")) )
      {
        openApiParameter5 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(openApiParameter5);
        openApiParameter6 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        openApiParameter7 = objc_msgSend(v10, "getService:", openApiParameter6);
        v13 = (void *)objc_retainAutoreleasedReturnValue(openApiParameter7);
        v14 = v13;
        v15 = "doOpenTempSessionWithAppId:";
      }
      else if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("openwebview")) )
      {
        openApiParameter8 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(openApiParameter8);
        openApiParameter9 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        v50 = objc_msgSend(v10, "getService:", openApiParameter9);
        v13 = (void *)objc_retainAutoreleasedReturnValue(v50);
        v14 = v13;
        v15 = "doOpenWebviewWithAppId:";
      }
      else if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("opentypewebview")) )
      {
        v51 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(v51);
        v52 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        v53 = objc_msgSend(v10, "getService:", v52);
        v13 = (void *)objc_retainAutoreleasedReturnValue(v53);
        v14 = v13;
        v15 = "doOpenTypeWebviewWithAppId:";
      }
      else if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("openbusinesswebview")) )
      {
        v54 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(v54);
        v55 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        v56 = objc_msgSend(v10, "getService:", v55);
        v13 = (void *)objc_retainAutoreleasedReturnValue(v56);
        v14 = v13;
        v15 = "doOpenBusinessWebviewWithAppId:";
      }
      else
      {
        if ( !(unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("jumpWxa")) )
        {
          if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("jumpFakeNativeWxa")) )
          {
            v66 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v67 = (void *)objc_retainAutoreleasedReturnValue(v66);
            v68 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
            v69 = objc_msgSend(v67, "getService:", v68);
            v70 = (void *)objc_retainAutoreleasedReturnValue(v69);
            v71 = (unsigned __int64)objc_msgSend(v70, "doOpenBusinessView:", openApiParameter);
            if ( v71 & 1 )
              goto LABEL_31;
            v72 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v73 = (void *)objc_retainAutoreleasedReturnValue(v72);
            v74 = objc_msgSend(&OBJC_CLASS___MMLanguageMgr, "class");
            v75 = objc_msgSend(v73, "getService:", v74);
            v76 = (void *)objc_retainAutoreleasedReturnValue(v75);
            v77 = v76;
            v78 = objc_msgSend(v76, "getStringForCurLanguage:", CFSTR("OpenApi_UnknownUrlRequestTitle"));
            v79 = objc_retainAutoreleasedReturnValue(v78);
            v80 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v81 = (void *)objc_retainAutoreleasedReturnValue(v80);
            v82 = objc_msgSend(&OBJC_CLASS___MMLanguageMgr, "class");
            v83 = objc_msgSend(v81, "getService:", v82);
            v84 = (void *)objc_retainAutoreleasedReturnValue(v83);
            v85 = v84;
            v86 = objc_msgSend(v84, "getStringForCurLanguage:", CFSTR("OpenApi_UnknownUrlRequestDesc"));
            v87 = objc_retainAutoreleasedReturnValue(v86);
            v88 = +[WCUIAlertView showAlertWithTitle:message:](
                    &OBJC_CLASS___WCUIAlertView,
                    "showAlertWithTitle:message:",
                    v79,
                    v87);
          }
          else
          {
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("handlescanresult")) )
            {
              v89 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v89);
              v90 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v91 = objc_msgSend(v10, "getService:", v90);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v91);
              v14 = v13;
              v15 = "doHandleScanResult:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("openranklist")) )
            {
              v92 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v92);
              v93 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v94 = objc_msgSend(v10, "getService:", v93);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v94);
              v14 = v13;
              v15 = "doOpenRankListWithAppId:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("createchatroom")) )
            {
              v95 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v95);
              v96 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v97 = objc_msgSend(v10, "getService:", v96);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v97);
              v14 = v13;
              v15 = "doCreateChatRoom:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("joinchatroom")) )
            {
              v98 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v98);
              v99 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v100 = objc_msgSend(v10, "getService:", v99);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v100);
              v14 = v13;
              v15 = "doJoinChatRoom:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("offlinepay")) )
            {
              v101 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v101);
              v102 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v103 = objc_msgSend(v10, "getService:", v102);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v103);
              v14 = v13;
              v15 = "doOpenWCPayOfflineView:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("openprofile")) )
            {
              v104 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v104);
              v105 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v106 = objc_msgSend(v10, "getService:", v105);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v106);
              v14 = v13;
              v15 = "doOpenProfileApi:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("jumptobizwebview")) )
            {
              v107 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v107);
              v108 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v109 = objc_msgSend(v10, "getService:", v108);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v109);
              v14 = v13;
              v15 = "doJumpToBizWebview:";
              goto LABEL_30;
            }
            if ( (unsigned int)objc_msgSend(apiName, "isEqualToString:", CFSTR("refreshTokenFail")) )
            {
              v110 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v110);
              v111 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v112 = objc_msgSend(v10, "getService:", v111);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v112);
              v14 = v13;
              v15 = "doOpenRefreshTokenFailResp:";
              goto LABEL_30;
            }
            if ( !objc_msgSend(apiName, "caseInsensitiveCompare:", CFSTR("sendreq"))
              || !objc_msgSend(apiName, "caseInsensitiveCompare:", CFSTR("sendresp")) )
            {
              v129 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
              v10 = (void *)objc_retainAutoreleasedReturnValue(v129);
              v130 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
              v131 = objc_msgSend(v10, "getService:", v130);
              v13 = (void *)objc_retainAutoreleasedReturnValue(v131);
              v14 = v13;
              v15 = "doShareApiWithApiData:";
              goto LABEL_30;
            }
            v113 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v114 = (void *)objc_retainAutoreleasedReturnValue(v113);
            v115 = objc_msgSend(&OBJC_CLASS___AppDataMgr, "class");
            v116 = objc_msgSend(v114, "getService:", v115);
            v117 = (void *)objc_retainAutoreleasedReturnValue(v116);
            v118 = (unsigned __int64)objc_msgSend(v117, "isNeedDetectRequetURL:", appID);
            if ( !v118 )
            {
              v38 = 0;
              v16 = 0LL;
              goto LABEL_33;
            }
            v119 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v73 = (void *)objc_retainAutoreleasedReturnValue(v119);
            v120 = objc_msgSend(&OBJC_CLASS___MMLanguageMgr, "class");
            v121 = objc_msgSend(v73, "getService:", v120);
            v122 = (void *)objc_retainAutoreleasedReturnValue(v121);
            v77 = v122;
            v123 = objc_msgSend(v122, "getStringForCurLanguage:", CFSTR("OpenApi_UnknownUrlRequestTitle"));
            v79 = objc_retainAutoreleasedReturnValue(v123);
            v124 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
            v81 = (void *)objc_retainAutoreleasedReturnValue(v124);
            v125 = objc_msgSend(&OBJC_CLASS___MMLanguageMgr, "class");
            v126 = objc_msgSend(v81, "getService:", v125);
            v127 = (void *)objc_retainAutoreleasedReturnValue(v126);
            v85 = v127;
            v128 = objc_msgSend(v127, "getStringForCurLanguage:", CFSTR("OpenApi_UnknownUrlRequestDesc"));
            v87 = objc_retainAutoreleasedReturnValue(v128);
            v88 = +[WCUIAlertView showAlertWithTitle:message:](
                    &OBJC_CLASS___WCUIAlertView,
                    "showAlertWithTitle:message:",
                    v79,
                    v87);
          }
          objc_unsafeClaimAutoreleasedReturnValue(v88);
          v38 = 0;
          goto LABEL_34;
        }
        v57 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
        v10 = (void *)objc_retainAutoreleasedReturnValue(v57);
        v58 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
        v59 = objc_msgSend(v10, "getService:", v58);
        v13 = (void *)objc_retainAutoreleasedReturnValue(v59);
        v14 = v13;
        v15 = "doOpenMiniProgram:";
      }
LABEL_30:
      objc_msgSend(v13, v15, openApiParameter);
LABEL_31:
      v16 = 0LL;
      goto LABEL_32;
    }
    objc_msgSend(v3, "reportAuthLaunchWithOpenParameter:", openApiParameter);
    v35 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
    v18 = (void *)objc_retainAutoreleasedReturnValue(v35);
    v36 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
    v37 = objc_msgSend(v18, "getService:", v36);
    v33 = (void *)objc_retainAutoreleasedReturnValue(v37);
    v20 = v33;
    v34 = "doOAuthOpenApi:";
  }
  else
  {
    v30 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
    v18 = (void *)objc_retainAutoreleasedReturnValue(v30);
    v31 = objc_msgSend(&OBJC_CLASS___OpenApiMgr, "class");
    v32 = objc_msgSend(v18, "getService:", v31);
    v33 = (void *)objc_retainAutoreleasedReturnValue(v32);
    v20 = v33;
    v34 = "doWCHBOpenApi:";
  }
  objc_msgSend(v33, v34, openApiParameter);
LABEL_15:
  v38 = 1;
  v16 = 1LL;
LABEL_33:
  v60 = +[MMServiceCenter defaultCenter](&OBJC_CLASS___MMServiceCenter, "defaultCenter");
  v61 = (void *)objc_retainAutoreleasedReturnValue(v60);
  v62 = objc_msgSend(&OBJC_CLASS___AppDataMgr, "class");
  v63 = objc_msgSend(v61, "getService:", v62);
  v64 = (void *)objc_retainAutoreleasedReturnValue(v63);
  objc_msgSend(v64, "checkAndUpdateAppDataForiOS7Plus:forceUpdate:", appID, v16);
LABEL_34:
  return v38;
}