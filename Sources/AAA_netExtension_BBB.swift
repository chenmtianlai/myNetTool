//
//  AAA_netExtension_BBB.swift
//  Module_Net
//
//  Created by Frankie on 10/06/2025.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


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
