//
//  user+extension.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/5/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import Foundation

extension User {
    func userTypeToString() -> String {
        switch type {
        case .writer:
            return "WRITER"
        case .editor:
            return "EDITOR"
        case .manager:
            return "MANAGER"
        default:
            return "UNKNOWN"
        }
    }
}

extension Brand {
    func brandTypeToString() -> String {
        switch type {
        case .coastalLiving:
            return "Coastal Living"
        case .cookingLight:
            return "Cooking Light"
        case .ew:
            return "EW"
        case .extraCrispy:
            return "Extra Crispy"
        case .fansided:
            return "Fansided"
        case .fAndW:
            return "F & W"
        case .fortune:
            return "Fortune"
        case .foundry:
            return "Foundry"
        case .health:
            return "Health"
        case .hg:
            return "HG"
        case .instyle:
            return "InStyle"
        case .lifeVr:
            return "LIFE VR"
        case .money:
            return "Money"
        case .mre:
            return "MRE"
        case .peopleTv:
            return "PEOPLE TV"
        case .people:
            return "PEOPLE"
        case .pesp:
            return "PESP"
        case .realSimple:
            return "Real Simple"
        case .sikids:
            return "SI Kids"
        case .southernLiving:
            return "Southern Living"
        case .si:
            return "SI"
        case .theDrive:
            return "The Drive"
        case .time:
            return "TIME"
        case .tAndL:
            return "T & L"
        default:
            return "UNKNOWN"
        }
    }
}
