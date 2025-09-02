//
//  AAA_netProtocol_BBB.swift
//  Package_net
//
//  Created by Frankie on 28/08/2025.
//

import UIKit
import Alamofire

nonisolated(unsafe) public let kkk_server_lll: AAA_netProtocol_BBB = AAA_netOutModel_BBB()


public protocol AAA_netProtocol_BBB {
    
    
    func CCC_getNetState_DDD() -> Bool
    func CCC_setNetState_DDD(_ bool : Bool)
    
    func CCC_setToken_DDD(_ token : String)
    //环境变量配置
    func CCC_setNetInfo_DDD(_ dics : NSDictionary)
    
    
    //获取header头，登录使用
    func CCC_getHeaderDic_DDD() -> HTTPHeaders
    
    
    
    //初始化下载资源，预加载svga、mp4等资源
    func CCC_loadResources_DDD()
    
    
    //MARK: ==================== 群聊
    
    
    
    //获取群相册
    func CCC_getChatAlbumList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    
    //修改群相册
    func CCC_setGroupAlbum_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    //设置群聊信息
    func CCC_setGroup_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    //操作群成员
    func CCC_getGroupUsers_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    func CCC_addAlbum_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    func CCC_getGroupLibrary_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void)
    
    func CCC_getGroupInfo_DDD(_ params : Int, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    func CCC_saveUrlPath_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    func CCC_uploadVideoToAws_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    func CCC_groupAction_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    func CCC_groupProgressAction_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    
    
    //MARK: ==================== 登录页
    
    //登录
    func CCC_login_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //首冲
    func CCC_getFirstCoin_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    
    
    //MARK: ==================== 1v1
    
    //打电话
    func CCC_callUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //更新照片墙信息
    func CCC_reloadUserPhoto_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping ()->Void)
    
    
    //获取主播墙列表
    func CCC_getWallList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void)
    
    
    //获取首页语聊引流房
    func CCC_getPilot_DDD(_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取打电话的礼物
    func CCC_getCallGftList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void)
    
    
    //刷新rtm token
    func CCC_reloadRtmToken_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    //获取声网AINS
    func CCC_getAINS_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //接电话
    func CCC_acceptCall_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //挂断
    func CCC_stopCall_DDD(_ params : NSDictionary, _ fail : @escaping ()->Void)
    
    
    //保持通话
    func CCC_stillCall_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    
    
    //获取评价好坏列表
    func CCC_getEvalList_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    //评价
    func CCC_evalAnchor_DDD(_ params : NSDictionary)
    
    
    
    //MARK: ==================== 聊天
    
    //创建俱乐部
    func CCC_createClubt_DDD(_ level : Int, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    //俱乐部列表
    func CCC_clubList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    
    
    //检查是否能聊天
    func CCC_checkChat_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    
    
    //我的邀请
    func CCC_myFamilyInvite_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
    
    
    //处理家族邀请
    func CCC_handFamilyInvite_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    
    //打电话
    func CCC_callCenter_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    
    //解锁聊天
    func CCC_unlockChat_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void)
    
        
    
    
    //获取用户信息
    func CCC_getChatUserInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    
    //获取用户在线信息
    func CCC_getChatUserOnlineInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
        
    
    //获取转账按钮（是否需要展示）
    func CCC_canTransfer_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
        
    
    //获取拨打记录列表
    func CCC_getCallList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
        
    
    //转账
    func CCC_transfer_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //MARK: ==================== 语聊
    
    //获取语聊房排行信息
    func CCC_getVoiceRankList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //设置管理
    func CCC_setAdmin_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //获取管理列表
    func CCC_getAdminList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //语聊创建按钮状态检测
    func CCC_voiceCreateCheck_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //获取语聊列表
    func CCC_getVoiceList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //搜索用户
    func CCC_searchUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //音乐列表
    func CCC_getMusicList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //搜藏音乐
    func CCC_favoriteMusic_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //播放音乐
    func CCC_playMusic_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //搜索音乐
    func CCC_searchMusic_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
    //获取语聊收益列表
    func CCC_dataList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //获取语聊收益详情
    func CCC_dataDetail_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //邀请用户加入语聊
    func CCC_inviteUser_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //保存公告，语聊房加锁解锁
    func CCC_saveNotice_DDD(_ name : String, _ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    //获取emoji列表
    func CCC_getEmojiList_DDD(_ suc : @escaping (_ array : [Any])->Void)
    
    
    //被邀请上座，同意、拒绝、开关视频、开关麦克风
    func CCC_agreeSit_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //踢人
    func CCC_kickUser_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //创建语聊房
    func CCC_createChatroom_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //修改语聊房信息
    func CCC_changeChatroomInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //获取首页任务信息
    func CCC_gethomeTaskInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //MARK: ==================== 直播
    //获取国家
    func CCC_getCountryData_DDD(_ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void)
    
    
    //获取语言
    func CCC_getLanguageData_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void)
        
    //获取礼物列表
    func CCC_giftList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    
    //赠送直播礼物
    func CCC_sendGiftData_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //赠送语聊礼物
    func CCC_sendVoiceLuckyGiftData_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //赠送道具
    func CCC_sendBackpackGift_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    //启动APP，判断进A或B
    func CCC_launchAPP_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    
    
    //初始化APP的时候，获取是否够审核，会返回首冲和语聊房邀请信息
    func CCC_loadAPP_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
        
    //关注用户
    func CCC_followUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
        
    //直播列表
    func CCC_liveList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void)
        
    
    //打点事件
    func CCC_action_DDD(_ params : NSDictionary)
        
    
    //打点事件1
    func CCC_userAction_DDD(_ params : NSDictionary)
        
    
    //加入、离开直播间
    func CCC_actionRoom_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
        
    
    //获取直播语聊房内banner
    func CCC_getRoomBanner_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
        
    //获取直播PK排行信息
    func CCC_getPKRankInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
        
    
    //获取直播间在线用户列表
    func CCC_getRoomOnlineList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
        
    
    //翻译
    func CCC_translate_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
        
    
    //重新获取rtm token
    func CCC_getRTMToken_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
        
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    func CCC_downGiftRes_DDD(_ url : String)
        
    
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    func CCC_downGiftRes_DDD(_ url : String, _ suc : @escaping ()->Void)
        
    
    //MARK: ==================== 个人中心
    
    
    //上传我的相册图片1，需要取消上传
    func CCC_updateImage1_DDD(_ image : UIImage, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    //上传我的相册图片2，需要取消上传
    func CCC_updateImage2_DDD(_ image : UIImage, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    //上传我的相册图片3，需要取消上传
    func CCC_updateImage3_DDD(_ image : UIImage, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    func CCC_cancelUpdate1_DDD()
    
    func CCC_cancelUpdate2_DDD()
    
    func CCC_cancelUpdate3_DDD()
    
    
    
    //上传视频
    func CCC_updateVideo_DDD(_ video : Data, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    //上传图片
    func CCC_updateImage_DDD(_ image : UIImage, _ kkk_isGroup_lll : Bool?, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ msg : String)->Void)
    
    //上传图片，返回进度
    func CCC_updateImage_DDD(_ image : UIImage, _ kkk_isGroup_lll : Bool?, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ msg : String)->Void)
    
    //上传图片，data类型
    func CCC_updateData_DDD(_ data : Data, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    
    //创建家族
    func CCC_createFamily_DDD(_ params : NSDictionary, _ suc : @escaping (_ state : Int)->Void, _ fail : @escaping (_ string : String)->Void)
    
    
    //获取用户信息
    func CCC_getUserInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //获取个人信息
    func CCC_getMyInfo_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //获取用户信息
    func CCC_getCallUserInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    //苹果充值成功后，验证充值加金币
    func CCC_checkIAP_DDD(_ params : NSDictionary,_ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void)
    
    
    //获取背包信息
    func CCC_getBackpackData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取商店信息
    func CCC_getStoreData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取背包其他类型的信息
    func CCC_getBackpackOtherData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取拉黑列表
    func CCC_getBlockList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取粉丝列表
    func CCC_getFansList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取关注列表
    func CCC_getFollowList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取等级相关信息
    func CCC_getLevelData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
    
    //获取CP列表
    func CCC_getCPList_DDD(_ params : NSDictionary,_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //发送邀请消息
    func CCC_sendInviteMsg_DDD(_ params : NSDictionary,_ suc : @escaping (_ string : String)->Void)
    
    //注销
    func CCC_deleteAccount_DDD(_ suc : @escaping ()->Void)
    
    //退出登录
    func CCC_logOut_DDD(_ suc : @escaping ()->Void)
    
    
    //MARK: ==================== 举报拉黑
    //获取举报列表
    func CCC_getReportList_DDD(_ suc : @escaping (_ array : NSArray)->Void)
    
    //举报用户
    func CCC_reportData_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    //拉黑用户
    func CCC_blockUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dic : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    //任务列表
    func CCC_getRewardList_DDD(_ params : NSDictionary?, _ suc : @escaping (_ array : [Any])->Void)
    
    //编辑个人信息
    func CCC_editMyInfo_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void)
    
    //访客列表
    func CCC_getVisitorList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void)
    
    //充值记录列表
    func CCC_getCoinRecordList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void)
    
    //购买商店产品
    func CCC_buyStorePurchase_DDD(_ params : NSDictionary, _ suc : @escaping (_ str : String?)->Void)
    
    //搜索用户，赠送礼物用
    func CCC_searchUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
    //钻石记录
    func CCC_getDiamondRecordList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void)
    
    //获取充值商品列表
    func CCC_getProductList_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //获取Banner列表
    func CCC_getWallBannerList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
    //钻石兑换金币信息，家族创建费用信息
    func CCC_getWalletConfigData_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //兑换金币
    func CCC_exchangeGold_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void)
    
    //获取背包物品详情
    func CCC_getBackpackInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void)
    
    
    //修改我的个人信息
    func CCC_editMyInfos_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //获取家族列表
    func CCC_getFamilyList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
    //获取家族详情
    func CCC_getFamilyDetail_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //获取家族成员列表
    func CCC_getFamilyMemberList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void)
    
    //设置家族信息
    func CCC_setFamilyData_DDD(_ params : NSDictionary, _ suc : @escaping (_ string : String)->Void)
    
    //反馈
    func CCC_feedBack_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void)
    
    //背包道具状态修改
    func CCC_renewChanged_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void)
    
    //脱下道具
    func CCC_wearProps_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void)
    
    //批量获取用户信息
    func CCC_getUsersInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void)
    
    //MARK: ==================== 游戏相关
    //获取游戏列表
    func CCC_getGameList_DDD(_ params : NSDictionary ,_ suc : @escaping (_ array : NSArray)->Void)
        
    //获取语聊游戏列表
    func CCC_getVoiceGameList_DDD(_ params : NSDictionary ,_ suc : @escaping (_ array : NSArray)->Void)
    
    //MARK: ====================网络请求相关
    //取消请求
    func CCC_cancelRequest_DDD()
    
    //MARK: ==================== 排行榜相关
    //获取排行信息
    func CCC_getRankListData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray, _ values : Double)->Void)
    
    //获取CP排行信息
    func CCC_getCPRankListData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
        
    //获取语聊房背景列表/ums/live/bgstore?room_id=1
    func CCC_getBgstoreListData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void)
        
    
    //MARK: ==================== 下载
    //下载数据
    func CCC_downloadData_DDD(_ string : String,_ suc : @escaping (_ string : String)->Void)
    
}
