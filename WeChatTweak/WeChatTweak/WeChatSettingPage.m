//
//  WXSettingPage.m
//  WeChatTweak
//
//  Created by jiaxw on 2020/11/09.
//

#import <UIKit/UIKit.h>
#import "CaptainHook.h"
#import "CYUtils.h"
#import "MMWebViewController.h"

CHDeclareClass(NewSettingViewController);

CHMethod0(void, NewSettingViewController, reloadTableData){
    CHSuper0(NewSettingViewController, reloadTableData);
    
    //创建 cell
    id assistantCell = ((id(*)(id, SEL, SEL, id, id))objc_msgSend)(NSClassFromString(@"WCTableViewCellManager"), @selector(normalCellForSel:target:title:), @selector(onAssistantCellClick), self, @"微信助手");
    //创建 section
    id defaultSection = ((id(*)(id, SEL))objc_msgSend)(NSClassFromString(@"WCTableViewSectionManager"), @selector(defaultSection));
    //添加 cell
    ((id(*)(id, SEL, id))objc_msgSend)(defaultSection, @selector(addCell:), assistantCell);
    
    //添加 section
    id tableViewMgr = objectValueForKey(self, @"m_tableViewMgr");
    ((id(*)(id, SEL, id, int))objc_msgSend)(tableViewMgr, @selector(insertSection:At:), defaultSection, 0);
    
    //刷新 tableview
    UITableView *tableView = objectValueForKey(tableViewMgr, @"tableView");
    [tableView reloadData];
}

CHDeclareMethod0(void, NewSettingViewController, onAssistantCellClick){
    NSURL *url = [NSURL URLWithString:@"https://mp.weixin.qq.com/s/PbJJSvDNgp73njR4F7TFfg"];
    
    NSDictionary *params = @{
        @"disableFirstGetA8Key": @(0),
        @"webTranslateAvailable": @(1)
    };
    MMWebViewController *webviewController = [[NSClassFromString(@"MMWebViewController") alloc] initWithURL:url presentModal:nil extraInfo:params];
    UIViewController* topVC = getTopViewContoler();
    [topVC.navigationController pushViewController:webviewController animated:YES];
}

static __attribute__((constructor)) void _ctorAppLaunchFinished_01(){
    CHLoadLateClass(NewSettingViewController);
    CHHook0(NewSettingViewController, reloadTableData);
}
