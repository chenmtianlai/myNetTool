
//AAA_RSASign_BBB


import Foundation
import CryptoKit
import CryptoSwift
import Alamofire



class AAA_RSASign_BBB {
    
    class func CCC_postCrypto_DDD(_ dic : NSDictionary, _ path : String) -> String {
        let kkk_time_lll = Int(Date().timeIntervalSince1970)
        
        let kkk_bodyStr_lll = CCC_getBodySign1_DDD(dic)
        var kkk_bodySign_lll = CCC_sha256Encrypt_DDD(String(format: "%@&", kkk_bodyStr_lll))
        
        if kkk_bodyStr_lll.count == 0 {
            kkk_bodySign_lll = ""
        }
        
        let kkk_signContent_lll = String(format: "%d\nPOST\n/%@\n%@\n%@", kkk_time_lll,path,"",kkk_bodySign_lll)
        let kkk_value_lll = CCC_hmacBase64_DDD(key: AAA_netManager_BBB.kkk_signKey_lll, message: kkk_signContent_lll)
        
        let kkk_key_lll = String(format: "type=0;key=%@;time=%d", CCC_base64_DDD(AAA_netManager_BBB.kkk_signKey_lll), kkk_time_lll)
        let kkk_data_lll = CCC_rsaEncrypt_DDD(kkk_key_lll)
        
        let kkk_latestValue_lll = "key=" + AAA_netManager_BBB.kkk_fingerprint_lll + ";secret=" + kkk_data_lll + ";signature=" + kkk_value_lll
        return kkk_latestValue_lll
    }
    
    
    
    class func CCC_getCrypto_DDD(_ dic : NSDictionary, _ path : String) -> String {
        let kkk_paths_lll = path
        let kkk_time_lll = Int(Date().timeIntervalSince1970)
        
        let kkk_signContent_lll = String(format: "%d\nGET\n/%@\n%@\n%@", kkk_time_lll,kkk_paths_lll,CCC_getBodySign_DDD(dic),"")
        let kkk_value_lll = CCC_hmacBase64_DDD(key: AAA_netManager_BBB.kkk_signKey_lll, message: kkk_signContent_lll)
        
        let kkk_key_lll = String(format: "type=0;key=%@;time=%d", CCC_base64_DDD(AAA_netManager_BBB.kkk_signKey_lll), kkk_time_lll)
        let kkk_data_lll = CCC_rsaEncrypt_DDD(kkk_key_lll)
        
        let kkk_latestValue_lll = "key=" + AAA_netManager_BBB.kkk_fingerprint_lll + ";secret=" + kkk_data_lll + ";signature=" + kkk_value_lll
        
        return kkk_latestValue_lll
    }
    
    //排序，拼接，
    class func CCC_getBodySign_DDD(_ dic : NSDictionary) -> String {
        if dic.allKeys.count == 0 {
            return ""
        }
        let kkk_headerDic_lll : HTTPHeaders = [
            "kkk_afnHeaderTypeStr_lll" : "iOS",
            "kkk_afnHeaderNameStr_lll" : "kkk_myAppHeaderName_lll",
        ]
        let kkk_request_lll = AF.request(AAA_netManager_BBB.kkk_baseUrl_lll,method: .get,parameters: (dic as! Parameters),headers: kkk_headerDic_lll) { requests in}
        
        var kkk_urls1_lll = String(format: "%@", (kkk_request_lll.convertible.urlRequest?.url?.absoluteString as? CVarArg) ?? "")
        kkk_urls1_lll = kkk_urls1_lll.replacingOccurrences(of: AAA_netManager_BBB.kkk_baseUrl_lll + "?", with: "")
        return kkk_urls1_lll
    }
    
    class func CCC_getBodySign1_DDD(_ dic : NSDictionary) -> String {
        var kkk_array_lll = dic.allKeys as! Array<String>
        if kkk_array_lll.count == 0 {
            return ""
        }
        if kkk_array_lll.count == 1 {
            return String(format: "%@=%@", kkk_array_lll.first!, dic.allValues.first as! CVarArg)
        }
        var kkk_str_lll = ""
        kkk_array_lll.sort { (s1, s2) in
            return s1.localizedStandardCompare(s2) == .orderedAscending
        }
        for kkk_key_lll in kkk_array_lll {
            if kkk_str_lll.count == 0 {
                kkk_str_lll = String(format: "%@=%@", kkk_key_lll, dic[kkk_key_lll] as! CVarArg)
            }else {
                kkk_str_lll = kkk_str_lll + String(format: "&%@=%@", kkk_key_lll, dic[kkk_key_lll] as! CVarArg)
            }
        }
        return kkk_str_lll
    }
    class func CCC_base64_DDD(_ string: String) -> String {
        guard let CCC_data_DDD = string.data(using: .utf8) else { return "" }
        return CCC_data_DDD.base64EncodedString()
    }
    
    
    
    
    
