void __cdecl -[PDBusinessManager clockTick](PDBusinessManager *self, SEL a2)
{
  PDBusinessManager *v2; // x19
  char *v3; // x0
  PDMainViewControllerProtocol *v4; // x0
  void *v5; // x23
  int v6; // w24
  PDMainViewControllerProtocol *v7; // x0
  void *v8; // x22
  NewProductModel *v9; // x0
  __int64 v10; // x23
  void *v11; // x0

  v2 = self;
  v3 = -[PDBusinessManager originSeconds](self, "originSeconds");
  -[PDBusinessManager setOriginSeconds:](v2, "setOriginSeconds:", v3 - 1);
  if ( (signed __int64)-[PDBusinessManager originSeconds](v2, "originSeconds") <= 0 )
    -[PDBusinessManager yuYueTimeEnd:](v2, "yuYueTimeEnd:", 1LL);
  v4 = -[PDBusinessManager delegate](v2, "delegate");
  v5 = (void *)objc_retainAutoreleasedReturnValue(v4);
  v6 = (unsigned __int64)objc_msgSend(v5, "respondsToSelector:", "updateYuyueTime:interval:");
  objc_release(v5);
  if ( v6 )
  {
    v7 = -[PDBusinessManager delegate](v2, "delegate");
    v8 = (void *)objc_retainAutoreleasedReturnValue(v7);
    v9 = -[PDBusinessManager model](v2, "model");
    v10 = objc_retainAutoreleasedReturnValue(v9);
    v11 = -[PDBusinessManager originSeconds](v2, "originSeconds");
    objc_msgSend(v8, "updateYuyueTime:interval:", v10, (double)(signed __int64)v11);
    objc_release(v10);
    objc_release(v8);
  }
}