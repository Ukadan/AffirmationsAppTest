//
//  UserSettings.swift
//  AffirmationsApp
//
//  Created by Ali on 01.08.2024.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case love = "Love"
    case friendship = "Friendship"
    
    var id: Self { self }
    
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}

enum BackgroundColor: String, CaseIterable, Identifiable {
    case red = "Red"
    case blue = "Blue"
    
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .red:
            return .red
        }
    }
    
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}

enum Gender: String, CaseIterable, Identifiable {
    case female = "Female"
    case male = "Male"
    
    var id: Self { self }
    
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}

enum Language: String, CaseIterable, Identifiable {
    case english = "en"
    case russian = "ru"
    
    var id: Self { self }
    
    var displayName: String {
        switch self {
        case .english:
            return "English"
        case .russian:
            return "Русский"
        }
    }
}

struct UserSelection {
    var category: Category
    var backgroundColor: BackgroundColor
    var gender: Gender
}

class UserSettings: ObservableObject {
    static var shared = UserSettings()
    
    private let categoryKey = "categoryKey"
    private let backgroundColorKey = "backgroundColorKey"
    private let genderKey = "genderKey"
    private let languageKey = "AppleLanguage"
    
//    @AppStorage("selectedLanguage") private var languageString: String = SelectedLanguage.lithuanian.rawValue
    
    @Published var category: Category {
        didSet {
            UserDefaults.standard.set(category.rawValue, forKey: categoryKey)
        }
    }
       
    @Published var backgroundColor: BackgroundColor {
        didSet {
            UserDefaults.standard.set(backgroundColor.rawValue, forKey: backgroundColorKey)
        }
    }
       
    @Published var gender: Gender {
        didSet {
            UserDefaults.standard.set(gender.rawValue, forKey: genderKey)
        }
    }
    
    @Published var language: Language {
           didSet {
               UserDefaults.standard.set([language.rawValue], forKey: languageKey)
               UserDefaults.standard.synchronize()
           }
       }
          
    init() {
        self.category = Category(rawValue: UserDefaults.standard.string(forKey: categoryKey) ?? Category.love.rawValue) ?? .love
        self.backgroundColor = BackgroundColor(rawValue: UserDefaults.standard.string(forKey: backgroundColorKey) ?? BackgroundColor.red.rawValue) ?? .red
        self.gender = Gender(rawValue: UserDefaults.standard.string(forKey: genderKey) ?? Gender.female.rawValue) ?? .female
        self.language = Language(rawValue: (UserDefaults.standard.array(forKey: languageKey)?.first as? String) ?? Language.english.rawValue) ?? .english
    }
}
