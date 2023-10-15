//
//  StringExtension.swift
//  Marvel
//
//  Created by Victor Peralta on 30/09/23.
//

import Foundation
import CryptoKit

extension String{
    
    var md5 : String {
        let hashedData = Insecure.MD5.hash(data: Data(self.utf8))
        let md5String = hashedData.map { String(format: "%02hhx", $0) }.joined()
        return md5String
    }
}
