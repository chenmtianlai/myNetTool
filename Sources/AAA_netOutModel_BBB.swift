//
//  AAA_netOutModel_BBB.swift
//  Module_Net
//
//  Created by Frankie on 28/05/2025.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
import Alamofire


//加密公钥
let kkk_publicKey_lll = """
        -----BEGIN PUBLIC KEY-----
        MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDAFDI/oPBDx/MyxyKPNJfs6H7+
        QskfLCmsfZSkKQGkwyn1xtgZovC+1qgO7Gj/+mSZiy2Lo6/0SIUyAPvKlkOt4Dsj
        tvFG0Yw0TerrPBdsuLuMTy8+T+5VzfkRKKbOPAtFK68B1d9DCplQMSdi3iM1kAqA
        OOsF93NocDyHqfy2/wIDAQAB
        -----END PUBLIC KEY-----
        """
//加密指纹
let kkk_fingerprint_lll = "ios.demo"
//加密本地字符串
let kkk_signKey_lll = "xF18z0UsTlXhB2WPzPwnB8ZA1A3h8sWg"

//测试域名
let kkk_baseUrl_lll = "https://testapi2.xiaohuang.link/"
// 正式域名
//let kkk_baseUrl_lll = "https://api2.umumchat.com/"
nonisolated(unsafe) var kkk_token_lll = ""
//包名
let kkk_myAppHeaderName_lll = "com.ihbsjzmrt.demo"
//渠道
let kkk_myAppLocalName_lll = "Wohoo"

//以上内容需手动修改


public class AAA_netOutModel_BBB: NSObject {
    
    nonisolated(unsafe) public static var kkk_net_lll = false
    nonisolated(unsafe) static let kkk_netModel_lll = AAA_net_BBB.kkk_share_lll
    
    //设置token
    public class func CCC_setToken_DDD(_ token : String) {
        kkk_token_lll = token
    }
    
    //获取header头，登录使用
    public class func CCC_getHeaderDic_DDD() -> HTTPHeaders {
        return kkk_netModel_lll.CCC_getRequestHeaderDic_DDD()
    }
    
    
    //初始化下载资源，预加载svga、mp4等资源
    public class func CCC_loadResources_DDD() {
        AAA_NetModule_BBB.CCC_loadResources_DDD()
        AAA_NetModule_BBB.CCC_netState_DDD {} fail: {}

    }
    //MARK: ==================== 登录页
    
    //登录
    public class func CCC_login_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_loginPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    //首冲
    public class func CCC_getFirstCoin_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_HomeFirstChargePath_lll, [kkk_posStr_lll : 1]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    
    //MARK: ==================== 1v1
    
