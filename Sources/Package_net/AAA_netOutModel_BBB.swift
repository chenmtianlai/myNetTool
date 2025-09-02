//
//  AAA_netOutModel_BBB.swift
//  Module_Net
//
//  Created by Frankie on 28/05/2025.
//

import UIKit
import Alamofire




nonisolated(unsafe) var kkk_nets_lll : AAA_netProtocol_BBB! = AAA_netOutModel_BBB()

nonisolated(unsafe) public let kkk_server_lll: AAA_netProtocol_BBB = AAA_netOutModel_BBB()

final class AAA_netOutModel_BBB: AAA_netProtocol_BBB {
    
    nonisolated(unsafe) public static var kkk_net_lll = false
    nonisolated(unsafe) var kkk_manager_lll : AAA_netManager_BBB! = AAA_netManager_BBB()
    
    //设置token
    func CCC_setToken_DDD(_ token : String) {
        AAA_netManager_BBB.kkk_token_lll = token
    }
    //环境变量配置
    func CCC_setNetInfo_DDD(_ dics : NSDictionary) {
        AAA_netManager_BBB.kkk_publicKey_lll = dics["kkk_publicStr_lll"] as! String
        AAA_netManager_BBB.kkk_fingerprint_lll = dics["kkk_fingerprintStr_lll"] as! String
        AAA_netManager_BBB.kkk_signKey_lll = dics["kkk_signStr_lll"] as! String
        AAA_netManager_BBB.kkk_baseUrl_lll = dics["kkk_baseUrlStr_lll"] as! String
        AAA_netManager_BBB.kkk_myAppHeaderName_lll = dics["kkk_myAppHeaderNameStr_lll"] as! String
        AAA_netManager_BBB.kkk_myAppLocalName_lll = dics["kkk_myAppLocalNameStr_lll"] as! String
        AAA_netManager_BBB.kkk_deviceVersion_lll = dics["kkk_deviceVersion_lll"] as! String
    }
    
    //获取header头，登录使用
    func CCC_getHeaderDic_DDD() -> HTTPHeaders {
        return kkk_manager_lll.CCC_getRequestHeaderDic_DDD()
    }
    
    
    //初始化下载资源，预加载svga、mp4等资源
    func CCC_loadResources_DDD() {
//        kkk_manager_lll.CCC_loadResources_DDD()
        kkk_manager_lll.CCC_netState_DDD {} fail: {}

    }
    
