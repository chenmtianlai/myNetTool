//
//  AAA_NetModule_BBB.swift
//  Module_Net
//
//  Created by Frankie on 19/05/2025.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
import Alamofire

class AAA_NetModule_BBB: NSObject {
    
    nonisolated(unsafe) static let kkk_net_lll = AAA_net_BBB.kkk_share_lll
    
    
    //初始化下载资源
    class func CCC_loadResources_DDD() {
        _ = AAA_giftDownModel_BBB.kkk_share_lll
    }
    
    //图片缓存，缓存完成后方可展示UI
    class func CCC_downImgRes_DDD(_ image : String, suc:@Sendable @escaping ()->Void) {
        AAA_giftDownModel_BBB.CCC_downImage_DDD(image) {
            suc()
        }
    }
    
    
    //礼物资源下载器,内有进度通知，暂停下载，下载队列，不能换通用下载
    class func CCC_downGiftRes_DDD(_ url : String) {
        AAA_giftDownModel_BBB.kkk_share_lll.CCC_downGiftAni_DDD(url)
    }
    
    
    //数据获取接口，每次请求，放弃上一次请求，再进行下一次请求，已在CCC_getShare_DDD内处理完成
    class func CCC_getShareData_DDD(_ url : AAA_pathModel_BBB, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        var kkk_urls_lll = url.localizedDescription
        if url == .kkk_tipsListPath_lll {
            kkk_urls_lll = kkk_urls_lll + "/13"
        }
        kkk_net_lll.CCC_getShare_DDD(kkk_urls_lll, dic) { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    //取消请求
    class func CCC_cancelRequest_DDD() {
        kkk_net_lll.kkk_requestShare_lll?.cancel()
    }
    
    //get请求
    class func CCC_getData_DDD(_ url : AAA_pathModel_BBB, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) -> DataRequest {
        var kkk_urls_lll = url.localizedDescription
        if url == .kkk_tipsListPath_lll {
            kkk_urls_lll = kkk_urls_lll + "/13"
        }
        let kkk_request_lll = kkk_net_lll.CCC_get_DDD(kkk_urls_lll, dic) { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
        return kkk_request_lll
    }
    
    
    
    
    //post请求
    class func CCC_postData_DDD(_ url : AAA_pathModel_BBB, name last : String? = "", _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        kkk_net_lll.CCC_post_DDD(url.localizedDescription + last!, dic) { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //下载
    class func CCC_downData_DDD(_ url : String, _ suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        kkk_net_lll.CCC_downFile_DDD(url) { req in
            
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //上传data
    class func CCC_updateData_DDD(_ data : Data, _ suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        kkk_net_lll.CCC_updatesData_DDD(data) { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //上传image
    class func CCC_updateImage_DDD(_ image : UIImage, _ suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        kkk_net_lll.CCC_updates_DDD(image) { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //上传image，带进度
    class func CCC_updateImage_DDD(_ image : UIImage, gress:@Sendable @escaping (_ req : Double)->Void, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        kkk_net_lll.CCC_updates_DDD(image) { req in
            gress(req)
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    

    //当前网络状态
    class func CCC_netState_DDD(suc:@Sendable @escaping ()->Void, fail:@Sendable @escaping ()->Void) {
        kkk_net_lll.CCC_netSta_DDD {
            AAA_netOutModel_BBB.kkk_net_lll = true
            suc()
        } fail: {
            AAA_netOutModel_BBB.kkk_net_lll = false
            fail()
        }
    }
    
    
    //接口枚举
    enum AAA_pathModel_BBB: String {
        case kkk_UpDateImagePath_lll
        case kkk_logOutPath_lll
        case kkk_videoCallPath_lll
        case kkk_stopVideoCallPath_lll
        case kkk_acceptVideoCallPath_lll
        case kkk_refreshRtmTokenPath_lll
        case kkk_sendPresentForUserPath_lll
        case kkk_followUserPath_lll
        case kkk_editMyInfoPath_lll
        case kkk_editAllMyInfoPath_lll
        case kkk_feedBackPath_lll
        case kkk_deleteMyAccountPath_lll
        case kkk_CheckStatusPath_lll
        case kkk_HoldCallingPath_lll
        case kkk_vioListPath_lll
        case kkk_vioJoinPlayPath_lll
        case kkk_voiUserListPth_lll
        case kkk_PlaysPath_lll
        case kkk_reloadRTCToken_lll
        case kkk_umsUserManyPath_lll
        case kkk_MyWallBannerPath_lll
        case kkk_vioUserInfoPath_lll
        case kkk_MyCdListPath_lll
        case kkk_MyBlackListPath_lll
        case kkk_NotifiListPath_lll
        case kkk_PresentListPath_lll
        case kkk_voiceGiftPath_lll
        case kkk_CheckIAPStatusPath_lll
        case kkk_SearchUserPath_lll
        case kkk_UserChatInfoPath_lll
        case kkk_CallCenterInfoPath_lll
        case kkk_checkChatCountPath_lll
        case kkk_UnlockChatPath_lll
        case kkk_RecommendAppPath_lll
        case kkk_userActionsPath_lll
        case kkk_MsgCallListPath_lll
        case kkk_MatchLabsPath_lll
        case kkk_HomeFirstChargePath_lll
        case kkk_callEvalLabel_lll
        case kkk_callEvalAnchor_lll
        case kkk_voiceListPath_lll
        case kkk_checkVoicePath_lll
        case kkk_voiceroomStartPath_lll
        case kkk_voiceInfoChangesPath_lll
        case kkk_voicePlayPath_lll
        case kkk_voicesendGiftPath_lll
        case kkk_voicesitsPath_lll
        case kkk_voiceMusicPath_lll
        case kkk_voiceLoveMusicPath_lll
        case kkk_voiceMusicPlayPath_lll
        case kkk_voicekickUserPath_lll
        case kkk_voicereportsPath_lll
        case kkk_voicePlayListPath_lll
        case kkk_voiceDataDetailPath_lll
        case kkk_voiceAnimationStorePath_lll
        case kkk_voiceActionUserPath_lll
        case kkk_mineMyAnimationPath_lll
        case kkk_leveInfoPath_lll
        case kkk_voiceUsersIncomePath_lll
        case kkk_searchMusic_lll
        case kkk_tipsListPath_lll
        case kkk_countryListPath_lll
        case kkk_diamondRecordPath_lll
        case kkk_victorListPath_lll
        case kkk_rewardListPath_lll
        case kkk_autorenewPath_lll
        case kkk_emojiListPath_lll
        case kkk_voiceOrNotifyInfoPath_lll
        case kkk_setAdminPath_lll
        case kkk_userPropsPath_lll
        case kkk_openChestPath_lll
        case kkk_walletExchangePath_lll
        case kkk_homeTaskShowPath_lll
        case kkk_umsUserStartatus_lll
        case kkk_umsUserGiftcount_lll
        case kkk_omswallettransfer_lll
        case kkk_rankListPath_lll
        case kkk_pubRankPath_lll
        case kkk_umsUserPhoto_lll
        case kkk_CPListPath_lll
        case kkk_CPRankPath_lll
        case kkk_sysConfigPath_lll
        case kkk_familyListPath_lll
        case kkk_createFamilyPath_lll
        case kkk_familyDetail_lll
        case kkk_setFamilyPath_lll
        case kkk_familyMemberList_lll
        case kkk_inviteFamilyPath_lll
        case kkk_umsfamilyinteractivemessages_lll
        case kkk_umsfamilyinvitecheck_lll
        case kkk_inviteJoinVideoChat_lll
        case kkk_UserDetailProfilePath_lll
        case kkk_blockUserPath_lll
        case kkk_storePurchasePath_lll
        case kkk_fansListPath_lll
        case kkk_followListPath_lll
        case kkk_umsUserWall_lll
        case kkk_backpackOtherPath_lll
        case kkk_sendBagGiftPath_lll
        case kkk_roomBanner_lll
        case kkk_walletConfigPath_lll
        case kkk_TranslateMessagePath_lll
        case kkk_showInvitePath_lll
        case kkk_callListPath_lll
        case kkk_pkRankPath_lll
        case kkk_pilotPath_lll
        case kkk_downPath_lll
        case kkk_loginPath_lll
        
        var localizedDescription: String {
            switch self {
            case .kkk_UpDateImagePath_lll:
                return "sys/resource/upload"
            case .kkk_logOutPath_lll:
                return "ums/auth/signout"
            case .kkk_videoCallPath_lll:
                return "oms/call"
            case .kkk_stopVideoCallPath_lll:
                return "oms/call/hangup"
            case .kkk_acceptVideoCallPath_lll:
                return "oms/call/accept"
            case .kkk_refreshRtmTokenPath_lll:
                return "ums/auth/refreshrtmtoken"
            case .kkk_sendPresentForUserPath_lll:
                return "oms/gift/send"
            case .kkk_followUserPath_lll:
                return "ums/user/follow"
            case .kkk_editMyInfoPath_lll:
                return "ums/usercenter/edit"
            case .kkk_editAllMyInfoPath_lll:
                return "ums/usercenter/fulledit"
            case .kkk_feedBackPath_lll:
                return "ums/user/feedback"
            case .kkk_deleteMyAccountPath_lll:
                return "ums/user/decase .eaccount"
            case .kkk_CheckStatusPath_lll:
                return "sys/speedduration"
            case .kkk_HoldCallingPath_lll:
                return "oms/call/ping"
            case .kkk_vioListPath_lll:
                return "ums/live/list"
            case .kkk_vioJoinPlayPath_lll:
                return "ums/live/action"
            case .kkk_voiUserListPth_lll:
                return "ums/live/members"
            case .kkk_PlaysPath_lll:
                return "ums/live/gamelist"
            case .kkk_reloadRTCToken_lll:
                return "ums/live/rtctoken"
            case .kkk_umsUserManyPath_lll:
                return "ums/user/many"
            case .kkk_MyWallBannerPath_lll:
                return "ums/banner"
            case .kkk_vioUserInfoPath_lll:
                return "ums/live/member"
            case .kkk_MyCdListPath_lll:
                return "oms/v2product"
            case .kkk_MyBlackListPath_lll:
                return "ums/user/blocklist"
            case .kkk_NotifiListPath_lll:
                return "ums/notify"
            case .kkk_PresentListPath_lll:
                return "oms/gifts"
            case .kkk_voiceGiftPath_lll:
                return "v2/oms/gifts"
            case .kkk_CheckIAPStatusPath_lll:
                return "oms/pay/apple"
            case .kkk_SearchUserPath_lll:
                return "ums/user/searchbynicknameorid"
            case .kkk_UserChatInfoPath_lll:
                return "ums/user/improfile"
            case .kkk_CallCenterInfoPath_lll:
                return "ums/user/customercontact"
            case .kkk_checkChatCountPath_lll:
                return "ums/user/checkchat"
            case .kkk_UnlockChatPath_lll:
                return "ums/user/purchasechat"
            case .kkk_RecommendAppPath_lll:
                return "sys/appdw"
            case .kkk_userActionsPath_lll:
                return "ums/user/action"
            case .kkk_MsgCallListPath_lll:
                return "oms/call/record"
            case .kkk_MatchLabsPath_lll:
                return "ums/user/wallfilter"
            case .kkk_HomeFirstChargePath_lll:
                return "oms/product/firstcharge"
            case .kkk_callEvalLabel_lll:
                return "oms/call/tag"
            case .kkk_callEvalAnchor_lll:
                return "oms/call/review"
            case .kkk_voiceListPath_lll:
                return "ums/live/chatroom/list"
            case .kkk_checkVoicePath_lll:
                return "ums/live/chatroom/beforestart"
            case .kkk_voiceroomStartPath_lll:
                return "v2/ums/live/start"
            case .kkk_voiceInfoChangesPath_lll:
                return "ums/live/update"
            case .kkk_voicePlayPath_lll:
                return "v2/ums/live/gamelist"
            case .kkk_voicesendGiftPath_lll:
                return "v2/oms/gift/send"
            case .kkk_voicesitsPath_lll:
                return "ums/live/chatroom/action"
            case .kkk_voiceMusicPath_lll:
                return "ums/live/musiclist"
            case .kkk_voiceLoveMusicPath_lll:
                return "ums/live/favoritesmusic"
            case .kkk_voiceMusicPlayPath_lll:
                return "ums/live/actionmusic"
            case .kkk_voicekickUserPath_lll:
                return "ums/live/kickuser"
            case .kkk_voicereportsPath_lll:
                return "v2/ums/report"
            case .kkk_voicePlayListPath_lll:
                return "ums/game/flow/statistics"
            case .kkk_voiceDataDetailPath_lll:
                return "v2/ums/game/flow/statistics/detail"
            case .kkk_voiceAnimationStorePath_lll:
                return "oms/props/store"
            case .kkk_voiceActionUserPath_lll:
                return "oms/props/action"
            case .kkk_mineMyAnimationPath_lll:
                return "oms/props/my"
            case .kkk_leveInfoPath_lll:
                return "ums/user/level/benefits"
            case .kkk_voiceUsersIncomePath_lll:
                return "oms/walcase ./record"
            case .kkk_searchMusic_lll:
                return "ums/live/music/search"
            case .kkk_tipsListPath_lll:
                return "sys/label"
            case .kkk_countryListPath_lll:
                return "ums/live/filter"
            case .kkk_diamondRecordPath_lll:
                return "oms/money/record"
            case .kkk_victorListPath_lll:
                return "ums/visit/visitedmy"
            case .kkk_rewardListPath_lll:
                return "oms/promo/getPromoList"
            case .kkk_autorenewPath_lll:
                return "oms/props/autorenew"
            case .kkk_emojiListPath_lll:
                return "ums/chat/emojis"
            case .kkk_voiceOrNotifyInfoPath_lll:
                return "ums/live"
            case .kkk_setAdminPath_lll:
                return "ums/live/admin"
            case .kkk_userPropsPath_lll:
                return "ums/user/props"
            case .kkk_openChestPath_lll:
                return "oms/prize/box"
            case .kkk_walletExchangePath_lll:
                return "oms/wallet/exchange"
            case .kkk_homeTaskShowPath_lll:
                return "oms/promo/getPromoCanOffer"
            case .kkk_umsUserStartatus_lll:
                return "ums/user/livestatus"
            case .kkk_umsUserGiftcount_lll:
                return "ums/user/giftcount"
            case .kkk_omswallettransfer_lll:
                return "oms/wallet/transfer"
            case .kkk_rankListPath_lll:
                return "ums/live/rankmembers"
            case .kkk_pubRankPath_lll:
                return "ums/live/commonranklist"
            case .kkk_umsUserPhoto_lll:
                return "ums/user/photo"
            case .kkk_CPListPath_lll:
                return "ums/user/cprelation"
            case .kkk_CPRankPath_lll:
                return "ums/user/cprank"
            case .kkk_sysConfigPath_lll:
                return "sys/client/conf"
            case .kkk_familyListPath_lll:
                return "ums/family/list"
            case .kkk_createFamilyPath_lll:
                return "ums/family/save"
            case .kkk_familyDetail_lll:
                return "ums/family/info"
            case .kkk_setFamilyPath_lll:
                return "ums/family/action"
            case .kkk_familyMemberList_lll:
                return "ums/family/mem"
            case .kkk_inviteFamilyPath_lll:
                return "ums/family/inviteuser"
            case .kkk_umsfamilyinteractivemessages_lll:
                return "ums/family/interactivemessages"
            case .kkk_umsfamilyinvitecheck_lll:
                return "ums/family/invitecheck"
            case .kkk_inviteJoinVideoChat_lll:
                return "ums/live/invite"
            case .kkk_UserDetailProfilePath_lll:
                return "ums/user/v2profile"
            case .kkk_blockUserPath_lll:
                return "v2/ums/user/block"
            case .kkk_storePurchasePath_lll:
                return "oms/props/store/purchase"
            case .kkk_fansListPath_lll:
                return "ums/user/followerlist"
            case .kkk_followListPath_lll:
                return "ums/user/followlist"
            case .kkk_umsUserWall_lll:
                return "ums/user/wall"
            case .kkk_backpackOtherPath_lll:
                return "oms/props/backpack"
            case .kkk_sendBagGiftPath_lll:
                return "oms/props/sent"
            case .kkk_roomBanner_lll:
                return "ums/live/banner"
            case .kkk_walletConfigPath_lll:
                return "oms/money/conf"
            case .kkk_TranslateMessagePath_lll:
                return "sys/translate"
            case .kkk_showInvitePath_lll:
                return "ums/user/v2action"
            case .kkk_callListPath_lll:
                return "oms/call/record"
            case .kkk_pkRankPath_lll:
                return "ums/live/link/rank"
            case .kkk_pilotPath_lll:
                return "ums/live/chatroom/pilot"
            case .kkk_downPath_lll:
                return "sys/resource/static"
            case .kkk_loginPath_lll:
                return "ums/auth/fastsigninbythirdparty"
            }
        }
    }
}
    



extension NSObject{
    
    // FUNCMARK
    func CCC_codableToJsonString_DDD() -> String {
 
        let kkk_encoder_lll = JSONEncoder()
        kkk_encoder_lll.outputFormatting = .prettyPrinted
        if let kkk_codeSelf_lll = self as? Codable {
            let kkk_data_lll = try? kkk_encoder_lll.encode(kkk_codeSelf_lll)
            return String(data: kkk_data_lll ?? Data(), encoding: .utf8) ?? ""
        } else {
            return ""
        }
    }
    func CCC_toJSONString_DDD() -> String {
        if JSONSerialization.isValidJSONObject(self) {
            do {
                let kkk_jsonData_lll: Data
                kkk_jsonData_lll = try JSONSerialization.data(withJSONObject: self, options: [])
                return String(data: kkk_jsonData_lll, encoding: .utf8) ?? ""
            } catch {
            }
        }
        return ""
    }
    
}
