//
//  KeyLoader.swift
//  Marvel
//
//  Created by Victor Peralta on 30/09/23.
//

import Foundation

class KeyLoader{
    static let shared = KeyLoader()
    
    var privateKey = ""
    var publicKey = ""
    var ts = ""
    var hash = ""
    
    private init(){
        if let file = Bundle.main.url(forResource: "marvel",withExtension: "keys"){
            do{
                let data = try Data(contentsOf: file)
                let myKeys = try JSONDecoder().decode(Keys.self, from: data)
                privateKey = myKeys.privateKey
                publicKey = myKeys.publicKey
            }catch let error{
                print("Error: ",error)
            }
        }
    }
    //        MARK: API params
        /*
         ts = timestamp
         apikey : public key
         hash param : a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
         */
        
        func getAPIParams() -> (ts: String, hash: String, apiKey: String){
            ts = (Date().timeIntervalSince1970).asString
            return (ts,(ts+self.privateKey+self.publicKey).md5, self.publicKey)
        }
        
        func getQueryString() -> String {
            ts = (Date().timeIntervalSince1970).asString
            hash = (ts+self.privateKey+self.publicKey).md5
            return "ts="+ts+"&hash="+hash+"&apikey="+self.publicKey
        }
        
        func getQueryString(limit: Int, offset: Int) -> String {
            ts = (Date().timeIntervalSince1970).asString
            hash = (ts+self.privateKey+self.publicKey).md5
            return "ts="+ts+"&hash="+hash+"&apikey="+self.publicKey+"&limit="+String(limit)+"&offset="+String(offset)

        }
    
    /*
     
     De acuerdo con la documentación de marvel para que nuestras peticiones sean atendidas se deben pasar dos parámetros además del parámetro apikey:

     ts: una marca de tiempo (u otra cadena larga que puede cambiar en cada petición)
     hash: el hash obtenido de la concatenación de los parámetros: ts,  la clave privada y la clave pública (por ejemplo, md5(ts+privateKey+publicKey)

     Por ejemplo, un usuario con una clave pública de "1234" y una clave privada de "abcd" podría construir una petición válida de la siguiente manera:

     http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash =ffd275c5130566a2916217b101f26150 (el valor hash es el md5 de 1abcd1234)
     */
}
