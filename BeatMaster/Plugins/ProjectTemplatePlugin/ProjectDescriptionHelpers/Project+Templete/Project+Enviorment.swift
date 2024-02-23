//
//  Project+Enviorment.swift
//  MyPlugin
//
//  Created by 서원지 on 1/6/24.
//

import Foundation
import ProjectDescription

public extension Project {
    enum Environment {
        public static let appName = "BeatMaster"
        public static let appDemoName = "BeatMaster-Demo"
        public static let appDevName = "BeatMaster-Dev"
        public static let organizationName = "Wonji suh"
        public static let organizationTeamId = "N94CS4N6VR"
        public static let deploymentTarget = DeploymentTargets(iOS: "17.0")
        public static let deploymentDestination: Destinations = [.iPhone, .iPad]
        public static let bundlePrefix = "com.Haejoo.BeatMaster"
        public static let appVersion = "1.0.0"
        public static let mainBundleId = "com.BeatCounter"
    }
}

