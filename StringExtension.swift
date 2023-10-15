//
//  StringExtension.swift
//  
//
//  Created by Victor Peralta on 07/10/23.
//

import Foundation

public extension String {
    var ml_localized: String{
        return NSLocalizedString(self, comment: "")
    }
    
    func ml_localied(WithComment comment : String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    var ml_containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options:
                                    String.CompareOptions.literal, range: nil) == nil
    }
    var ml_containsOnlyLetters: Bool {
        let notLetters = NSCharacterSet.letters.union(CharacterSet(charactersIn: "áéíóúñ")).inverted
        return rangeOfCharacter(from: notLetters, options:
                                    String.CompareOptions.literal, range: nil) == nil
    }
    var ml_containsIllegalCharacters: Bool {
        rangeOfCharacter(from: NSCharacterSet.illegalCharacters, options: String.CompareOptions.literal, range: nil) != nil
    }
    
    var ml_containsOnlyPasswordAllowed: Bool {
        var allowedCharacters = CharacterSet()
        allowedCharacters.insert(charactersIn: "!"..."~")
        let forbiddenCharacters = allowedCharacters.inverted
        return rangeOfCharacter(from: forbiddenCharacters,
                                options: String.CompareOptions.literal, range:
                                    nil) == nil
    }
    var ml_isAlphanumeric: Bool {
        let notAlphanumeric = NSCharacterSet.decimalDigits.union(NSCharacterSet.letters).inverted
        return rangeOfCharacter(from: notAlphanumeric, options:
                                    String.CompareOptions.literal, range: nil) == nil
    }
    var ml_containsLetters: Bool {
        rangeOfCharacter(from: NSCharacterSet.letters, options:
                            String.CompareOptions.literal, range: nil) != nil
    }
    var ml_containsDigits: Bool {
        rangeOfCharacter(from: NSCharacterSet.decimalDigits,
                         options: String.CompareOptions.literal, range:
                            nil) != nil
    }
    var ml_containsUppercaseLetters: Bool {
        rangeOfCharacter(from: NSCharacterSet.uppercaseLetters,
                         options: String.CompareOptions.literal, range:
                            nil) != nil
    }
    
    var ml_containsLowercaseLetters: Bool {
        rangeOfCharacter(from: NSCharacterSet.lowercaseLetters,
                         options: String.CompareOptions.literal, range:
                            nil) != nil
    }
    var ml_containsNonAlphanumericCharacters: Bool {
        let notAlphanumeric = NSCharacterSet.decimalDigits.union(NSCharacterSet.letters).inverted
        return rangeOfCharacter(from: notAlphanumeric, options:
                                    String.CompareOptions.literal, range: nil) != nil
    }
    
    //    MARK: Email validation
    var ml_isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var ml_trueValue : Bool {
        return true
    }
    
}
