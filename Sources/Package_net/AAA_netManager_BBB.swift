//
//  AAA_netManager_BBB.swift
//  Package_net
//
//  Created by Frankie on 28/08/2025.
//

import UIKit
import Alamofire
import SDWebImage

class AAA_netManager_BBB {
    
    
    //负责监听网络变化
    let kkk_netManager_lll = NetworkReachabilityManager()
    
    //共享请求，同时只存在一个，防止多个请求返回导致数据错乱
    var kkk_requestShare_lll : DataRequest!
    //共享下载请求，同时只存在一个，防止多个请求返回导致数据错乱
    var kkk_downShare_lll : Session!
    //当前下载的URL
    var kkk_nowDownUrl_lll = ""
    
    //个人中心上传相册，分别保存，独立上传及取消
    var kkk_request1_lll : DataRequest!
    var kkk_request2_lll : DataRequest!
    var kkk_request3_lll : DataRequest!
    
    
    
    //加密公钥
    nonisolated(unsafe) static var kkk_publicKey_lll = ""
    //加密指纹
    nonisolated(unsafe) static var kkk_fingerprint_lll = ""
    //加密本地字符串
    nonisolated(unsafe) static var kkk_signKey_lll = ""
    //域名
    nonisolated(unsafe) static var kkk_baseUrl_lll = ""
    //用户token
    nonisolated(unsafe) static var kkk_token_lll = ""
    //包名
    nonisolated(unsafe) static var kkk_myAppHeaderName_lll = ""
    //渠道
    nonisolated(unsafe) static var kkk_myAppLocalName_lll = ""
    //系统版本
    nonisolated(unsafe) static var kkk_deviceVersion_lll = ""
    
    
    init() {
        
        let kkk_configuration_lll = URLSessionConfiguration.default
        kkk_configuration_lll.timeoutIntervalForRequest = 60
        kkk_configuration_lll.httpMaximumConnectionsPerHost = 5
        kkk_configuration_lll.requestCachePolicy = .reloadIgnoringLocalCacheData
        kkk_downShare_lll = Session(configuration: kkk_configuration_lll)
    }
    
}
//--MARK: 请求
extension AAA_netManager_BBB {
    func CCC_request_DDD(_ url : AAA_pathModel_BBB,
                         _ method : HTTPMethod,
                         _ params : NSDictionary,
                         _ suc:@escaping (_ request : Any)->Void,
                         _ fail:@escaping (_ msg : Any)->Void) -> DataRequest {
        
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        if method == .get {
            kkk_headerDic_lll["Signature-Value"] = AAA_RSASign_BBB.CCC_getCrypto_DDD(params, url.localizedDescription)
        }else if method == .post {
            kkk_headerDic_lll["Signature-Value"] = AAA_RSASign_BBB.CCC_postCrypto_DDD(params, url.localizedDescription)
        }
        kkk_headerDic_lll["Authorization"] = AAA_netManager_BBB.kkk_token_lll
        let kkk_urls_lll = AAA_netManager_BBB.kkk_baseUrl_lll + url.localizedDescription
        let kkk_request_lll = AF.request(kkk_urls_lll,method: method,parameters: (params as! Parameters),headers: kkk_headerDic_lll) { requests in
            requests.timeoutInterval = 10
        }
        kkk_request_lll.responseData { response in
            switch response.result {
            case let .success(data):
                do {
                    let kkk_json_lll = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    let kkk_dic_lll = kkk_json_lll as! Dictionary<String, Any>
                    if kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                        suc(kkk_dic_lll[kkk_apiData_lll] as Any)
                    }else if kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 1 {
                        fail(kkk_dic_lll[kkk_msgStr_lll] as! String)
                    }else if (kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 2 || kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 4) {
                        AAA_netOutModel_BBB.CCC_postLogoutNoty_DDD()
                        fail(kkk_dic_lll[kkk_msgStr_lll] as! String)
                    }else if kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 3 && url != .kkk_walletExchangePath_lll {
                        AAA_netOutModel_BBB.CCC_showRechargeNoty_DDD()
                        fail("")
                    }else if kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 10 {
                        fail(((kkk_dic_lll as [String : Any]).CCC_toJson_DDD()))
                    }else{
                        fail(kkk_dic_lll[kkk_msgStr_lll] as! String)
                    }
                } catch _ {
                    fail("")
                }
            case .failure(_):
                fail("")
            }
        }
        return kkk_request_lll
    }
    
    //get
    func CCC_get_DDD(_ url : AAA_pathModel_BBB, _ dic : NSDictionary, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        _ = CCC_request_DDD(url, .get, dic, { request in
            suc(request)
        }, { msg in
            fail(msg as! String)
        })
    }
    
    //get share
    func CCC_getShare_DDD(_ url : AAA_pathModel_BBB, _ dic : NSDictionary, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        kkk_requestShare_lll?.cancel()
        kkk_requestShare_lll = nil
        kkk_requestShare_lll = CCC_request_DDD(url, .get, dic, { request in
            suc(request)
        }, { msg in
            fail(msg as! String)
        })
    }
    
    //post
    func CCC_post_DDD(_ url : AAA_pathModel_BBB, _ name : String? = "", _ dic : NSDictionary, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        _ = CCC_request_DDD(url, .post, dic, { request in
            suc(request)
        }, { msg in
            fail(msg as! String)
        })
    }
    
    //update
    func CCC_updateData_DDD(_ name : String, _ data : Data, _ type : String, _ bool : Bool? = false, gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) -> DataRequest? {
        let kkk_url_lll = AAA_netManager_BBB.kkk_baseUrl_lll + "sys/resource/upload"
        
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        let kkk_params_lll = NSMutableDictionary()
        kkk_params_lll.setObject(type, forKey: kkk_typeLabel_lll as NSCopying)
        if bool == true {
            kkk_params_lll.setObject(1, forKey: kkk_reviewStr_lll as NSCopying)
        }
        kkk_headerDic_lll["Signature-Value"] = AAA_RSASign_BBB.CCC_postCrypto_DDD(kkk_params_lll, "sys/resource/upload")
        kkk_headerDic_lll["Authorization"] = AAA_netManager_BBB.kkk_token_lll
        let kkk_req_lll = AF.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append((type.data(using:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!), withName: kkk_typeLabel_lll)
            if type == "1" {
                MultipartFormData.append(data as Data, withName: "file", fileName: name, mimeType: "image/png")
                if bool == true {
                    MultipartFormData.append(("1".data(using:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!), withName: kkk_reviewStr_lll)
                }
            }else {
                MultipartFormData.append(data, withName: "file", fileName: name, mimeType: "video/mp4")
            }
        }, to: kkk_url_lll, method: .post, headers: kkk_headerDic_lll).uploadProgress(closure: { progress in
            let percentComplete = progress.fractionCompleted
            gress(percentComplete)
        }).responseData { response in
            switch response.result {
            case let .success(data):
                do {
                    let kkk_json_lll = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    let kkk_dic_lll = kkk_json_lll as! Dictionary<String, Any>
                    
                    if kkk_dic_lll[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                        suc(kkk_dic_lll[kkk_apiData_lll] as Any)
                    }else{
                        fail(kkk_dic_lll[kkk_msgStr_lll] as! String)
                    }
                } catch _ {
                    fail("")
                }
            case .failure(_):
                fail("")
            }
        }
        return kkk_req_lll
    }
    func CCC_updates_DDD(_ img : UIImage, _ type : Int, gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        let kkk_name_lll = "MMM_attach_NNN.png"
        let kkk_data_lll = img.jpegData(compressionQuality: 0.1)! as Data
        let kkk_req_lll = CCC_updateData_DDD(kkk_name_lll, kkk_data_lll, "1") { req in
            gress(req)
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
        if type == 1 {
            kkk_request1_lll?.cancel()
            kkk_request1_lll = nil
            kkk_request1_lll = kkk_req_lll
        }else if type == 2 {
            kkk_request2_lll?.cancel()
            kkk_request2_lll = nil
            kkk_request2_lll = kkk_req_lll
        }else if type == 3 {
            kkk_request3_lll?.cancel()
            kkk_request3_lll = nil
            kkk_request3_lll = kkk_req_lll
        }
    }
    func CCC_updateImage1_DDD(_ img : UIImage, gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        CCC_updates_DDD(img, 1) { req in
            gress(req)
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    func CCC_updateImage2_DDD(_ img : UIImage, gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        CCC_updates_DDD(img, 2) { req in
            gress(req)
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    func CCC_updateImage3_DDD(_ img : UIImage, gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        CCC_updates_DDD(img, 3) { req in
            gress(req)
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    func CCC_calcelReq1_DDD() {
        kkk_request1_lll?.cancel()
        kkk_request1_lll = nil
    }
    func CCC_calcelReq2_DDD() {
        kkk_request2_lll?.cancel()
        kkk_request2_lll = nil
    }
    func CCC_calcelReq3_DDD() {
        kkk_request3_lll?.cancel()
        kkk_request3_lll = nil
    }
    func CCC_cancelRequest_DDD() {
        kkk_requestShare_lll?.cancel()
    }
    func CCC_updatesVideoData_DDD(_ data : Data, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        let kkk_name_lll = "MMM_attach_NNN.mp4"
        _ = CCC_updateData_DDD(kkk_name_lll, data, "2") { req in
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    func CCC_updateImage_DDD(_ data : Data, _ bool : Bool? = false, gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : Any)->Void, fail:@escaping (_ msg : String)->Void) {
        let kkk_name_lll = "MMM_attach_NNN.mp4"
        _ = CCC_updateData_DDD(kkk_name_lll, data, "1", bool) { req in
            gress(req)
        } suc: { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    
    //down
    func CCC_downShare_DDD(_ url : String, suc:@escaping ()->Void, fail:@escaping ()->Void) {
        if url.count == 0 {
            AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(url, ["kkk_type_lll":"0"])
            fail()
            return
        }
        kkk_nowDownUrl_lll = url
        let kkk_destination_lll = DownloadRequest.suggestedDownloadDestination(for: .cachesDirectory)
        let kkk_url_lll = URL(string: url as String)!
        let kkk_urls_lll = URLRequest(url: kkk_url_lll)
        
        let kkk_pathway_lll = NSHomeDirectory().appending("/Library/Caches/") + kkk_url_lll.lastPathComponent
        let kkk_manager_lll = FileManager()
        if !kkk_manager_lll.fileExists(atPath: kkk_pathway_lll) {
            kkk_downShare_lll.cancelAllRequests()
            kkk_downShare_lll.download(kkk_urls_lll,to: kkk_destination_lll).downloadProgress { progress in
                let kkk_gressed_lll = Double(progress.fractionCompleted)
                AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(url, ["kkk_type_lll":"2","kkk_gressed_lll" : kkk_gressed_lll])
            }.response { response in
                switch response.result {
                case .success(_):
                    suc()
                    AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(url, ["kkk_type_lll":"0"])
                    let kkk_pathway_lll = NSHomeDirectory() + "/Library/Caches/" + kkk_urls_lll.url!.lastPathComponent
                    AAA_netOutModel_BBB.CCC_downResourceSucNoty_DDD(url)
                case .failure(_):
                    fail()
                    if self.kkk_nowDownUrl_lll == url {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(url, ["kkk_type_lll":"0"])
                        }
                    }
                }
            }
        }else{
            DispatchQueue.main.async {
                AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(url, ["kkk_type_lll":"0"])
            }
            suc()
        }
    }
    func CCC_SDDownImage_DDD(_ string : String, _ down:@escaping ()->Void, fail:@escaping ()->Void?) {
        SDWebImageManager.shared.loadImage(with: URL(string: string)) { state, error, url in
            
        } completed: { image, data, error, cacheType, finished, url in
            if image != nil {
                down()
            }else {
                fail()
            }
        }
    }
    func CCC_downFile_DDD(_ urlStr : String,_ gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : String)->Void, fail:@escaping (_ msg : String)->Void) {
        if urlStr.count == 0 {
            fail("")
            return
        }
        let kkk_destination_lll = DownloadRequest.suggestedDownloadDestination(for: .cachesDirectory)
        let kkk_url_lll = URL(string: urlStr as String)!
        let kkk_urls_lll = URLRequest(url: kkk_url_lll)
        
        let kkk_pathway_lll = NSHomeDirectory().appending("/Library/Caches/") + kkk_url_lll.lastPathComponent
        let kkk_manager_lll = FileManager()
        if !kkk_manager_lll.fileExists(atPath: kkk_pathway_lll) {
            AF.download(kkk_urls_lll,to: kkk_destination_lll).downloadProgress { progress in
                let kkk_gressed_lll = Double(progress.fractionCompleted)
                gress(kkk_gressed_lll)
            }.response { response in
                switch response.result {
                case .success(_):
                    let kkk_pathway_lll = NSHomeDirectory() + "/Library/Caches/" + kkk_urls_lll.url!.lastPathComponent
                    AAA_netOutModel_BBB.CCC_downResourceSucNoty_DDD(urlStr)
                    suc(kkk_pathway_lll)
                case .failure(_):
                    fail("")
                }
            }
            
        }else{
            suc(kkk_pathway_lll)
        }
    }
    
    
    
}
//--MARK: 网络监听
extension AAA_netManager_BBB {
    
    func CCC_netSta_DDD(suc:@escaping ()->Void, fail:@escaping ()->Void) {
        kkk_netManager_lll?.startListening(onUpdatePerforming: { status in
            switch status {
            case .reachable(_):
                suc()
            default:
                fail()
            }
        })
    }
    func CCC_netState_DDD(suc:@escaping ()->Void, fail:@escaping ()->Void) {
        CCC_netSta_DDD {
            AAA_netOutModel_BBB.kkk_net_lll = true
            suc()
        } fail: {
            AAA_netOutModel_BBB.kkk_net_lll = false
            fail()
        }
    }
    
}
//--MARK: 参数
extension AAA_netManager_BBB {
    
    
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
        case kkk_clubPath_lll
        case kkk_createClubPath_lll
        case kkk_groupActionPath_lll
        case kkk_processActionPath_lll
        case kkk_groupInfoPath_lll
        case kkk_groupLibraryPath_lll
        case kkk_addAlbumPath_lll
        case kkk_groupUsersPath_lll
        case kkk_groupUpdatePath_lll
        case kkk_changeAlbumPath_lll
        case kkk_chatAlbumPath_lll
        case kkk_uploadVideoPath_lll
        case kkk_saveUrlPath_lll
        case kkk_bgstorePath_lll
        
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
                return "ums/user/deleteaccount"
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
                return "oms/wallet/record"
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
                return "ums/notify/interaction"
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
            case .kkk_clubPath_lll:
                return "ums/group/list"
            case .kkk_createClubPath_lll:
                return "ums/group/save"
            case .kkk_groupActionPath_lll:
                return "ums/group/action"
            case .kkk_processActionPath_lll:
                return "ums/notify/interaction/action"
            case .kkk_groupInfoPath_lll:
                return "ums/group/fandom"
            case .kkk_groupLibraryPath_lll:
                return "ums/group/albums"
            case .kkk_addAlbumPath_lll:
                return "ums/group/album"
            case .kkk_groupUsersPath_lll:
                return "ums/group/memberlist"
            case .kkk_groupUpdatePath_lll:
                return "ums/group/update"
            case .kkk_changeAlbumPath_lll:
                return "ums/group/album/action"
            case .kkk_chatAlbumPath_lll:
                return "ums/group/album/media"
            case .kkk_uploadVideoPath_lll:
                return "sys/aws/sts"
            case .kkk_saveUrlPath_lll:
                return "sys/resource/save"
            case .kkk_bgstorePath_lll:
                return "ums/live/bgstore"
            }
        }
    }
    
    func CCC_getRequestHeaderDic_DDD() -> HTTPHeaders {
        let kkk_myUuid_lll = AAA_UdidModel_BBB.kkk_share_lll.kkk_uuid_lll
        let kkk_packageVersion_lll = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let kkk_languageCode_lll = Locale.preferredLanguages.first
        let kkk_arr_lll = kkk_languageCode_lll?.components(separatedBy: "-")
        let kkk_language_lll : String = (kkk_arr_lll?.first!)!
        let kkk_dic_lll : HTTPHeaders = [
            kkk_afnHeaderUUStr_lll : kkk_myUuid_lll,
            kkk_afnHeaderTypeStr_lll : "iOS",
            kkk_afnHeaderVersionStr_lll : AAA_netManager_BBB.kkk_deviceVersion_lll,
            kkk_afnHeaderNameStr_lll : AAA_netManager_BBB.kkk_myAppHeaderName_lll,
            kkk_afnHeaderPVStr_lll : kkk_packageVersion_lll!.replacingOccurrences(of: ".", with: ""),
            kkk_afnHeaderPVNStr_lll : Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String,
            kkk_afnHeaderDLangStr_lll : kkk_language_lll,
            kkk_afnHeaderLangStr_lll : kkk_language_lll,
            kkk_afnHeaderModelStr_lll : CCC_getDeviceModelName_DDD(),
            kkk_afnHeaderChaStr_lll : AAA_netManager_BBB.kkk_myAppLocalName_lll,
    //        "HeaderCodeVersion" : "version37",
            kkk_VProxyStr_lll : CCC_openVpn_DDD(),
        ]
        return kkk_dic_lll
    }
    func CCC_getDeviceModelName_DDD() -> String {
        var kkk_strs_lll = utsname()
        uname(&kkk_strs_lll);
        let kkk_machineMirror_lll = Mirror(reflecting: kkk_strs_lll.machine)
        let kkk_str_lll = kkk_machineMirror_lll.children.reduce("") {kkk_str_lll, element  in
            guard let kkk_value_lll = element.value as? Int8, kkk_value_lll != 0 else {
                return kkk_str_lll
            }
            return kkk_str_lll + String(UnicodeScalar(UInt8(kkk_value_lll)))
        }
        if (kkk_str_lll.elementsEqual("iPhone5,1")){return "iPhone 5"}
        else if (kkk_str_lll.elementsEqual("iPhone5,2")){return "iPhone 5c"}
        else if (kkk_str_lll.elementsEqual("iPhone5,3")){return "iPhone 5c"}
        else if (kkk_str_lll.elementsEqual("iPhone5,4")){return "iPhone 5c"}
        else if (kkk_str_lll.elementsEqual("iPhone6,1")){return "iPhone 5s"}
        else if (kkk_str_lll.elementsEqual("iPhone6,2")){return "iPhone 5s"}
        else if (kkk_str_lll.elementsEqual("iPhone7,1")){return "iPhone 6p"}
        else if (kkk_str_lll.elementsEqual("iPhone7,2")){return "iPhone 6"}
        else if (kkk_str_lll.elementsEqual("iPhone8,1")){return "iPhone 6s"}
        else if (kkk_str_lll.elementsEqual("iPhone8,2")){return "iPhone 6s"}
        else if (kkk_str_lll.elementsEqual("iPhone8,4")){return "iPhone se"}
        else if (kkk_str_lll.elementsEqual("iPhone9,1")){return "iPhone 7"}
        else if (kkk_str_lll.elementsEqual("iPhone9,2")){return "iPhone 7p"}
        else if (kkk_str_lll.elementsEqual("iPhone9,3")){return "iPhone 7"}
        else if (kkk_str_lll.elementsEqual("iPhone9,4")){return "iPhone 7p"}
        else if (kkk_str_lll.elementsEqual("iPhone10,1")){return "iPhone 8"}
        else if (kkk_str_lll.elementsEqual("iPhone10,2")){return "iPhone 8p"}
        else if (kkk_str_lll.elementsEqual("iPhone10,3")){return "iPhone x"}
        else if (kkk_str_lll.elementsEqual("iPhone10,4")){return "iPhone 8"}
        else if (kkk_str_lll.elementsEqual("iPhone10,5")){return "iPhone 8p"}
        else if (kkk_str_lll.elementsEqual("iPhone10,6")){return "iPhone x"}
        else if (kkk_str_lll.elementsEqual("iPhone11,2")){return "iPhone xs"}
        else if (kkk_str_lll.elementsEqual("iPhone11,4")){return "iPhone xs max"}
        else if (kkk_str_lll.elementsEqual("iPhone11,6")){return "iPhone xs max"}
        else if (kkk_str_lll.elementsEqual("iPhone11,8")){return "iPhone xr"}
        else if (kkk_str_lll.elementsEqual("iPhone12,1")){return "iPhone 11"}
        else if (kkk_str_lll.elementsEqual("iPhone12,3")){return "iPhone 11p"}
        else if (kkk_str_lll.elementsEqual("iPhone12,5")){return "iPhone 11p max"}
        else if (kkk_str_lll.elementsEqual("iPhone12,8")){return "iPhone se 2end"}
        else if (kkk_str_lll.elementsEqual("iPhone13,1")){return "iPhone 12 mini"}
        else if (kkk_str_lll.elementsEqual("iPhone13,2")){return "iPhone 12"}
        else if (kkk_str_lll.elementsEqual("iPhone13,3")){return "iPhone 12p"}
        else if (kkk_str_lll.elementsEqual("iPhone13,4")){return "iPhone 12p"}
        else if (kkk_str_lll.elementsEqual("iPhone14,2")){return "iPhone 13p"}
        else if (kkk_str_lll.elementsEqual("iPhone14,3")){return "iPhone 13p max"}
        else if (kkk_str_lll.elementsEqual("iPhone14,4")){return "iPhone 13 mini"}
        else if (kkk_str_lll.elementsEqual("iPhone14,5")){return "iPhone 13"}
        else if (kkk_str_lll.elementsEqual("iPhone14,7")){return "iPhone 14"}
        else if (kkk_str_lll.elementsEqual("iPhone14,8")){return "iPhone 14 plus"}
        else if (kkk_str_lll.elementsEqual("iPhone15,2")){return "iPhone 14 pro"}
        else if (kkk_str_lll.elementsEqual("iPhone15,3")){return "iPhone 14 pro max"}
        else if (kkk_str_lll.elementsEqual("iPad6.7")){return "iPad pro (12.9-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad6.8")){return "iPad pro (12.9-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad6.3")){return "iPad pro (9.7-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad6.4")){return "iPad pro (9.7-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad7.1")){return "iPad pro (12.9-inch) 2nd"}
        else if (kkk_str_lll.elementsEqual("iPad7.2")){return "iPad pro (12.9-inch) 2nd"}
        else if (kkk_str_lll.elementsEqual("iPad7.3")){return "iPad pro (10.5-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad7.4")){return "iPad pro (10.5-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad8.1")){return "iPad pro (11-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad8.2")){return "iPad pro (11-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad8.3")){return "iPad pro (11-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad8.4")){return "iPad pro (11-inch)"}
        else if (kkk_str_lll.elementsEqual("iPad8.5")){return "iPad pro (12.9-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad8.6")){return "iPad pro (12.9-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad8.7")){return "iPad pro (12.9-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad8.8")){return "iPad pro (12.9-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad8.9")){return "iPad pro (11-inch) 2nd"}
        else if (kkk_str_lll.elementsEqual("iPad8.10")){return "iPad pro (11-inch) 2nd"}
        else if (kkk_str_lll.elementsEqual("iPad8.11")){return "iPad pro (12.9-inch) 4th"}
        else if (kkk_str_lll.elementsEqual("iPad8.12")){return "iPad pro (12.9-inch) 4th"}
        else if (kkk_str_lll.elementsEqual("iPad13.4")){return "iPad pro (11-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad13.5")){return "iPad pro (11-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad13.6")){return "iPad pro (11-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad13.7")){return "iPad pro (11-inch) 3rd"}
        else if (kkk_str_lll.elementsEqual("iPad13.8")){return "iPad pro (12.9-inch) 5th"}
        else if (kkk_str_lll.elementsEqual("iPad13.9")){return "iPad pro (12.9-inch) 5th"}
        else if (kkk_str_lll.elementsEqual("iPad13.10")){return "iPad pro (12.9-inch) 5th"}
        else if (kkk_str_lll.elementsEqual("iPad13.11")){return "iPad pro (12.9-inch) 5th"}
        else if (kkk_str_lll.elementsEqual("iPad11.1")){return "iPad mini 5th"}
        else if (kkk_str_lll.elementsEqual("iPad11.2")){return "iPad mini 5th"}
        else if (kkk_str_lll.elementsEqual("iPad14.1")){return "iPad mini 6th"}
        else if (kkk_str_lll.elementsEqual("iPad14.2")){return "iPad mini 6th"}
        
        else {return kkk_str_lll}
    }
    func CCC_openVpn_DDD() -> String{
        let kkk_cfDict_lll = CFNetworkCopySystemProxySettings()
        if kkk_cfDict_lll == nil{
            return "-1"
        }
        let kkk_nsDict_lll = kkk_cfDict_lll!.takeRetainedValue() as NSDictionary
        if kkk_nsDict_lll.count > 0 {
            let kkk_keys_lll = kkk_nsDict_lll["__SCOPED__"] as! NSDictionary
            for kkk_key_lll: String in kkk_keys_lll.allKeys as! [String] {
                if kkk_key_lll.contains("tap") || kkk_key_lll.contains("tun") || kkk_key_lll.contains("ppp") || kkk_key_lll.contains("ipsec") {
                    return "1"
                }
            }
        }
        return "-1"
    }

}

extension Dictionary {
    
    
    func CCC_toJson_DDD() -> String {
        do {
            let kkk_data_lll = try JSONSerialization.data(withJSONObject: self,options: [])
            return String(data: kkk_data_lll, encoding: .utf8) ?? ""
        }catch {}
        return ""
    }
}
