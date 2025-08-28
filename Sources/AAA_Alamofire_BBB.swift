//
//  AAA_Alamofire_BBB.swift
//  VDCFramework
//
//  Created by Frankie on 2024/4/7.
//

import Alamofire
import CoreTelephony
import Network
import Foundation


#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif





class AAA_net_BBB : NSObject {
    
    nonisolated(unsafe) static let kkk_share_lll = AAA_net_BBB()
    
    
    var kkk_deviceVersion_lll = ""
    
    
//    @MainActor override init() {
//        super.init()
//        kkk_deviceVersion_lll = UIDevice.current.systemVersion
//    }
    
    
    
    
    
    
    nonisolated(unsafe) var kkk_headerDic_lll : HTTPHeaders?
    let kkk_netManager_lll = NetworkReachabilityManager()
    
    
    func CCC_netSta_DDD(suc:@Sendable @escaping ()->Void, fail:@Sendable @escaping ()->Void) {
        kkk_netManager_lll?.startListening(onUpdatePerforming: { status in
            switch status {
            case .reachable(_):
                suc()
            default:
                fail()
            }
        })
    }
    func CCC_gets_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : Any)->Void) {
        print("```````````````````````````````",url)
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        kkk_headerDic_lll["Signature-Value"] = CCC_getCrypto_DDD(dic, url)
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        let kkk_urls_lll = kkk_baseUrl_lll + url
        let kkk_request_lll = AF.request(kkk_urls_lll,method: .get,parameters: (dic as! Parameters),headers: kkk_headerDic_lll) { requests in
            requests.timeoutInterval = 10
        }
        kkk_request_lll.responseData { response in
            switch response.result {
            case let .success(data):
                self.CCC_requests_DDD(data, url) { req in
                    suc(req)
                } fail: { msg in
                    fail(msg)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_posts_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : Any)->Void) {
        print("```````````````````````````````",url)
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        kkk_headerDic_lll["Signature-Value"] = CCC_postCrypto_DDD(dic, url)
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        let kkk_urls_lll = kkk_baseUrl_lll + url
        AF.request(kkk_urls_lll,method: .post,parameters: (dic as! Parameters),headers: kkk_headerDic_lll,requestModifier: { requests in
            requests.timeoutInterval = 10
        }).responseData { response in
            switch response.result {
            case let .success(data):
                self.CCC_requests_DDD(data, url) { req in
                    suc(req)
                } fail: { msg in
                    fail(msg)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    
    nonisolated(unsafe) var kkk_requestShare_lll : DataRequest!
    
    func CCC_get_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) ->DataRequest {
        print("```````````````````````````````",url)
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        kkk_headerDic_lll["Signature-Value"] = CCC_getCrypto_DDD(dic, url)
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        let kkk_urls_lll = kkk_baseUrl_lll + url
        let kkk_request_lll = AF.request(kkk_urls_lll,method: .get,parameters: (dic as! Parameters),headers: kkk_headerDic_lll) { requests in
            requests.timeoutInterval = 10
        }
        kkk_request_lll.responseData { response in
            switch response.result {
            case let .success(data):
                self.CCC_request_DDD(data, url) { req in
                    suc(req)
                } fail: { msg in
                    fail(msg)
                }
            case .failure(_):
                fail("")
            }
        }
        return kkk_request_lll
    }
    func CCC_getShare_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````",url)
        kkk_requestShare_lll?.cancel()
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        kkk_headerDic_lll["Signature-Value"] = CCC_getCrypto_DDD(dic, url)
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        let kkk_urls_lll = kkk_baseUrl_lll + url
        kkk_requestShare_lll = AF.request(kkk_urls_lll,method: .get,parameters: (dic as! Parameters),headers: kkk_headerDic_lll) { requests in
            requests.timeoutInterval = 10
        }
        kkk_requestShare_lll.responseData { response in
            switch response.result {
            case let .success(data):
                self.CCC_request_DDD(data, url) { req in
                    suc(req)
                } fail: { msg in
                    fail(msg)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_get_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void) ->DataRequest {
        return CCC_get_DDD(url, dic) { req in
            suc(req)
        } fail: { msg in
            
        }
    }
    //FUNCMARK
    //FUNCMARK
    func CCC_get_DDD(_ url : String, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        CCC_get_DDD(url, NSDictionary()) { req in
            suc(req)
        } fail: { msg in
            fail(msg)
        }
    }
    //FUNCMARK
    //FUNCMARK
    func CCC_get_DDD(_ url : String, suc:@Sendable @escaping (_ req : Any)->Void) {
        CCC_get_DDD(url, NSDictionary()) { req in
            suc(req)
        } fail: { msg in
            
        }
    }
    //FUNCMARK
    //FUNCMARK
    func CCC_get_DDD(_ url : String, _ dic : NSDictionary) {
        CCC_get_DDD(url, dic) { req in
            
        } fail: { msg in
            
        }
        
    }
    func CCC_post_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````",url)
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        kkk_headerDic_lll["Signature-Value"] = CCC_postCrypto_DDD(dic, url)
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        let kkk_urls_lll = kkk_baseUrl_lll + url
        AF.request(kkk_urls_lll,method: .post,parameters: (dic as! Parameters),headers: kkk_headerDic_lll,requestModifier: { requests in
            requests.timeoutInterval = 10
        }).responseData { response in
            switch response.result {
            case let .success(data):
                self.CCC_request_DDD(data, url) { req in
                    suc(req)
                } fail: { msg in
                    fail(msg)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_post_DDD(_ url : String, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        CCC_post_DDD(url, NSDictionary()) { req in
            suc(req)
        } fail: { error in
            fail(error)
        }
    }
    //FUNCMARK
    //FUNCMARK
    func CCC_post_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void) {
        CCC_post_DDD(url, dic) { req in
            suc(req)
        } fail: { error in
            
        }
    }
    //FUNCMARK
    //FUNCMARK
    func CCC_post_DDD(_ url : String, suc:@Sendable @escaping (_ req : Any)->Void) {
        CCC_post_DDD(url, NSDictionary()) { req in
            suc(req)
        }fail: { msg in
            
        }
    }
    //FUNCMARK
    //FUNCMARK
    
    func CCC_post_DDD(_ url : String, _ dic : NSDictionary) {
        CCC_post_DDD(url, dic) { req in
            
        }fail: { msg in
            
        }
    }
    
    func CCC_check_DDD(_ url : String, _ dic : NSDictionary, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````",url)
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        kkk_headerDic_lll["Signature-Value"] = CCC_getCrypto_DDD(dic, url)
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        let kkk_urls_lll = kkk_baseUrl_lll + url
        AF.request(kkk_urls_lll,method: .get,parameters: dic as! Parameters,headers: kkk_headerDic_lll,requestModifier: { requests in
            requests.timeoutInterval = 3
        }).responseData { response in
            switch response.result {
            case let .success(data):
                let kkk_dic_lll = self.CCC_dataToDictionary_DDD(data: data)
                if kkk_dic_lll == nil {
                    fail("")
                    return
                }
                if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                    suc(kkk_dic_lll?[kkk_apiData_lll] as Any)
                }else{
                    fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_dataToDictionary_DDD(data:Data) ->Dictionary<String, Any>?{
        do {
            let kkk_json_lll = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let kkk_dic_lll = kkk_json_lll as! Dictionary<String, Any>
            return kkk_dic_lll
        } catch _ {
            return nil
        }
    }
    func CCC_updates_DDD(_ img : UIImage, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````上传image1")
        let kkk_url_lll = kkk_baseUrl_lll + "sys/resource/upload"
        let kkk_name_lll = "MMM_attach_NNN.png"
        let kkk_data_lll : NSData = img.jpegData(compressionQuality: 0.1)! as NSData
        
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        let kkk_params_lll = NSMutableDictionary()
        kkk_params_lll.setObject("1", forKey: kkk_typeLabel_lll as NSCopying)
        kkk_headerDic_lll["Signature-Value"] = CCC_postCrypto_DDD(kkk_params_lll, "sys/resource/upload")
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        AF.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(("1".data(using:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!), withName: kkk_typeLabel_lll)
            MultipartFormData.append(kkk_data_lll as Data, withName: "file", fileName: kkk_name_lll, mimeType: "image/png")
        }, to: kkk_url_lll, method: .post, headers: kkk_headerDic_lll).responseData { response in
            switch response.result {
            case let .success(data):
                let kkk_dic_lll = self.CCC_dataToDictionary_DDD(data: data)
                if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                    suc(kkk_dic_lll?[kkk_apiData_lll] as Any)
                }else{
                    fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_updates_DDD(_ img : UIImage, gress:@Sendable @escaping (_ req : Double)->Void, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````上传image")
        let kkk_url_lll = kkk_baseUrl_lll + "sys/resource/upload"
        let kkk_name_lll = "MMM_attach_NNN.png"
        let kkk_data_lll : NSData = img.jpegData(compressionQuality: 0.1)! as NSData
        
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        let kkk_params_lll = NSMutableDictionary()
        kkk_params_lll.setObject("1", forKey: kkk_typeLabel_lll as NSCopying)
        kkk_headerDic_lll["Signature-Value"] = CCC_postCrypto_DDD(kkk_params_lll, "sys/resource/upload")
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        AF.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(("1".data(using:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!), withName: kkk_typeLabel_lll)
            MultipartFormData.append(kkk_data_lll as Data, withName: "file", fileName: kkk_name_lll, mimeType: "image/png")
        }, to: kkk_url_lll, method: .post, headers: kkk_headerDic_lll)
        .uploadProgress(closure: { progress in
            let percentComplete = progress.fractionCompleted * 90
            gress(percentComplete)
        }).responseData { response in
            switch response.result {
            case let .success(data):
                let kkk_dic_lll = self.CCC_dataToDictionary_DDD(data: data)
                if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                    suc(kkk_dic_lll?[kkk_apiData_lll] as Any)
                }else{
                    fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_updatesData_DDD(_ data : Data, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````上传")
        let kkk_url_lll = kkk_baseUrl_lll + "sys/resource/upload"
        let kkk_name_lll = "MMM_attach_NNN.png"
        
        var kkk_headerDic_lll = CCC_getRequestHeaderDic_DDD()
        
        let kkk_params_lll = NSMutableDictionary()
        kkk_params_lll.setObject("1", forKey: kkk_typeLabel_lll as NSCopying)
        kkk_headerDic_lll["Signature-Value"] = CCC_postCrypto_DDD(kkk_params_lll, "sys/resource/upload")
        kkk_headerDic_lll["Authorization"] = kkk_token_lll
        AF.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(("1".data(using:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!), withName: kkk_typeLabel_lll)
            MultipartFormData.append(data, withName: "file", fileName: kkk_name_lll, mimeType: "image/png")
        }, to: kkk_url_lll, method: .post, headers: kkk_headerDic_lll).responseData { response in
            switch response.result {
            case let .success(data):
                let kkk_dic_lll = self.CCC_dataToDictionary_DDD(data: data)
                if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                    suc(kkk_dic_lll?[kkk_apiData_lll] as Any)
                }else{
                    fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
                }
            case .failure(_):
                fail("")
            }
        }
    }
    func CCC_downFile_DDD(_ urlStr : String,_ gress:@Sendable @escaping (_ req : Double)->Void, suc:@Sendable @escaping (_ req : String)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        print("```````````````````````````````",urlStr)
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
            DispatchQueue.main.async {
                suc(kkk_pathway_lll)
            }
        }
    }
    
    
    //header头里面的内容
    func CCC_getRequestHeaderDic_DDD() -> HTTPHeaders {
        let kkk_myUuid_lll = AAA_UdidModel_BBB.kkk_share_lll.kkk_uuid_lll
        let kkk_packageVersion_lll = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let kkk_languageCode_lll = Locale.preferredLanguages.first
        let kkk_arr_lll = kkk_languageCode_lll?.components(separatedBy: "-")
        let kkk_language_lll : String = (kkk_arr_lll?.first!)!
        let kkk_dic_lll : HTTPHeaders = [
            kkk_afnHeaderUUStr_lll : kkk_myUuid_lll,
            kkk_afnHeaderTypeStr_lll : "iOS",
            kkk_afnHeaderVersionStr_lll : kkk_deviceVersion_lll,
            kkk_afnHeaderNameStr_lll : kkk_myAppHeaderName_lll,
            kkk_afnHeaderPVStr_lll : kkk_packageVersion_lll!.replacingOccurrences(of: ".", with: ""),
            kkk_afnHeaderPVNStr_lll : Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String,
            kkk_afnHeaderDLangStr_lll : kkk_language_lll,
            kkk_afnHeaderLangStr_lll : kkk_language_lll,
            kkk_afnHeaderModelStr_lll : CCC_getDeviceModelName_DDD(),
            kkk_afnHeaderChaStr_lll : kkk_myAppLocalName_lll,
            //        "HeaderCodeVersion" : "version37",
            kkk_VProxyStr_lll : CCC_openVpn_DDD(),
        ]
        return kkk_dic_lll
    }
    @MainActor func CCC_getRequestHeaderDics_DDD() -> NSDictionary {
        let kkk_myUuid_lll = AAA_UdidModel_BBB.kkk_share_lll.kkk_uuid_lll
        let kkk_packageVersion_lll = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let kkk_languageCode_lll = Locale.preferredLanguages.first
        let kkk_arr_lll = kkk_languageCode_lll?.components(separatedBy: "-")
        let kkk_language_lll : String = (kkk_arr_lll?.first!)!
        let kkk_dic_lll = [
            kkk_afnHeaderUUStr_lll : kkk_myUuid_lll,
            kkk_afnHeaderTypeStr_lll : "iOS",
            kkk_afnHeaderVersionStr_lll : kkk_deviceVersion_lll,
            kkk_afnHeaderNameStr_lll : kkk_myAppHeaderName_lll,
            kkk_afnHeaderPVStr_lll : kkk_packageVersion_lll!.replacingOccurrences(of: ".", with: ""),
            kkk_afnHeaderPVNStr_lll : Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String,
            kkk_afnHeaderDLangStr_lll : kkk_language_lll,
            kkk_afnHeaderLangStr_lll : kkk_language_lll,
            kkk_afnHeaderModelStr_lll : CCC_getDeviceModelName_DDD(),
            kkk_afnHeaderChaStr_lll : kkk_myAppLocalName_lll,
            //        "HeaderCodeVersion" : "version37",
            kkk_VProxyStr_lll : CCC_openVpn_DDD(),
        ]
        return kkk_dic_lll as NSDictionary
    }
    //FUNCMARK
    //FUNCMARK
    func CCC_getRequestSomeDic_DDD() -> String {
        return AAA_UdidModel_BBB.kkk_share_lll.kkk_uuid_lll
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
    
    
    
    
    
    func CCC_request_DDD(_ req : Any,_ url : String, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : String)->Void) {
        let kkk_dic_lll = CCC_dataToDictionary_DDD(data: req as! Data)
        if kkk_dic_lll == nil {
            fail("")
        }else{
            if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                suc(kkk_dic_lll?[kkk_apiData_lll] as Any)
            }else if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 1 {
                fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
            }else if (kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 2 || kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 4) {
                AAA_netOutModel_BBB.CCC_postLogoutNoty_DDD()
                fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
            }else if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 3 && url != "oms/wallet/exchange" {
                AAA_netOutModel_BBB.CCC_showRechargeNoty_DDD()
                fail("")
            }else{
                fail(kkk_dic_lll?[kkk_msgStr_lll] as! String)
            }
        }
    }
    func CCC_requests_DDD(_ req : Any,_ url : String, suc:@Sendable @escaping (_ req : Any)->Void, fail:@Sendable @escaping (_ msg : Any)->Void) {
        let kkk_dic_lll = CCC_dataToDictionary_DDD(data: req as! Data)
        if kkk_dic_lll == nil {
            fail("")
        }else{
            if kkk_dic_lll?[kkk_LabelHttpReqCodeLabel_lll] as! Int == 0 {
                suc(kkk_dic_lll?[kkk_apiData_lll] as Any)
            }else{
                fail(kkk_dic_lll as Any)
            }
        }
    }
}
