//
//  OhterSettingItem.swift
//  Model
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

public enum OhterSettingItem: CaseIterable, CustomStringConvertible  {
    case privacyPolicy
    case termsOfService
    case withDraw
    case appVersion
    
  public  var description: String {
        switch self {
        case .privacyPolicy:
            return "개인정보처리방침"
        case .termsOfService:
            return "서비스 이용약관"
        case .withDraw:
            return "회원탈퇴"
        case .appVersion:
            return "앱 버전"
        }
    }
}

