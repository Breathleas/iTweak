# BraceletHistory

## -[BraceletHistoryViewController onGetUserHistoryPage:] 调用堆栈

```txt
-[BraceletHistoryViewController onGetUserHistoryPage:GetUserHistoryPageResponse]

Backtrace:
[*] ================================================xbacktrace==========================================
[*] 0   WeChat              mem:0x1015f4e38  file:0x100dc4e38  -[BraceletHistoryViewController initData]
[*] 1   WeChat              mem:0x100b310f4  file:0x1003010f4  -[WCCgiBlockHelper baseCgi:didGetResponse:]
[*] 2   WeChat              mem:0x101a1ac08  file:0x1011eac08  -[WCBaseCgi didGetResponse:]
[*] 3   WeChat              mem:0x101a1b25c  file:0x1011eb25c  -[WCBaseCgi MessageReturn:Event:]
[*] 4   WeChat              mem:0x10083c904  file:0x10000c904  -[CAppObserverCenter NotifyFromMainCtrl:Event:]
[*] 5   WeChat              mem:0x101b91028  file:0x101361028  -[CMainControll TimerCheckEvent]
[*] 6   WeChat              mem:0x1083fd0c4  file:0x107bcd0c4  -[MMNoRetainTimerTarget onNoRetainTimer:]
[*] 7   Foundation          mem:0x199e04944  file:0x180884944  __NSFireTimer
[*] 8   CoreFoundation      mem:0x1999981c0  file:0x1804181c0  __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__
[*] 9   CoreFoundation      mem:0x199997edc  file:0x180417edc  __CFRunLoopDoTimer
[*] 10  CoreFoundation      mem:0x1999975b8  file:0x1804175b8  __CFRunLoopDoTimers
[*] 11  CoreFoundation      mem:0x1999925c8  file:0x1804125c8  __CFRunLoopRun
[*] 12  CoreFoundation      mem:0x199991c34  file:0x180411c34  CFRunLoopRunSpecific
[*] 13  GraphicsServices    mem:0x1a3adb38c  file:0x18a55b38c  GSEventRunModal
[*] 14  UIKitCore           mem:0x19dac422c  file:0x18454422c  UIApplicationMain
[*] 15  WeChat              mem:0x100db2ccc  file:0x100582ccc  -[WloginUserInfo setSNickName:]
```

## +[WCCgiBlockHelper helperWithInitBlock:startBlock:successBlock:failBlock:]

### frida-trace

```text
1223 ms  +[WCCgiBlockHelper helperWithInitBlock:0x10bb43d60 startBlock:0x16d8b3b00 successBlock:0x16d8b3ad8 failBlock:0x10bb43dd0]
  1287 ms     | -[WCCgiBlockHelper setBaseCgi:0x280ae8d80]
  1288 ms     | -[WCCgiBlockHelper baseCgi]
  1288 ms     | -[WCCgiBlockHelper setSuccessBlock:0x16d8b3ad8]
  1288 ms     | -[WCCgiBlockHelper setFailBlock:0x10bb43dd0]
  1288 ms     | -[WCCgiBlockHelper baseCgi]
  1288 ms     | -[WCCgiBlockHelper baseCgi]
  1811 ms  -[WCCgiBlockHelper baseCgi:WCBaseCgi didGetResponse:GetUserHistoryPageResponse]
  1812 ms     | -[WCCgiBlockHelper successBlock]
  1812 ms     | -[WCCgiBlockHelper successBlock]


[iPhone::微信]-> var block = new ObjC.Block(ptr('0x10bb43d60'));
[iPhone::微信]-> block # Signature: WCBaseCgi * ^();
{
    "_options": {
        "exceptions": "propagate"
    },
    "_signature": {
        "argTypes": [
            {
                "size": 8,
                "type": "pointer"
            }
        ],
        "id": "\"pointer\"\"pointer\"",
        "retType": {
            "size": 8,
            "type": "pointer"
        }
    },
    "handle": "0x10bb43d60",
    "types": "@\"WCBaseCgi\"8@?0"
}


[iPhone::微信]-> var startBlock = new ObjC.Block(ptr('0x16d8b3b00'));
[iPhone::微信]-> startBlock
{
    "_options": {
        "exceptions": "propagate"
    },
    "_signature": null,
    "handle": "0x16d8b3b00"
}

[iPhone::微信]-> var successBlock = new ObjC.Block(ptr('0x16d8b3ad8'));
[iPhone::微信]-> successBlock // Signature: void ^(WCCgiBlockHelper *);
{
    "_options": {
        "exceptions": "propagate"
    },
    "_signature": null,
    "handle": "0x16d8b3ad8"
}

[iPhone::微信]-> var successBlock = new ObjC.Block(ptr('0x10bb43dd0'));
[iPhone::微信]-> successBlock //Signature: void ^(WCCgiBlockHelper *, WCBaseCgi *, GetUserHistoryPageResponse *);
{
    "_options": {
        "exceptions": "propagate"
    },
    "_signature": {
        "argTypes": [
            {
                "size": 8,
                "type": "pointer"
            },
            {
                "size": 8,
                "type": "pointer"
            },
            {
                "size": 8,
                "type": "pointer"
            },
            {
                "size": 8,
                "type": "pointer"
            },
            {
                "size": 8,
                "type": "pointer"
            }
        ],
        "id": "\"void\"\"pointer\"\"pointer\"\"pointer\"\"pointer\"\"pointer\"",
        "retType": {
            "size": 0,
            "type": "void"
        }
    },
    "handle": "0x10bb43dd0",
    "types": "v40@?0@\"WCCgiBlockHelper\"8@\"WCBaseCgi\"16@\"WCBaseNetworkingError\"24@\"GetUserHistoryPageResponse\"32"
}
```