    //rsa加密
    class func CCC_rsaEncrypt_DDD(_ text: String) -> String {
        do {
            let encrypted = try AAA_RSAEncryptor_BBB.CCC_encrypt_DDD(text, AAA_netManager_BBB.kkk_publicKey_lll)
            return encrypted
        } catch {
            return ""
        }
    }
    
    class func CCC_hmacBase64_DDD(key: String, message: String) -> String {
        let kkk_signature_lll = CryptoKit.HMAC<SHA256>.authenticationCode(for: Data(message.utf8), using: SymmetricKey(data: Data(key.utf8)))
        let kkk_data_lll = Data(kkk_signature_lll).base64EncodedString()
        return kkk_data_lll
    }
    
    
    class func CCC_sha256Encrypt_DDD(_ input: String) -> String {
        let CCC_data_DDD = input.data(using: .utf8)
        guard let CCC_hash_DDD = CCC_data_DDD?.sha256() else { return "" }
        return CCC_hash_DDD.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    
    
    
    class AAA_RSAEncryptor_BBB {
        static func CCC_encrypt_DDD(_ string: String, _ publicKey: String) throws -> String {
            guard let kkk_data_lll = string.data(using: .utf8) else {
                throw AAA_RSAError_BBB.kkk_stringToDataConversionFailed_lll
            }
            
            let kkk_key_lll = try CCC_preparePublicKey_DDD(publicKey)
            let kkk_encryptedData_lll = try CCC_encrypt_DDD(kkk_data_lll, kkk_key_lll)
            
            return kkk_encryptedData_lll.base64EncodedString()
        }
        
        private static func CCC_preparePublicKey_DDD(_ key: String) throws -> SecKey {
            let kkk_header_lll = "-----BEGIN PUBLIC KEY-----"
            let kkk_footer_lll = "-----END PUBLIC KEY-----"
            let kkk_keyString_lll = key.replacingOccurrences(of: kkk_header_lll, with: "")
                .replacingOccurrences(of: kkk_footer_lll, with: "")
                .replacingOccurrences(of: "\n", with: "")
                .replacingOccurrences(of: "\r", with: "")
                .replacingOccurrences(of: " ", with: "")
            
            guard let kkk_keyData_lll = Data(base64Encoded: kkk_keyString_lll) else {
                throw AAA_RSAError_BBB.kkk_invalidBase64String_lll
            }
            
            let kkk_attributes_lll: [CFString: Any] = [
                kSecAttrKeyType: kSecAttrKeyTypeRSA,
                kSecAttrKeyClass: kSecAttrKeyClassPublic,
                kSecAttrKeySizeInBits: 2048
            ]
            
            var kkk_error_lll: Unmanaged<CFError>?
            guard let kkk_secKey_lll = SecKeyCreateWithData(kkk_keyData_lll as CFData, kkk_attributes_lll as CFDictionary, &kkk_error_lll) else {
                throw kkk_error_lll?.takeRetainedValue() ?? AAA_RSAError_BBB.kkk_keyCreationFailed_lll
            }
            
            return kkk_secKey_lll
        }
        
        private static func CCC_encrypt_DDD(_ data: Data, _ key: SecKey) throws -> Data {
            let kkk_algorithm_lll: SecKeyAlgorithm = .rsaEncryptionPKCS1
            
            guard SecKeyIsAlgorithmSupported(key, .encrypt, kkk_algorithm_lll) else {
                throw AAA_RSAError_BBB.kkk_algorithmNotSupported_lll
            }
            
            var kkk_error_lll: Unmanaged<CFError>?
            guard let kkk_encryptedData_lll = SecKeyCreateEncryptedData(key, kkk_algorithm_lll, data as CFData, &kkk_error_lll) as Data? else {
                throw kkk_error_lll?.takeRetainedValue() ?? AAA_RSAError_BBB.kkk_encryptionFailed_lll
            }
            
            return kkk_encryptedData_lll
        }
        
        enum AAA_RSAError_BBB: Error {
            case kkk_stringToDataConversionFailed_lll
            case kkk_invalidBase64String_lll
            case kkk_keyCreationFailed_lll
            case kkk_algorithmNotSupported_lll
            case kkk_encryptionFailed_lll
            
            var localizedDescription: String {
                return ""
            }
        }
    }
}