    //MARK: ==================== 群聊
    
    
    
    
    
    
    
    
    
    
    //获取群相册
    func CCC_getChatAlbumList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_chatAlbumPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail(msg)
        }
    }
    
    
    //修改群相册
    func CCC_setGroupAlbum_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_changeAlbumPath_lll, "", params) { request in
            suc()
        }fail: { msg in
            fail(msg)
        }
    }
    //设置群聊信息
    func CCC_setGroup_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_groupUpdatePath_lll, "", params) { request in
            suc()
        }fail: { msg in
            fail(msg)
        }
    }
    //操作群成员
    func CCC_getGroupUsers_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_groupUsersPath_lll, params) { request in
            suc((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        }fail: { msg in
            fail(msg)
        }
    }
    
    func CCC_addAlbum_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_addAlbumPath_lll, "", params) { request in
            suc()
        }fail: { msg in
            fail(msg)
        }
    }
    
    func CCC_getGroupLibrary_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_groupLibraryPath_lll, params) { request in
            suc(request as! NSArray)
        }fail: { msg in
            fail(msg)
        }
    }
    func CCC_getGroupInfo_DDD(_ params : Int, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_groupInfoPath_lll, [kkk_idStr_lll : params]) { request in
            if request == nil {
                fail("")
            }else {
                suc((request as? NSDictionary) ?? NSDictionary())
            }
        }fail: { msg in
            fail(msg)
        }
    }
    
    func CCC_saveUrlPath_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_saveUrlPath_lll, "", params) { request in
            suc((request as? NSDictionary) ?? NSDictionary())
        }fail: { msg in
            fail(msg)
        }
    }
    
    func CCC_uploadVideoToAws_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_uploadVideoPath_lll, [:]) { request in
            suc((request as? NSDictionary) ?? NSDictionary())
        }fail: { msg in
            fail(msg)
        }
    }
    
    func CCC_groupAction_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_groupActionPath_lll, "", params) { request in
            suc()
        }fail: { msg in
            fail(msg)
        }
    }
    
    func CCC_groupProgressAction_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_processActionPath_lll, params) { request in
            suc()
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    
    //MARK: ==================== 登录页
    
    //登录
    func CCC_login_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_loginPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    //首冲
    func CCC_getFirstCoin_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_HomeFirstChargePath_lll, [kkk_posStr_lll : 1]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    
    //MARK: ==================== 1v1
    
    //打电话
    func CCC_callUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_videoCallPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    //更新照片墙信息
    func CCC_reloadUserPhoto_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_umsUserPhoto_lll, "", params) { request in
            suc()
        }fail: { msg in
            fail()
        }
    }
    
    //获取主播墙列表
    func CCC_getWallList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_umsUserWall_lll, params) { request in
            suc((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        }fail: { msg in
            fail()
        }
    }
    
    //获取首页语聊引流房
    func CCC_getPilot_DDD(_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_pilotPath_lll, [:]) { request in
            suc((request as? NSArray) ?? NSArray())
        }fail: { msg in
        }
    }
    
    //获取打电话的礼物
    func CCC_getCallGftList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_umsUserGiftcount_lll, params) { request in
            suc(request as! NSArray)
        }fail: { msg in
            fail()
        }
    }
    
    //刷新rtm token
    func CCC_reloadRtmToken_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_refreshRtmTokenPath_lll, "", [:]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    //获取声网AINS
    func CCC_getAINS_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_sysConfigPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    //接电话
    func CCC_acceptCall_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_acceptVideoCallPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //挂断
    func CCC_stopCall_DDD(_ params : NSDictionary, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_stopVideoCallPath_lll, "", params) { request in
            fail()
        }fail: { msg in
            fail()
        }
    }
    
    
    //保持通话
    func CCC_stillCall_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_HoldCallingPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail()
        }
    }
    
    
    //获取评价好坏列表
    func CCC_getEvalList_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_callEvalLabel_lll, [:]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //评价
    func CCC_evalAnchor_DDD(_ params : NSDictionary) {
        kkk_manager_lll.CCC_get_DDD(.kkk_callEvalAnchor_lll, params) { request in
        }fail: { msg in
        }
    }
    
    
    //MARK: ==================== 聊天
    
    //创建俱乐部
    func CCC_createClubt_DDD(_ level : Int, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_createClubPath_lll, "", ["level":level]) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            suc([:])
        }
    }
    
    //俱乐部列表
    func CCC_clubList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_clubPath_lll, params) { request in
            suc(request as! NSArray)
        }fail: { msg in
            suc([])
        }
    }
    
    
    //检查是否能聊天
    func CCC_checkChat_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_checkChatCountPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in}
    }
    
    
    
    //我的邀请
    func CCC_myFamilyInvite_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_umsfamilyinteractivemessages_lll, params) { request in
            suc(request as! NSArray)
        }fail: { msg in}
    }
    
    
    //处理家族邀请
    func CCC_handFamilyInvite_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_umsfamilyinvitecheck_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //打电话
    func CCC_callCenter_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_CallCenterInfoPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //解锁聊天
    func CCC_unlockChat_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_UnlockChatPath_lll, "", params) { request in
            suc()
        }fail: { msg in
        }
    }
    
    
    //获取用户信息
    func CCC_getChatUserInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_UserChatInfoPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            
        }
    }
    
    
    
    //获取用户在线信息
    func CCC_getChatUserOnlineInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_umsUserStartatus_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //获取转账按钮（是否需要展示）
    func CCC_canTransfer_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_umsUserStartatus_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
        }
    }
    
    
    //获取拨打记录列表
    func CCC_getCallList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_callListPath_lll, params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail()
        }
    }
    
    
    //转账
    func CCC_transfer_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        _ = kkk_manager_lll.CCC_post_DDD(.kkk_omswallettransfer_lll, "", params) { request in
            suc(request as! NSDictionary)
        }fail: { msg in
            fail(msg)
        }
    }
    
    
    //MARK: ==================== 语聊
    
    //获取语聊房排行信息
    func CCC_getVoiceRankList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_rankListPath_lll, params) { request in
            suc((request as? NSDictionary) ?? NSDictionary())
        } fail: { msg in
            fail(msg)
        }
    }
    
    //设置管理
    func CCC_setAdmin_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_setAdminPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取管理列表
    func CCC_getAdminList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_setAdminPath_lll, params) { request in
            let kkk_array_lll = (request as? NSArray) ?? []
            suc(kkk_array_lll)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //语聊创建按钮状态检测
    func CCC_voiceCreateCheck_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_checkVoicePath_lll, [:]) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //获取语聊列表
    func CCC_getVoiceList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_voiceListPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //搜索用户
    func CCC_searchUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_SearchUserPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //音乐列表
    func CCC_getMusicList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voiceMusicPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //搜藏音乐
    func CCC_favoriteMusic_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voiceLoveMusicPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //播放音乐
    func CCC_playMusic_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voiceMusicPlayPath_lll, "", params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //搜索音乐
    func CCC_searchMusic_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_searchMusic_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
        }
    }
    
    //获取语聊收益列表
    func CCC_dataList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voicePlayListPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取语聊收益详情
    func CCC_dataDetail_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voiceDataDetailPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //邀请用户加入语聊
    func CCC_inviteUser_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_inviteJoinVideoChat_lll, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //保存公告，语聊房加锁解锁
    func CCC_saveNotice_DDD(_ name : String, _ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voiceOrNotifyInfoPath_lll, name, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取emoji列表
    func CCC_getEmojiList_DDD(_ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_emojiListPath_lll, [:]) { request in
            suc(request as! [Any])
        } fail: { msg in
        }
    }
    
    //被邀请上座，同意、拒绝、开关视频、开关麦克风
    func CCC_agreeSit_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voicesitsPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //踢人
    func CCC_kickUser_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voicekickUserPath_lll, params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //创建语聊房
    func CCC_createChatroom_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voiceroomStartPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //修改语聊房信息
    func CCC_changeChatroomInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voiceInfoChangesPath_lll, "", params) { request in
            suc(NSDictionary())
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取首页任务信息
    func CCC_gethomeTaskInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_homeTaskShowPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    
    
    //MARK: ==================== 直播
    //获取国家
    func CCC_getCountryData_DDD(_ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_countryListPath_lll, [:]) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail()
        }
    }
    
    //获取语言
    func CCC_getLanguageData_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_MatchLabsPath_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            fail()
        }
    }
    
    //获取礼物列表
    func CCC_giftList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voiceGiftPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //赠送直播礼物
    func CCC_sendGiftData_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        _ = kkk_manager_lll.CCC_post_DDD(.kkk_sendPresentForUserPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //赠送语聊礼物
    func CCC_sendVoiceLuckyGiftData_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voicesendGiftPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //赠送道具
    func CCC_sendBackpackGift_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_sendBagGiftPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    //启动APP，判断进A或B
    func CCC_launchAPP_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_CheckStatusPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc([:])
        }
    }
    
    
    //初始化APP的时候，获取是否够审核，会返回首冲和语聊房邀请信息
    func CCC_loadAPP_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_CheckStatusPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //关注用户
    func CCC_followUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_followUserPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in}
    }
    
    //直播列表
    func CCC_liveList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_vioListPath_lll, params) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //打点事件
    func CCC_action_DDD(_ params : NSDictionary) {
        kkk_manager_lll.CCC_post_DDD(.kkk_showInvitePath_lll, "", params) { request in
        } fail: { msg in
        }
    }
    
    //打点事件1
    func CCC_userAction_DDD(_ params : NSDictionary) {
        kkk_manager_lll.CCC_post_DDD(.kkk_userActionsPath_lll, "", params) { request in
        } fail: { msg in
        }
    }
    
    //加入、离开直播间
    func CCC_actionRoom_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_vioJoinPlayPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取直播语聊房内banner
    func CCC_getRoomBanner_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_roomBanner_lll, params) { request in
            suc(request as! NSArray)
        } fail: { msg in
        }
    }
    
    //获取直播PK排行信息
    func CCC_getPKRankInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_pkRankPath_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //获取直播间在线用户列表
    func CCC_getRoomOnlineList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_voiUserListPth_lll, params) { request in
            suc((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //翻译
    func CCC_translate_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_TranslateMessagePath_lll, params) { request in
            suc((request as? NSDictionary) ?? NSDictionary())
        } fail: { msg in
            fail()
        }
    }
    
    //重新获取rtm token
    func CCC_getRTMToken_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_reloadRTCToken_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    func CCC_downGiftRes_DDD(_ url : String) {
        kkk_manager_lll.CCC_downShare_DDD(url) {} fail: {}
    }
    
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    func CCC_downGiftRes_DDD(_ url : String, _ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_SDDownImage_DDD(url) {
            suc()
        } fail: {}
    }
    
    //MARK: ==================== 个人中心
    
    
    //上传我的相册图片1，需要取消上传
    func CCC_updateImage1_DDD(_ image : UIImage, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_updateImage1_DDD(image) { press in
            gress(press)
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    //上传我的相册图片2，需要取消上传
    func CCC_updateImage2_DDD(_ image : UIImage, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_updateImage2_DDD(image) { press in
            gress(press)
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    //上传我的相册图片3，需要取消上传
    func CCC_updateImage3_DDD(_ image : UIImage, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_updateImage3_DDD(image) { press in
            gress(press)
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    func CCC_cancelUpdate1_DDD() {
        kkk_manager_lll.CCC_calcelReq1_DDD()
    }
    func CCC_cancelUpdate2_DDD() {
        kkk_manager_lll.CCC_calcelReq2_DDD()
    }
    func CCC_cancelUpdate3_DDD() {
        kkk_manager_lll.CCC_calcelReq3_DDD()
    }
    
    
    //上传视频
    func CCC_updateVideo_DDD(_ video : Data, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_updatesVideoData_DDD(video) { req in
            suc(req as! NSDictionary)
        } fail: { error in
            fail()
        }
    }
    //上传图片
    func CCC_updateImage_DDD(_ image : UIImage, _ kkk_isGroup_lll : Bool? = false, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ msg : String)->Void) {
        let kkk_data_lll = image.jpegData(compressionQuality: 0.1)! as Data
        kkk_manager_lll.CCC_updateImage_DDD(kkk_data_lll, kkk_isGroup_lll) { req in
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    //上传图片，返回进度
    func CCC_updateImage_DDD(_ image : UIImage, _ kkk_isGroup_lll : Bool? = false, gress:@escaping (_ gress : Double)->Void, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ msg : String)->Void) {
        let kkk_data_lll = image.jpegData(compressionQuality: 0.1)! as Data
        kkk_manager_lll.CCC_updateImage_DDD(kkk_data_lll, kkk_isGroup_lll) { req in
            gress(req)
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    //上传图片，data类型
    func CCC_updateData_DDD(_ data : Data, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_updateImage_DDD(data) { req in
        } suc: { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //创建家族
    func CCC_createFamily_DDD(_ params : NSDictionary, _ suc : @escaping (_ state : Int)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_createFamilyPath_lll, "", params) { req in
            suc(req as! Int)
        } fail: { error in
            fail(error)
        }
    }
    
    //获取用户信息
    func CCC_getUserInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_vioUserInfoPath_lll, params) { req in
            suc(req as! NSDictionary)
        }fail: { msg in}
    }
    
    //获取个人信息
    func CCC_getMyInfo_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_UserDetailProfilePath_lll, [:]) { req in
            suc(req as! NSDictionary)
        } fail: { msg in}
    }
    //获取用户信息
    func CCC_getCallUserInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_UserDetailProfilePath_lll, params) { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            fail()
        }
    }
    
    //苹果充值成功后，验证充值加金币
    func CCC_checkIAP_DDD(_ params : NSDictionary,_ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_CheckIAPStatusPath_lll, "", params, suc: { req in
            suc(req as! NSDictionary)
        }, fail: { msg in
            fail()
        })
    }
    
    //获取背包信息
    func CCC_getBackpackData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_mineMyAnimationPath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取商店信息
    func CCC_getStoreData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voiceAnimationStorePath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取背包其他类型的信息
    func CCC_getBackpackOtherData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_backpackOtherPath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取拉黑列表
    func CCC_getBlockList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_MyBlackListPath_lll, params) { req in
            suc((req as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取粉丝列表
    func CCC_getFansList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_fansListPath_lll, params) { req in
            suc((req as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取关注列表
    func CCC_getFollowList_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_followListPath_lll, params) { req in
            suc((req as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll] as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取等级相关信息
    func CCC_getLevelData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_leveInfoPath_lll, params) { req in
            suc(req as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取CP列表
    func CCC_getCPList_DDD(_ params : NSDictionary,_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_CPListPath_lll, params) { req in
            suc(req as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //发送邀请消息
    func CCC_sendInviteMsg_DDD(_ params : NSDictionary,_ suc : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_inviteFamilyPath_lll, params) { req in
            suc("")
        } fail: { msg in
            suc(msg)
        }
    }
    
    //注销
    func CCC_deleteAccount_DDD(_ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_deleteMyAccountPath_lll, "", [:]) { req in
            suc()
        } fail: { msg in
            
        }
    }
    
    //退出登录
    func CCC_logOut_DDD(_ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_logOutPath_lll, "", [:]) { req in
            suc()
        } fail: { msg in
        }
    }
    
    
    
    //MARK: ==================== 举报拉黑
    //获取举报列表
    func CCC_getReportList_DDD(_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_tipsListPath_lll, [:]) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            
        }
    }
    
    //举报用户
    func CCC_reportData_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voicereportsPath_lll, "", params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //拉黑用户
    func CCC_blockUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ dic : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_blockUserPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //任务列表
    func CCC_getRewardList_DDD(_ params : NSDictionary?, _ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_rewardListPath_lll, params!) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //编辑个人信息
    func CCC_editMyInfo_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_editMyInfoPath_lll, "", params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //访客列表
    func CCC_getVisitorList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_victorListPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //充值记录列表
    func CCC_getCoinRecordList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voiceUsersIncomePath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //购买商店产品
    func CCC_buyStorePurchase_DDD(_ params : NSDictionary, _ suc : @escaping (_ str : String?)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_storePurchasePath_lll, "", params) { request in
            suc("")
        } fail: { msg in
            suc(nil)
        }
    }
    
    //搜索用户，赠送礼物用
    func CCC_searchUser_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_storePurchasePath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //钻石记录
    func CCC_getDiamondRecordList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_diamondRecordPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    //获取充值商品列表
    func CCC_getProductList_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_MyCdListPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //获取Banner列表
    func CCC_getWallBannerList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_MyWallBannerPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //钻石兑换金币信息，家族创建费用信息
    func CCC_getWalletConfigData_DDD(_ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_walletConfigPath_lll, [:]) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //兑换金币
    func CCC_exchangeGold_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void, _ fail : @escaping (_ string : String)->Void) {
        _ = kkk_manager_lll.CCC_post_DDD(.kkk_walletExchangePath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //获取背包物品详情
    func CCC_getBackpackInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : [Any])->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_openChestPath_lll, params) { request in
            suc(request as! [Any])
        } fail: { msg in
            suc([])
        }
    }
    
    
    //修改我的个人信息
    func CCC_editMyInfos_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_editAllMyInfoPath_lll, "", params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
        }
    }
    
    //获取家族列表
    func CCC_getFamilyList_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_familyListPath_lll, params) { request in
            suc(((request as! NSDictionary)[kkk_LabelHttpReqRowsLabel_lll]) as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //获取家族详情
    func CCC_getFamilyDetail_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_familyDetail_lll, params) { request in
            suc(request as! NSDictionary)
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //获取家族成员列表
    func CCC_getFamilyMemberList_DDD(_ params : NSDictionary, _ suc : @escaping (_ dics : NSDictionary)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_familyMemberList_lll, params) { request in
            suc((request as! NSDictionary))
        } fail: { msg in
            suc(NSDictionary())
        }
    }
    
    //设置家族信息
    func CCC_setFamilyData_DDD(_ params : NSDictionary, _ suc : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_setFamilyPath_lll, params) { request in
            suc("")
        } fail: { msg in
            if msg.count > 0 {
                suc(msg)
            }else {
                suc("fail")
            }
        }
    }
    
    //反馈
    func CCC_feedBack_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_feedBackPath_lll, "", params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //背包道具状态修改
    func CCC_renewChanged_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_autorenewPath_lll, "", params) { request in
            suc()
        } fail: { msg in
            suc()
        }
    }
    
    //脱下道具
    func CCC_wearProps_DDD(_ params : NSDictionary, _ suc : @escaping ()->Void, _ fail : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_voiceActionUserPath_lll, "", params) { request in
            suc()
        } fail: { msg in
            fail(msg)
        }
    }
    
    //批量获取用户信息
    func CCC_getUsersInfo_DDD(_ params : NSDictionary, _ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_post_DDD(.kkk_umsUserManyPath_lll, "", params) { request in
            suc(request as! NSArray)
        } fail: { msg in
            suc([])
        }
    }
    
    //MARK: ==================== 游戏相关
    //获取游戏列表
    func CCC_getGameList_DDD(_ params : NSDictionary ,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_getShare_DDD(.kkk_PlaysPath_lll, params) { array in
            suc(array as! NSArray)
        }fail: { msg in}
    }
    //获取语聊游戏列表
    func CCC_getVoiceGameList_DDD(_ params : NSDictionary ,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_voicePlayPath_lll, params) { array in
            suc(array as! NSArray)
        }fail: { msg in}
    }
    
    //MARK: ====================网络请求相关
    //取消请求
    func CCC_cancelRequest_DDD() {
        kkk_manager_lll.CCC_cancelRequest_DDD()
    }
    //MARK: ==================== 排行榜相关
    //获取排行信息
    func CCC_getRankListData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray, _ values : Double)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_pubRankPath_lll, params) { req in
            let kkk_dic_lll = (req as! NSDictionary)
            let kkk_array_lll = (kkk_dic_lll[kkk_LabelHttpReqRowsLabel_lll] as? NSArray) ?? []
            let kkk_myMomey_lll = self.CCC_keyDouble_DDD(kkk_dic_lll, kkk_float_amountStr_lll)
            suc(kkk_array_lll, kkk_myMomey_lll)
        }fail: { msg in
            suc([], 0.0)
        }
    }
    func CCC_keyDouble_DDD(_ dic : NSDictionary, _ key : String) -> Double {
        let kkk_array_lll = dic.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (dic.object(forKey: key) ?? "0.0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 0.0
            }
            let kkk_values_lll = Double(kkk_value_lll)
            return kkk_values_lll!
        }
        return 0.0
    }
    
    //获取CP排行信息
    func CCC_getCPRankListData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        kkk_manager_lll.CCC_get_DDD(.kkk_CPRankPath_lll, params) { req in
            let kkk_dic_lll = (req as! NSDictionary)
            let kkk_array_lll = (kkk_dic_lll[kkk_LabelHttpReqRowsLabel_lll] as? NSArray) ?? []
            suc(kkk_array_lll)
        }fail: { msg in
            suc([])
            
        }
    }
    //获取语聊房背景列表/ums/live/bgstore?room_id=1
    func CCC_getBgstoreListData_DDD(_ params : NSDictionary,_ suc : @escaping (_ array : NSArray)->Void) {
        print(params)
        kkk_manager_lll.CCC_get_DDD(.kkk_bgstorePath_lll, params) { req in
            let kkk_dic_lll = (req as! NSDictionary)
            print(kkk_dic_lll)
            let kkk_array_lll = (kkk_dic_lll[kkk_LabelHttpReqRowsLabel_lll] as? NSArray) ?? []
            suc(kkk_array_lll)
        }fail: { msg in
            suc([])
        }
    }
    
    //MARK: ==================== 下载
    //下载数据
    func CCC_downloadData_DDD(_ string : String,_ suc : @escaping (_ string : String)->Void) {
        kkk_manager_lll.CCC_downFile_DDD(string) { req in
            
        } suc: { req in
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_showRechargeNoty_NNN"), object: "MMM_donotHaveCoin_NNN")
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
