void __cdecl -[PDBusinessManager tappedButtonWithViewTag:withButtonTag:](PDBusinessManager *self, SEL a2, signed __int64 a3, signed __int64 a4)
{
  unsigned __int64 v4; // x23
  signed __int64 v5; // x26
  PDBusinessManager *v6; // x27
  NewProductModel *v7; // x0
  void *v8; // x0
  void *v9; // x21
  void *v10; // x0
  void *v11; // x0
  void *v12; // x24
  void *v13; // x0
  struct objc_object *v14; // x19
  id v15; // x0
  void *v16; // x20
  struct objc_object *v17; // x0
  NewProductModel *v18; // x0
  void *v19; // x0
  void *v20; // x26
  void *v21; // x0
  void *v22; // x0
  PDBusinessManager *v23; // x24
  void *v24; // x27
  void *v25; // x0
  void *v26; // x28
  NewProductModel *v27; // x0
  void *v28; // x0
  void *v29; // x20
  void *v30; // x0
  void *v31; // x0
  void *v32; // x22
  void *v33; // x0
  void *v34; // x19
  char v35; // w21
  PDWareBusinessModel *v36; // x0
  void *v37; // x0
  void *v38; // x22
  void *v39; // x0
  void *v40; // x0
  void *v41; // x20
  void *v42; // x0
  void *v43; // x0
  void *v44; // x21
  void *v45; // x0
  struct objc_object *v46; // x0
  struct objc_object *v47; // x23
  id v48; // x0
  void *v49; // x19
  PDWareBusinessModel *v50; // x0
  void *v51; // x0
  void *v52; // x20
  void *v53; // x0
  void *v54; // x21
  NewProductModel *v55; // x0
  void *v56; // x0
  void *v57; // x26
  void *v58; // x0
  __int64 v59; // x27
  PDBusinessManager *v60; // x21
  NewProductModel *v61; // x0
  void *v62; // x0
  void *v63; // x19
  void *v64; // x0
  __int64 v65; // x20
  id v66; // x0
  __int64 v67; // x28
  PDWareBusinessModel *v68; // x0
  void *v69; // x0
  void *v70; // x19
  void *v71; // x0
  void *v72; // x0
  void *v73; // x20
  void *v74; // x0
  void *v75; // x22
  int v76; // w21
  PDMainViewControllerProtocol *v77; // x0
  __int64 v78; // x0
  struct objc_object *v79; // x22
  __int64 v80; // x25
  PDMainViewControllerProtocol *v81; // x0
  void *v82; // x19
  int v83; // w20
  PDMainViewControllerProtocol *v84; // x0
  void *v85; // x19
  void *v86; // x0
  void *v87; // x19
  void *v88; // x0
  __int64 v89; // x20
  PDMainViewControllerProtocol *v90; // x0
  __int64 v91; // x0
  __int64 v92; // x24
  PDMainViewControllerProtocol *v93; // x0
  void *v94; // x20
  int v95; // w22
  PDMainViewControllerProtocol *v96; // x0
  void *v97; // x0
  void *v98; // x20
  void *v99; // x0
  void *v100; // x19
  void *v101; // x0
  struct objc_object *v102; // [xsp+A8h] [xbp-1B8h]
  const __CFString *v103; // [xsp+1E8h] [xbp-78h]
  const __CFString *v104; // [xsp+1F0h] [xbp-70h]

  v4 = a4;
  v5 = a3;
  v6 = self;
  -[PDBusinessManager setCurrentViewTag:](self, "setCurrentViewTag:");
  if ( v5 == 1 )
  {
    v7 = ((NewProductModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "model");
    v8 = (void *)objc_retainAutoreleasedReturnValue(v7);
    v9 = v8;
    v10 = objc_msgSend(v8, "colorSizeViewModel");
    v11 = (void *)objc_retainAutoreleasedReturnValue(v10);
    v12 = v11;
    v13 = objc_msgSend(v11, "getColorSizeUnselectedErroMsg");
    v14 = (struct objc_object *)objc_retainAutoreleasedReturnValue(v13);
    objc_release(v12);
    objc_release(v9);
    if ( (unsigned int)off_104B953D0(v14) )
    {
      v15 = ((id (__cdecl *)(JDBaseToastView_meta *, SEL, signed __int64, double, id))objc_msgSend)(
              (JDBaseToastView_meta *)&OBJC_CLASS___JDBaseToastView,
              "toastViewInstantWithIconType:showTime:message:",
              1LL,
              2.0,
              v14);
      v16 = (void *)objc_retainAutoreleasedReturnValue(v15);
      objc_msgSend(v16, "show");
      objc_release(v16);
      v17 = v14;
LABEL_14:
      objc_release(v17);
      v67 = 0LL;
      goto LABEL_29;
    }
    v102 = v14;
    v18 = ((NewProductModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "model");
    v19 = (void *)objc_retainAutoreleasedReturnValue(v18);
    v20 = v19;
    v21 = objc_msgSend(v19, "wareBusinessModel");
    v22 = (void *)objc_retainAutoreleasedReturnValue(v21);
    v23 = v6;
    v24 = v22;
    v25 = objc_msgSend(v22, "containerData");
    v26 = (void *)objc_retainAutoreleasedReturnValue(v25);
    if ( (unsigned __int64)objc_msgSend(v26, "hasSelectJPS") & 1 )
    {
      v27 = ((NewProductModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v23, "model");
      v28 = (void *)objc_retainAutoreleasedReturnValue(v27);
      v29 = v28;
      v30 = objc_msgSend(v28, "wareBusinessModel");
      v31 = (void *)objc_retainAutoreleasedReturnValue(v30);
      v32 = v31;
      v33 = objc_msgSend(v31, "containerData");
      v34 = (void *)objc_retainAutoreleasedReturnValue(v33);
      v35 = (unsigned __int64)objc_msgSend(v34, "hasAgreeJPSAgreement");
      objc_release(v34);
      objc_release(v32);
      objc_release(v29);
      objc_release(v26);
      objc_release(v24);
      objc_release(v20);
      if ( !(v35 & 1) )
      {
        v36 = ((PDWareBusinessModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v23, "wareBusinessModel");
        v37 = (void *)objc_retainAutoreleasedReturnValue(v36);
        v38 = v37;
        v39 = objc_msgSend(v37, "containerData");
        v40 = (void *)objc_retainAutoreleasedReturnValue(v39);
        v41 = v40;
        v42 = objc_msgSend(v40, "jpsAgreement");
        v43 = (void *)objc_retainAutoreleasedReturnValue(v42);
        v44 = v43;
        v45 = objc_msgSend(v43, "agreementTip");
        v46 = (struct objc_object *)objc_retainAutoreleasedReturnValue(v45);
        v47 = v46;
        v48 = ((id (__cdecl *)(JDBaseToastView_meta *, SEL, signed __int64, double, id))objc_msgSend)(
                (JDBaseToastView_meta *)&OBJC_CLASS___JDBaseToastView,
                "toastViewInstantWithIconType:showTime:message:",
                2LL,
                2.0,
                v46);
        v49 = (void *)objc_retainAutoreleasedReturnValue(v48);
        objc_release(v47);
        objc_release(v44);
        objc_release(v41);
        objc_release(v38);
        objc_msgSend(v49, "show");
        v50 = ((PDWareBusinessModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v23, "wareBusinessModel");
        v51 = (void *)objc_retainAutoreleasedReturnValue(v50);
        v52 = v51;
        v53 = objc_msgSend(v51, "containerData");
        v54 = (void *)objc_retainAutoreleasedReturnValue(v53);
        objc_msgSend(v54, "setChangeBgColor:", 1LL);
        objc_release(v54);
        objc_release(v52);
LABEL_13:
        objc_release(v49);
        v17 = v102;
        goto LABEL_14;
      }
    }
    else
    {
      objc_release(v26);
      objc_release(v24);
      objc_release(v20);
    }
    v55 = ((NewProductModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v23, "model");
    v56 = (void *)objc_retainAutoreleasedReturnValue(v55);
    v57 = v56;
    v58 = objc_msgSend(v56, "deliveryInstallModel");
    v59 = objc_retainAutoreleasedReturnValue(v58);
    if ( v59 )
    {
      v60 = v23;
      v61 = ((NewProductModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v23, "model");
      v62 = (void *)objc_retainAutoreleasedReturnValue(v61);
      v63 = v62;
      v64 = objc_msgSend(v62, "selectedDeliveryInstallModel");
      v65 = objc_retainAutoreleasedReturnValue(v64);
      objc_release(v65);
      objc_release(v63);
      objc_release(v59);
      objc_release(v57);
      if ( !v65 && v4 <= 0x16 && (1LL << v4) & 0x408002 )
      {
        v66 = ((id (__cdecl *)(JDBaseToastView_meta *, SEL, signed __int64, signed __int64, double, id))objc_msgSend)(
                (JDBaseToastView_meta *)&OBJC_CLASS___JDBaseToastView,
                "toastViewInstantWithIconType:position:showTime:message:",
                2LL,
                0LL,
                1.0,
                (id)CFSTR("请选择送装服务"));
        v49 = (void *)objc_retainAutoreleasedReturnValue(v66);
        objc_msgSend(v49, "show");
        goto LABEL_13;
      }
    }
    else
    {
      v60 = v23;
      objc_release(0LL);
      objc_release(v57);
    }
    v6 = v60;
    v68 = ((PDWareBusinessModel *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v60, "wareBusinessModel");
    v69 = (void *)objc_retainAutoreleasedReturnValue(v68);
    v70 = v69;
    v71 = objc_msgSend(v69, "containerData");
    v72 = (void *)objc_retainAutoreleasedReturnValue(v71);
    v73 = v72;
    v74 = objc_msgSend(v72, "abTestInfo");
    v75 = (void *)objc_retainAutoreleasedReturnValue(v74);
    v76 = (unsigned __int64)objc_msgSend(v75, "recommendPopup");
    objc_release(v75);
    objc_release(v73);
    objc_release(v70);
    if ( v4 == 1 && v76 )
    {
      v77 = ((PDMainViewControllerProtocol *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "delegate");
      v78 = objc_retainAutoreleasedReturnValue(v77);
      v79 = v102;
      if ( v78 )
      {
        v80 = v78;
        v81 = ((PDMainViewControllerProtocol *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "delegate");
        v82 = (void *)objc_retainAutoreleasedReturnValue(v81);
        v83 = (unsigned __int64)objc_msgSend(v82, "respondsToSelector:", "showSkudetailLoadView");
        objc_release(v82);
        objc_release(v80);
        if ( v83 )
        {
          v84 = ((PDMainViewControllerProtocol *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "delegate");
          v85 = (void *)objc_retainAutoreleasedReturnValue(v84);
          objc_msgSend(v85, "showSkudetailLoadView");
          objc_release(v85);
        }
      }
    }
    else
    {
      v86 = objc_msgSend(&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      v87 = (void *)objc_retainAutoreleasedReturnValue(v86);
      v103 = CFSTR("type");
      v104 = CFSTR("skuDetailView");
      v88 = objc_msgSend(&OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1LL);
      v89 = objc_retainAutoreleasedReturnValue(v88);
      objc_msgSend(v87, "postNotificationName:object:userInfo:", CFSTR("closePopupView"), 0LL, v89);
      objc_release(v89);
      objc_release(v87);
      v79 = v102;
    }
    objc_release(v79);
  }
  v90 = ((PDMainViewControllerProtocol *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "delegate");
  v91 = objc_retainAutoreleasedReturnValue(v90);
  if ( v91
    && (v92 = v91,
        v93 = ((PDMainViewControllerProtocol *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "delegate"),
        v94 = (void *)objc_retainAutoreleasedReturnValue(v93),
        v95 = (unsigned __int64)objc_msgSend(v94, "respondsToSelector:", "getPageIndexMenuItemInfo"),
        objc_release(v94),
        objc_release(v92),
        v95) )
  {
    v96 = ((PDMainViewControllerProtocol *(__cdecl *)(PDBusinessManager *, SEL))objc_msgSend)(v6, "delegate");
    v97 = (void *)objc_retainAutoreleasedReturnValue(v96);
    v98 = v97;
    v99 = objc_msgSend(v97, "getPageIndexMenuItemInfo");
    v100 = (void *)objc_retainAutoreleasedReturnValue(v99);
    objc_release(v98);
    v101 = objc_msgSend(v100, "menuItemTitle");
    v67 = objc_retainAutoreleasedReturnValue(v101);
    objc_release(v100);
  }
  else
  {
    v67 = 0LL;
  }
  if ( v4 <= 0x24 )
    JUMPOUT(__CS__, (char *)&loc_10237281C + 4 * (unsigned __int16)aL[v4 + 2]);
LABEL_29:
  objc_release(v67);
}