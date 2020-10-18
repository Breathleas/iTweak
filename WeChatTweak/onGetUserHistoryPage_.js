function convertTimestampToString(timestamp) {
  var datetime = new Date(timestamp * 1000);
  var year = datetime.getFullYear();
  var month = datetime.getMonth() + 1;
  var day = datetime.getDate();
  var ret = year + "-" + month + "-" + day;
  return ret;
}

if (ObjC.available && "BraceletHistoryViewController" in ObjC.classes) {
  var BraceletHistoryViewController = ObjC.classes.BraceletHistoryViewController;
  var onGetUserHistoryPage_ = BraceletHistoryViewController["- onGetUserHistoryPage:"];

  Interceptor.attach(onGetUserHistoryPage_.implementation, {
    onEnter: function (args) {
      var response = ObjC.Object(args[2]); //response type: GetUserHistoryPageResponse
      console.log("-[BraceletHistoryViewController onGetUserHistoryPage:" + response.$className + "]");
      console.log("\tBacktrace:\n\t" + Thread.backtrace(this.context, Backtracer.ACCURATE).map(DebugSymbol.fromAddress).join("\n\t"));
      // console.log("arg2 type:", response.$class, response.$className);
      var list = response.dailySportList();
      var count = list.count().valueOf();
      for (var i = 0; i !== count; i++) {
        var element = list.objectAtIndex_(i); //element type: DailySportRecord
        // var desc = element['- _ivarDescription']();
        // var likeList = element.likeList();
        // var sportrecord = element.sportrecord();
        var rankDesc = element.rankdesc(); //rankDesc
        var score = rankDesc.score();
        var title = rankDesc.title().toString();
        var likecount = element.likecount(); //number
        var timestamp = element.timestamp(); //number
        console.log(
          "{" +
            "likecount: " + likecount + ", " +
            "time: " + convertTimestampToString(timestamp) + ", " +
            "score " + score + ", title: " + title +
          "}"
        );
      }
    },
  });
}
/*

@interface BraceletHistoryViewController : MMUIViewController <UITableViewDelegate, UITableViewDataSource, BraceletSportRecordDelegate>

@property(retain, nonatomic) NSString *username; // @synthesize username=_username;

@end

@interface GetUserHistoryPageResponse : WXPBGeneratedMessage

@property(retain, nonatomic) BaseResponse *baseResponse;
@property(retain, nonatomic) NSMutableArray *dailySportList; //DailySportRecord

@end

@interface DailySportRecord : WXPBGeneratedMessage

@property(nonatomic) _Bool isLike;
@property(retain, nonatomic) NSMutableArray *likeList;
@property(nonatomic) unsigned int likecount;
@property(retain, nonatomic) rankDesc *rankdesc;
@property(retain, nonatomic) NSMutableArray *sportrecord;
@property(nonatomic) unsigned int timestamp;

@end

@interface rankDesc : WXPBGeneratedMessage

@property(nonatomic) unsigned int score;
@property(retain, nonatomic) NSString *title;

@end
*/
