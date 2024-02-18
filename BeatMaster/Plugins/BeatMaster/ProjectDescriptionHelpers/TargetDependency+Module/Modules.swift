//
//  Modules.swift
//  MyPlugin
//
//  Created by 서원지 on 1/6/24.
//

import Foundation
import ProjectDescription

public enum ModulePath {
    case Feature(Features)
    case Core(Cores)
    case Networking(Networkings)
    case Shared(Shareds)
}

//MARK: -  앱  모듈
public extension ModulePath {
    enum App: String, CaseIterable {
        case iOS
        case iPad
        
        public static let name: String = "App"
    }
}

// MARK: FeatureModule
public extension ModulePath {
    enum Features: String, CaseIterable {
        case Auth
        case BPMCounter
        case Metronome
        
        public static let name: String = "Feature"
    }
}

//MARK: -  CoreMoudule
public extension ModulePath {
    enum Cores: String, CaseIterable {
        case Core
        case Authorization
        case Station
        
        public static let name: String = "Core"
    }
}

//MARK: -  CoreDomainModule
public extension ModulePath {
    enum Networkings: String, CaseIterable {
        case Networking
        case Networkings
        case Model
        case Service
        case DiContainer
        case ThirdPartys
        
        
        public static let name: String = "Networking"
    }
}

public extension ModulePath {
    enum Shareds: String, CaseIterable {
        case Shareds
        case DesignSystem
        case Constants
        case ThirdParty
        
        public static let name: String = "Shared"
    }
}

