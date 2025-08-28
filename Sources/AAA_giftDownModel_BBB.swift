//
//  AAA_giftDownModel_BBB.swift
//  Wohoo_SDK_A
//
//  Created by Frankie on 09/05/2025.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
import SDWebImage
import Alamofire

class AAA_giftDownModel_BBB: NSObject, @unchecked Sendable {
    
    
    
    class func CCC_downImage_DDD(_ string : String, _ req : @Sendable @escaping ()->Void) {
        AAA_giftDownModel_BBB.kkk_share_lll.CCC_downImage_DDD(string) {
            DispatchQueue.main.async {
                req()
            }
        }
    }
    
    
    
    
    var kkk_session_lll : Session!
    //礼物下载器，点击选中优先下载，会取消下载再继续下载其他的
    var kkk_giftSession_lll : Session!
    var kkk_downList_lll = NSMutableArray()
    var kkk_selectDownList_lll = NSMutableArray()
    var kkk_nowDownUrl_lll = ""
    

    override init() {
        super.init()
        
        let kkk_configuration_lll = URLSessionConfiguration.default
        kkk_configuration_lll.timeoutIntervalForRequest = 60
        kkk_configuration_lll.httpMaximumConnectionsPerHost = 5
        kkk_configuration_lll.requestCachePolicy = .reloadIgnoringLocalCacheData
        kkk_session_lll = Session(configuration: kkk_configuration_lll)
        kkk_giftSession_lll = Session(configuration: kkk_configuration_lll)
        CCC_loadDownFile_DDD()
    }
    func CCC_loadDownFile_DDD() {
        _ = AAA_NetModule_BBB.CCC_getData_DDD(.kkk_downPath_lll, [:]) { [weak self] req in
            self!.CCC_downFiles_DDD(req as! NSArray)
        }fail: { msg in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.CCC_loadDownFile_DDD()
            }
        }
    }
    
    func CCC_downFiles_DDD(_ array : NSArray) {
        kkk_downList_lll.addObjects(from: array as! [Any])
        CCC_downFile_DDD()
    }
    
    func CCC_downFile_DDD() {
        if kkk_downList_lll.count > 0 {
            let kkk_url_lll = ((kkk_downList_lll.firstObject as? String) ?? "").lowercased()
            kkk_downList_lll.removeObject(at: 0)
            if kkk_url_lll.count == 0 {
                CCC_downFile_DDD()
                return
            }
            if kkk_url_lll.lowercased().contains("png") == true || kkk_url_lll.lowercased().contains("jpg") == true || kkk_url_lll.lowercased().contains("jpeg") == true {
                CCC_downImage_DDD(kkk_url_lll) {
                    self.CCC_downFile_DDD()
                } fail: {
                    self.CCC_downFile_DDD()
                }
            }else {
                CCC_downAni_DDD(kkk_url_lll) {
                    self.CCC_downFile_DDD()
                } fail: {
                    self.CCC_downFile_DDD()
                }
            }
        }
    }
    
    func CCC_downImage_DDD(_ string : String, _ down:@escaping ()->Void, fail:@escaping ()->Void?) {
        SDWebImageManager.shared.loadImage(with: URL(string: string)) { state, error, url in
            
        } completed: { image, data, error, cacheType, finished, url in
            if image != nil {
                down()
            }else {
                fail()
            }
        }
    }
    func CCC_downImage_DDD(_ string : String, _ down:@escaping ()->Void) {
        CCC_downImage_DDD(string) {
            down()
        } fail: {
        }
    }
    
    func CCC_downAni_DDD(_ urlStr : String, suc:@Sendable @escaping ()->Void, fail:@escaping ()->Void) {
        if urlStr.count == 0 {
            fail()
            return
        }
        let kkk_destination_lll = DownloadRequest.suggestedDownloadDestination(for: .cachesDirectory)
        let kkk_url_lll = URL(string: urlStr as String)!
        let kkk_urls_lll = URLRequest(url: kkk_url_lll)
        
        let kkk_pathway_lll = NSHomeDirectory().appending("/Library/Caches/") + kkk_url_lll.lastPathComponent
        let kkk_manager_lll = FileManager()
        if !kkk_manager_lll.fileExists(atPath: kkk_pathway_lll) {
            kkk_session_lll.download(kkk_urls_lll,to: kkk_destination_lll).response { response in
                switch response.result {
                case .success(_):
                    let kkk_pathway_lll = NSHomeDirectory() + "/Library/Caches/" + kkk_urls_lll.url!.lastPathComponent
                    AAA_netOutModel_BBB.CCC_downResourceSucNoty_DDD(urlStr)
                    suc()
                case .failure(_):
                    fail()
                }
            }
        }else{
            DispatchQueue.main.async {
                suc()
            }
        }
    }
    
    //礼物优先下载，需放弃上一个下载
    func CCC_downGiftAni_DDD(_ urlStr : String) {
        if urlStr.count == 0 {
            AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(urlStr, ["kkk_type_lll":"1"])
            return
        }
        //保存点击需要下载的url
        kkk_selectDownList_lll.add(urlStr)
        kkk_nowDownUrl_lll = urlStr
        let kkk_destination_lll = DownloadRequest.suggestedDownloadDestination(for: .cachesDirectory)
        let kkk_url_lll = URL(string: urlStr as String)!
        let kkk_urls_lll = URLRequest(url: kkk_url_lll)
        
        let kkk_pathway_lll = NSHomeDirectory().appending("/Library/Caches/") + kkk_url_lll.lastPathComponent
        let kkk_manager_lll = FileManager()
        if !kkk_manager_lll.fileExists(atPath: kkk_pathway_lll) {
            kkk_giftSession_lll.cancelAllRequests()
            kkk_giftSession_lll.download(kkk_urls_lll,to: kkk_destination_lll).downloadProgress { progress in
                let kkk_gressed_lll = Double(progress.fractionCompleted)
                AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(urlStr, ["kkk_type_lll":"2","kkk_gressed_lll" : kkk_gressed_lll])
            }.response { response in
                switch response.result {
                case .success(_):
                    AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(urlStr, ["kkk_type_lll":"1"])
                    self.kkk_selectDownList_lll.remove(urlStr)
                    if self.kkk_selectDownList_lll.count > 0 {
                        self.CCC_downGiftAni_DDD(self.kkk_selectDownList_lll.lastObject as! String)
                    }
                    let kkk_pathway_lll = NSHomeDirectory() + "/Library/Caches/" + kkk_urls_lll.url!.lastPathComponent
                    AAA_netOutModel_BBB.CCC_downResourceSucNoty_DDD(urlStr)
                case .failure(_):
                    if self.kkk_nowDownUrl_lll == urlStr {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(urlStr, ["kkk_type_lll":"1"])
                            if self.kkk_selectDownList_lll.count > 0 {
                                self.CCC_downGiftAni_DDD(self.kkk_selectDownList_lll.lastObject as! String)
                            }
                        }
                    }
                }
            }
        }else{
            DispatchQueue.main.async {
                AAA_netOutModel_BBB.CCC_downUrlSucNoty_DDD(urlStr, ["kkk_type_lll":"1"])
            }
            self.kkk_selectDownList_lll.remove(urlStr)
            if self.kkk_selectDownList_lll.count > 0 {
                self.CCC_downGiftAni_DDD(self.kkk_selectDownList_lll.lastObject as! String)
            }
        }
    }
    
    nonisolated(unsafe) static let kkk_share_lll : AAA_giftDownModel_BBB = AAA_giftDownModel_BBB()
}