### lldb

```lldb
(lldb) po $x0
WCCgiBlockHelper

(lldb) po (char*)$x1
"helperWithInitBlock:startBlock:successBlock:failBlock:"

(lldb) po $x2
<__NSGlobalBlock__: 0x10bb43d60>
 signature: "@"WCBaseCgi"8@?0"

(lldb) po $x3
<__NSGlobalBlock__: 0x16d8b3b00>
 signature: "v16@?0@"WCCgiBlockHelper"8"

(lldb) po $x4
<__NSStackBlock__: 0x16d8b3ad8>
 signature: "v32@?0@"WCCgiBlockHelper"8@"WCBaseCgi"16@"GetUserHistoryPageResponse"24"

(lldb) po $x5
<__NSGlobalBlock__: 0x10bb43dd0>
 signature: "v40@?0@"WCCgiBlockHelper"8@"WCBaseCgi"16@"WCBaseNetworkingError"24@"GetUserHistoryPageResponse"32"

(lldb) pblock $x2
Imp: 0x10330cc84 -> 0x100dc4c84   Signature: WCBaseCgi * ^();
(lldb) pblock $x3
Imp: 0x10330cce4 -> 0x100dc4ce4   Signature: void ^(WCCgiBlockHelper *);
(lldb) pblock $x4
Imp: 0x10330cdec -> 0x100dc4dec   Signature: void ^(WCCgiBlockHelper *, WCBaseCgi *, GetUserHistoryPageResponse *);
(lldb) pblock $x5
Imp: 0x10330d020 -> 0x100dc5020   Signature: void ^(WCCgiBlockHelper *, WCBaseCgi *, WCBaseNetworkingError *, GetUserHistoryPageResponse *);
```

## WCBaseCgi 方法跟踪

```txt
7226 ms  -[WCBaseCgi init]
7226 ms     | -[WCBaseCgi setCacheType:0x0]
7226 ms     | -[WCBaseCgi setCacheDuration:0x0]
7227 ms     | -[WCBaseCgi setCacheExpiredDate:0x0]
7227 ms     | -[WCBaseCgi setRetryCount:0x2]
7227 ms     | -[WCBaseCgi setCacheResponseClass:0x0]
7227 ms     | -[WCBaseCgi setIsNeedNotify:0x1]
7228 ms     | -[WCBaseCgi setIsTreatBaseResponseRetAsNetworkingRet:0x1]
7228 ms     | -[WCBaseCgi setIsAutoLifeCycle:0x0]
7228 ms     | -[WCBaseCgi setCgiStatus:0x0]
7228 ms     | -[WCBaseCgi setServerProcessCost:0x0]
7228 ms     | -[WCBaseCgi setTotalTimeout:0x0]
7229 ms  -[WCBaseCgi setCgiNumber:0x12e3]
7229 ms  -[WCBaseCgi setDebugModuleName:__NSCFConstantString]
7289 ms  -[WCBaseCgi setBaseDelegate:WCCgiBlockHelper]
7290 ms  -[WCBaseCgi setRequest:<GetUserHistoryPageRequest: 0x282263000>]
7291 ms  -[WCBaseCgi start]
7291 ms     | -[WCBaseCgi prepareStart]
7291 ms     |    | -[WCBaseCgi cgiNumber]
7291 ms     |    | -[WCBaseCgi cgiStatus]
7291 ms     | -[WCBaseCgi loadCache]
7291 ms     |    | -[WCBaseCgi cacheType]
7291 ms     |    | -[WCBaseCgi debugModuleName]
7291 ms     | -[WCBaseCgi startWithoutCache]
7292 ms     |    | -[WCBaseCgi request]
7292 ms     |    | -[WCBaseCgi cgiNumber]
7292 ms     |    | -[WCBaseCgi retryCount]
7292 ms     |    | -[WCBaseCgi longPolling]
7292 ms     |    | -[WCBaseCgi baseDelegate]
7292 ms     |    | -[WCBaseCgi baseDelegate]
7292 ms     |    | -[WCBaseCgi serverProcessCost]
7292 ms     |    | -[WCBaseCgi totalTimeout]
7292 ms     |    | -[WCBaseCgi respDecryptKey]
7292 ms     |    | -[WCBaseCgi isNeedNotify]
7292 ms     |    | -[WCBaseCgi setEventID:0x95]
7292 ms     |    | -[WCBaseCgi setCgiStatus:0x1]
7292 ms     |    | -[WCBaseCgi debugModuleName]
7292 ms     |    | -[WCBaseCgi cgiNumber]
7715 ms  -[WCBaseCgi MessageReturn:<ProtobufCGIWrap: 0x28169ecb0> Event:0x95]
```
