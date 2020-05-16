//
//  tility.swift
//  TesstUI
//
//  Created by Nguyen Quoc Dich on 5/8/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//


import Foundation

enum Validator {
    case userName
    case passWord
    
    func getRegex() -> String {
        switch self {
        case .userName :
            return "^[0-9A-Za-z\\_]{4,30}$"
        case .passWord :
            return "^[0-9A-Za-z\\d_.*]{8,30}$"
        }
    }
}

extension String{
    func isValidate(_ utility: Validator) -> Bool{
        let userNameRegex = utility.getRegex()
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validatorUseName = NSPredicate(format: "SELF MATCHES %@", userNameRegex)
        let isValidateUserName = validatorUseName.evaluate(with: trimmedString)
        return isValidateUserName
    }
}
