//
//  Keys.swift
//  Marvel
//
//  Created by Victor Peralta on 30/09/23.
//

import Foundation

struct Keys : Codable{
    let privateKey : String
    let publicKey : String
    private init(privateKey : String, publicKey : String){
        self.privateKey = privateKey
        self.publicKey = publicKey
    }
    enum CodingKeys : String, CodingKey{
        case privateKey = "private_key"
        case publicKey = "public_key"
    }
}
