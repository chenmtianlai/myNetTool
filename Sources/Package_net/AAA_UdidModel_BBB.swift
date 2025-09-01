

import UIKit
import Security

class AAA_UdidModel_BBB: NSObject {
    // FUNCMARK
    //B4D9B56CB3E944408C3576BFD580417BL
    
    @objc var kkk_uuid_lll = ""
    // FUNCMARK
    
    
    
        // FUNCMARK
    func CCC_configUdidModel_DDD() {
        if kkk_uuid_lll.count != 0 {
            return
        }
        var kkk_uuids_lll = ""
        let kkk_pas_lll = "ccfs" + Bundle.main.bundleIdentifier!
        let kkk_acc_lll = Bundle.main.bundleIdentifier!
        let kkk_local_lll = CCC_readPassword_DDD(service: kkk_pas_lll, account: kkk_acc_lll)
        if kkk_local_lll != nil {
            kkk_uuids_lll = String(data: kkk_local_lll!, encoding: String.Encoding(rawValue: NSASCIIStringEncoding)) ?? ""
        }
        if kkk_uuids_lll.count > 0 {
            kkk_uuid_lll = kkk_uuids_lll
        }else{
            let kkk_uni_lll = CFUUIDCreate(kCFAllocatorDefault)
            kkk_uuid_lll = CFUUIDCreateString(kCFAllocatorDefault, kkk_uni_lll) as String
            kkk_uuid_lll = kkk_uuid_lll.replacingOccurrences(of: "-", with: "")
            let kkk_data_lll = kkk_uuid_lll.data(using: String.Encoding(rawValue: NSASCIIStringEncoding))
            CCC_save_DDD(password: kkk_data_lll!, service: kkk_pas_lll, account: kkk_acc_lll)
        }
    }
    // FUNCMARK
    // FUNCMARK
     func CCC_save_DDD(password: Data, service: String, account: String) {
        let kkk_query_lll: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: password as AnyObject
        ]
        SecItemAdd(kkk_query_lll as CFDictionary, nil)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_readPassword_DDD(service: String, account: String) -> Data? {
        let kkk_query_lll: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]
        var kkk_itemCopy_lll: AnyObject?
        let kkk_status_lll = SecItemCopyMatching(kkk_query_lll as CFDictionary, &kkk_itemCopy_lll)
        guard kkk_status_lll == errSecSuccess else {
            return nil
        }
        let kkk_password_lll = kkk_itemCopy_lll

        return (kkk_password_lll as! Data)
    }
    // FUNCMARK
    // FUNCMARK
    override init() {
        super.init()
        CCC_configUdidModel_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    @objc class var kkk_share_lll: AAA_UdidModel_BBB{
        struct Static {
            nonisolated(unsafe) static let kkk_udidModel_lll : AAA_UdidModel_BBB = AAA_UdidModel_BBB()
        }
        return Static.kkk_udidModel_lll
    }
    // FUNCMARK
}