    //打电话
    public class func CCC_callUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_videoCallPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    //更新照片墙信息
    public class func CCC_reloadUserPhoto_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_umsUserPhoto_lll, params) { request in
            suc()
        }fail: { msg in
            fail()
        }
    }
    
    //获取主播墙列表
    public class func CCC_getWallList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_umsUserWall_lll, params) { request in
            suc((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        }fail: { msg in
            fail()
        }
    }
    
    //获取首页语聊引流房
    public class func CCC_getPilot_DDD(_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_pilotPath_lll, [:]) { request in
            suc(request as! NSArray)
        }fail: { msg in
        }
    }
    
    //获取打电话的礼物
    public class func CCC_getCallGftList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_umsUserGiftcount_lll, params) { request in
            suc(request as! NSArray)
        }fail: { msg in
            fail()
        }
    }
    
    //刷新rtm token
    public class func CCC_reloadRtmToken_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_refreshRtmTokenPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    //获取声网AINS
    public class func CCC_getAINS_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_sysConfigPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    //接电话
    public class func CCC_acceptCall_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_acceptVideoCallPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //挂断
    public class func CCC_stopCall_DDD(_ params : NSDictionary, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_stopVideoCallPath_lll, params) { request in
            fail()
        }fail: { msg in
            fail()
        }
    }
    
    
    //保持通话
    public class func CCC_stillCall_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_HoldCallingPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail()
        }
    }
    
    
    //获取评价好坏列表
    public class func CCC_getEvalList_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_callEvalLabel_lll, [:]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //评价
    public class func CCC_evalAnchor_DDD(_ params : NSDictionary) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_callEvalAnchor_lll, params) { request in
        }fail: { msg in
        }
    }
    
    
    //MARK: ==================== 聊天
    
    
    //检查是否能聊天
    public class func CCC_checkChat_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_checkChatCountPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in}
    }
    
    
    
    //我的邀请
    public class func CCC_myFamilyInvite_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_umsfamilyinteractivemessages_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in}
    }
    
    
    //处理家族邀请
    public class func CCC_handFamilyInvite_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_umsfamilyinvitecheck_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //打电话
    public class func CCC_callCenter_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_CallCenterInfoPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //解锁聊天
    public class func CCC_unlockChat_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_UnlockChatPath_lll, params) { request in
            suc()
        }fail: { msg in
        }
    }
    
    
    //获取用户信息
    public class func CCC_getChatUserInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_UserChatInfoPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //获取拨打记录
    public class func CCC_getChatUserInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_callListPath_lll, params) { request in
            suc(request as! NSArray)
        }fail: { msg in
        }
    }
    
    
    //获取用户在线信息
    public class func CCC_getChatUserOnlineInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_umsUserStartatus_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //获取转账按钮（是否需要展示）
    public class func CCC_canTransfer_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_umsUserStartatus_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //获取拨打记录列表
    public class func CCC_getCallList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_callListPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail()
        }
    }
    
    
    //转账
    public class func CCC_transfer_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_omswallettransfer_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //MARK: ==================== 语聊
    
    //获取语聊房排行信息
    public class func CCC_getVoiceRankList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_rankListPath_lll, params) { request in
            suc((request as? NSDictionary) ?? NSDictionary())
        } fail: { msg in
            fail(msg)
        }
    }
    
    //设置管理
    public class func CCC_setAdmin_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_setAdminPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取管理列表
    public class func CCC_getAdminList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_setAdminPath_lll, params) { request in
            let kkk_array_lll = (request as? NSArray) ?? []
            suc(kkk_array_lll)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //语聊创建按钮状态检测
    public class func CCC_voiceCreateCheck_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_checkVoicePath_lll, [:]) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //获取语聊列表
    public class func CCC_getVoiceList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_voiceListPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //搜索用户
    public class func CCC_searchUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_SearchUserPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //音乐列表
    public class func CCC_getMusicList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voiceMusicPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //搜藏音乐
    public class func CCC_favoriteMusic_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voiceLoveMusicPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //播放音乐
    public class func CCC_playMusic_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voiceMusicPlayPath_lll, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //搜索音乐
    public class func CCC_searchMusic_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_searchMusic_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
        }
    }
    
    //获取语聊收益列表
    public class func CCC_dataList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voicePlayListPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取语聊收益详情
    public class func CCC_dataDetail_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voiceDataDetailPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //邀请用户加入语聊
    public class func CCC_inviteUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_inviteJoinVideoChat_lll, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //保存公告，语聊房加锁解锁
    public class func CCC_saveNotice_DDD(_ name : String, _ params : NSDictionary, _ suc : @Sendable @escaping ()->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voiceOrNotifyInfoPath_lll, name: name, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取emoji列表
    public class func CCC_getEmojiList_DDD(_ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_emojiListPath_lll, [:]) { request in
            suc(request as! [Any])
        } fail: { msg in
        }
    }
    
    //被邀请上座，同意、拒绝、开关视频、开关麦克风
    public class func CCC_agreeSit_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voicesitsPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //踢人
    public class func CCC_kickUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voicekickUserPath_lll, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //创建语聊房
    public class func CCC_createChatroom_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voiceroomStartPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //修改语聊房信息
    public class func CCC_changeChatroomInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voiceInfoChangesPath_lll, params) { request in
            suc(NSDictionary())
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取首页任务信息
    public class func CCC_gethomeTaskInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_homeTaskShowPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    
    
    //MARK: ==================== 直播
    //获取国家
    public class func CCC_getCountryData_DDD(_ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_countryListPath_lll, [:]) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail()
        }
    }
    
    //获取语言
    public class func CCC_getLanguageData_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_MatchLabsPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail()
        }
    }
    
    //获取礼物列表
    public class func CCC_giftList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voiceGiftPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //赠送直播礼物
    public class func CCC_sendGiftData_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_sendPresentForUserPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //赠送语聊礼物
    public class func CCC_sendVoiceLuckyGiftData_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voicesendGiftPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //赠送道具
    public class func CCC_sendBackpackGift_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_sendBagGiftPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    //启动APP，判断进A或B
    public class func CCC_launchAPP_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_CheckStatusPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc([:])
        }
    }
    
    
    //初始化APP的时候，获取是否够审核，会返回首冲和语聊房邀请信息
    public class func CCC_loadAPP_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_CheckStatusPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in}
    }
    
    //关注用户
    public class func CCC_followUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_followUserPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in}
    }
    
    //直播列表
    public class func CCC_liveList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_vioListPath_lll, params) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //打点事件
    public class func CCC_action_DDD(_ params : NSDictionary) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_showInvitePath_lll, params) { request in
        } fail: { msg in
        }
    }
    
    //打点事件1
    public class func CCC_userAction_DDD(_ params : NSDictionary) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_userActionsPath_lll, params) { request in
        } fail: { msg in
        }
    }
    
    //加入、离开直播间
    public class func CCC_actionRoom_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_vioJoinPlayPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取直播语聊房内banner
    public class func CCC_getRoomBanner_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_roomBanner_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
        }
    }
    
    //获取直播PK排行信息
    public class func CCC_getPKRankInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_pkRankPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //获取直播间在线用户列表
    public class func CCC_getRoomOnlineList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_voiUserListPth_lll, params) { request in
            suc((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //翻译
    public class func CCC_translate_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_TranslateMessagePath_lll, params) { request in
            suc((request as? NSDictionary) ?? NSDictionary())
        } fail: { msg in
            fail()
        }
    }
    
    //重新获取rtm token
    public class func CCC_getRTMToken_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_reloadRTCToken_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    public class func CCC_downGiftRes_DDD(_ url : String) {
        AAA_NetModule_BBB.CCC_downGiftRes_DDD(url)
    }
    
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    public class func CCC_downGiftRes_DDD(_ url : String, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_downImgRes_DDD(url) {
            suc()
        }
    }
    
    //MARK: ==================== 个人中心
    //上传图片
    public class func CCC_updateImage_DDD(_ image : UIImage, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_updateImage_DDD(image) { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    //上传图片，返回进度
    public class func CCC_updateImage_DDD(_ image : UIImage, gress:@Sendable @escaping (_ gress : Double)->Void, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_updateImage_DDD(image) { req in
            gress(req)
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    //上传图片，data类型
    public class func CCC_updateData_DDD(_ data : Data, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_updateData_DDD(data) { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //创建家族
    public class func CCC_createFamily_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ state : Int)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_createFamilyPath_lll, params) { req in
            suc(req as! Int)
        } fail: { error in
            fail(error)
        }
    }
    
    //获取用户信息
    public class func CCC_getUserInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_vioUserInfoPath_lll, params) { req in
            suc(req as! NSDictionary)
        }fail: { msg in}
    }
    
    //获取个人信息
    public class func CCC_getMyInfo_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_UserDetailProfilePath_lll, [:]) { req in
            suc(req as! NSDictionary)
        } fail: { msg in}
    }
    //获取用户信息
    public class func CCC_getCallUserInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_UserDetailProfilePath_lll, params) { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //苹果充值成功后，验证充值加金币
    public class func CCC_checkIAP_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void, _ fail : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_CheckIAPStatusPath_lll, params, suc: { req in
            suc(req as! NSDictionary)
        }, fail: { msg in
            fail()
        })
    }
    
    //获取背包信息
    public class func CCC_getBackpackData_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_mineMyAnimationPath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取商店信息
    public class func CCC_getStoreData_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voiceAnimationStorePath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取背包其他类型的信息
    public class func CCC_getBackpackOtherData_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_backpackOtherPath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取拉黑列表
    public class func CCC_getBlockList_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_MyBlackListPath_lll, params) { req in
            suc((req as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取粉丝列表
    public class func CCC_getFansList_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_fansListPath_lll, params) { req in
            suc((req as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取关注列表
    public class func CCC_getFollowList_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_followListPath_lll, params) { req in
            suc((req as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取等级相关信息
    public class func CCC_getLevelData_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_leveInfoPath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取CP列表
    public class func CCC_getCPList_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_CPListPath_lll, params) { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //发送邀请消息
    public class func CCC_sendInviteMsg_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_inviteFamilyPath_lll, params) { req in
            suc("")
        } fail: { msg in
            suc(msg)
        }
    }
    
    //注销
    public class func CCC_deleteAccount_DDD(_ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_deleteMyAccountPath_lll, [:]) { req in
            suc()
        } fail: { msg in
        }
    }
    
    //退出登录
    public class func CCC_logOut_DDD(_ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_logOutPath_lll, [:]) { req in
            suc()
        } fail: { msg in
        }
    }
    
    
    
    //MARK: ==================== 举报拉黑
    //获取举报列表
    public class func CCC_getReportList_DDD(_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_tipsListPath_lll, [:]) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            
        }
    }
    
    //举报用户
    public class func CCC_reportData_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voicereportsPath_lll, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //拉黑用户
    public class func CCC_blockUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dic : NSDictionary)->Void, _ fail : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_blockUserPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //任务列表
    public class func CCC_getRewardList_DDD(_ params : NSDictionary? = [:], _ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_rewardListPath_lll, params!) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //编辑个人信息
    public class func CCC_editMyInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_editMyInfoPath_lll, params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //访客列表
    public class func CCC_getVisitorList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_victorListPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //充值记录列表
    public class func CCC_getCoinRecordList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voiceUsersIncomePath_lll, params) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //购买商店产品
    public class func CCC_buyStorePurchase_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_storePurchasePath_lll, params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //搜索用户，赠送礼物用
    public class func CCC_searchUser_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_storePurchasePath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //钻石记录
    public class func CCC_getDiamondRecordList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_diamondRecordPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //获取充值商品列表
    public class func CCC_getProductList_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_MyCdListPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //获取Banner列表
    public class func CCC_getWallBannerList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        print("```````````reget banner")
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_MyWallBannerPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //钻石兑换金币信息，家族创建费用信息
    public class func CCC_getWalletConfigData_DDD(_ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_walletConfigPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //兑换金币
    public class func CCC_exchangeGold_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_postData_DDD(.kkk_walletExchangePath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //获取背包物品详情
    public class func CCC_getBackpackInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : [Any])->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_openChestPath_lll, params) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    
    //修改我的个人信息
    public class func CCC_editMyInfos_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_editAllMyInfoPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //获取家族列表
    public class func CCC_getFamilyList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_familyListPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取家族详情
    public class func CCC_getFamilyDetail_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_familyDetail_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //获取家族成员列表
    public class func CCC_getFamilyMemberList_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ dics : NSDictionary)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_familyMemberList_lll, params) { request in
            suc((request as! NSDictionary))
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //设置家族信息
    public class func CCC_setFamilyData_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ string : String)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_setFamilyPath_lll, params) { request in
            suc("")
        } fail: { msg in
            if msg.count > 0 {
                suc(msg)
            }
        }
    }
    
    //反馈
    public class func CCC_feedBack_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_feedBackPath_lll, params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //背包道具状态修改
    public class func CCC_renewChanged_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_autorenewPath_lll, params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //脱下道具
    public class func CCC_wearProps_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping ()->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_voiceActionUserPath_lll, params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //批量获取用户信息
    public class func CCC_getUsersInfo_DDD(_ params : NSDictionary, _ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_postData_DDD(.kkk_umsUserManyPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //MARK: ==================== 游戏相关
    //获取游戏列表
    public class func CCC_getGameList_DDD(_ params : NSDictionary ,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getShareData_DDD(.kkk_PlaysPath_lll, params) { array in
            suc(array as! NSArray)
        }fail: { msg in}
    }
    //获取语聊游戏列表
    public class func CCC_getVoiceGameList_DDD(_ params : NSDictionary ,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_voicePlayPath_lll, params) { array in
            suc(array as! NSArray)
        }fail: { msg in}
    }
    
    //MARK: ====================网络请求相关
    //取消请求
    public class func CCC_cancelRequest_DDD() {
        AAA_NetModule_BBB.CCC_cancelRequest_DDD()
    }
    //MARK: ==================== 排行榜相关
    //获取排行信息
    public class func CCC_getRankListData_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray, _ values : Double)->Void) {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_pubRankPath_lll, params) { req in
            let kkk_dic_lll = (req as! NSDictionary)
            let kkk_array_lll = (kkk_dic_lll[kkk_LabelHttpReqRowsLabel_lll] as? NSArray) ?? []
            let kkk_myMomey_lll = CCC_keyDouble_DDD(kkk_dic_lll, kkk_float_amountStr_lll)
            suc(kkk_array_lll, kkk_myMomey_lll)
        }fail: { msg in
            suc([], 0.0)
        }
    }
    
    //获取CP排行信息
    public class func CCC_getCPRankListData_DDD(_ params : NSDictionary,_ suc : @Sendable @escaping (_ array : NSArray)->Void) {
        AAA_NetModule_BBB.CCC_getData_DDD(.kkk_CPRankPath_lll, params) { req in
            let kkk_dic_lll = (req as! NSDictionary)
            let kkk_array_lll = (kkk_dic_lll[kkk_LabelHttpReqRowsLabel_lll] as? NSArray) ?? []
            suc(kkk_array_lll)
        }fail: { msg in
            suc([])
            
        }
    }
    
    //MARK: ==================== 下载
    //下载数据
    public class func CCC_downloadData_DDD(_ string : String,_ suc : @Sendable @escaping (_ string : String)->Void) {
        AAA_NetModule_BBB.CCC_downData_DDD(string) { req in
            suc(req as! String)
        } fail: { msg in
            suc("")
        }
    }
    
    
    //MARK: ====================通知相关
    //退出登录通知
    class func CCC_postLogoutNoty_DDD() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_showLoginControllerNoty_NNN"), object: nil)
    }
    //弹出充值弹窗通知
    class func CCC_showRechargeNoty_DDD() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_showRechargeNoty_NNN"), object: nil)
    }
    //下载资源成功通知
    class func CCC_downResourceSucNoty_DDD(_ string : String) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_sourcesDownloadSuc_NNN"), object: string)
    }
    //下载资源成功通知通知传url，
    class func CCC_downUrlSucNoty_DDD(_ string : String, _ dic : [String:Any]) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: string), object: dic)
    }
    
}
