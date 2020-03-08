

void __cdecl -[WareInfoViewController changeWare:](WareInfoViewController *self, SEL a2, id a3)
{
  WareInfoViewController *v3; // x19
  void *v4; // x0
  void *v5; // x0
  void *v6; // x21
  void *v7; // x0
  __int64 v8; // x20
  NewProductModel *v9; // x0
  void *v10; // x0
  void *v11; // x23
  void *v12; // x0
  void *v13; // x24
  NewProductModel *v14; // x0
  void *v15; // x0
  void *v16; // x23
  void *v17; // x0
  __int64 v18; // x24
  NewProductModel *v19; // x0
  void *v20; // x0
  void *v21; // x24
  void *v22; // x0
  void *v23; // x25
  NewProductModel *v24; // x0
  void *v25; // x0
  void *v26; // x24
  void *v27; // x0
  void *v28; // x25
  NewProductModel *v29; // x0
  void *v30; // x0
  void *v31; // x24
  void *v32; // x0
  void *v33; // x22
  NewProductModel *v34; // x0
  void *v35; // x0
  void *v36; // x22
  void *v37; // x0
  void *v38; // x24
  NewProductModel *v39; // x0
  void *v40; // x21

  v3 = self;
  v4 = objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_retainAutoreleasedReturnValue(v4);
  v6 = v5;
  v7 = objc_msgSend(v5, "objectForKey:", CFSTR("wareId"));
  v8 = objc_retainAutoreleasedReturnValue(v7);
  objc_release(v6);
  v9 = -[WareInfoViewController wareModel](v3, "wareModel");
  v10 = (void *)objc_retainAutoreleasedReturnValue(v9);
  v11 = v10;
  v12 = objc_msgSend(v10, "wareInfoParamModel");
  v13 = (void *)objc_retainAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "setPersonas:", CFSTR("personas"));
  objc_release(v13);
  objc_release(v11);
  if ( (unsigned int)off_104B953D0(v8) )
  {
    v14 = -[WareInfoViewController wareModel](v3, "wareModel");
    v15 = (void *)objc_retainAutoreleasedReturnValue(v14);
    v16 = v15;
    v17 = objc_msgSend(v15, "productCode");
    v18 = objc_retainAutoreleasedReturnValue(v17);
    objc_release(v18);
    objc_release(v16);
    if ( v18 != v8 )
    {
      v19 = -[WareInfoViewController wareModel](v3, "wareModel");
      v20 = (void *)objc_retainAutoreleasedReturnValue(v19);
      v21 = v20;
      v22 = objc_msgSend(v20, "wareInfoParamModel");
      v23 = (void *)objc_retainAutoreleasedReturnValue(v22);
      objc_msgSend(v23, "setExtFlag:", 0LL);
      objc_release(v23);
      objc_release(v21);
      v24 = -[WareInfoViewController wareModel](v3, "wareModel");
      v25 = (void *)objc_retainAutoreleasedReturnValue(v24);
      v26 = v25;
      v27 = objc_msgSend(v25, "wareInfoParamModel");
      v28 = (void *)objc_retainAutoreleasedReturnValue(v27);
      objc_msgSend(v28, "setLocShopChannel:", 0LL);
      objc_release(v28);
      objc_release(v26);
      v29 = -[WareInfoViewController wareModel](v3, "wareModel");
      v30 = (void *)objc_retainAutoreleasedReturnValue(v29);
      v31 = v30;
      v32 = objc_msgSend(v30, "wareInfoParamModel");
      v33 = (void *)objc_retainAutoreleasedReturnValue(v32);
      objc_msgSend(v33, "setLocShopInfoID:", 0LL);
      objc_release(v33);
      objc_release(v31);
      v34 = -[WareInfoViewController wareModel](v3, "wareModel");
      v35 = (void *)objc_retainAutoreleasedReturnValue(v34);
      v36 = v35;
      v37 = objc_msgSend(v35, "productModel");
      v38 = (void *)objc_retainAutoreleasedReturnValue(v37);
      objc_msgSend(v38, "setExtFlag:", 0LL);
      objc_release(v38);
      objc_release(v36);
    }
    v39 = -[WareInfoViewController wareModel](v3, "wareModel");
    v40 = (void *)objc_retainAutoreleasedReturnValue(v39);
    objc_msgSend(v40, "setProductCode:", v8);
    objc_release(v40);
    -[WareInfoViewController animationHiddenCommentDetailListController:](
      v3,
      "animationHiddenCommentDetailListController:",
      0LL);
    -[WareInfoViewController getMainProuductInfo](v3, "getMainProuductInfo");
  }
  objc_release(v8);
}