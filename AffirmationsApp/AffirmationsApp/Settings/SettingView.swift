//
//  SettingView.swift
//  AffirmationsApp
//
//  Created by Ali on 01.08.2024.
//

import SwiftUI

struct SettingView: View {
    @State private var selectedCategory: Category = UserSettings.shared.category
    @State private var selectedColor: BackgroundColor = UserSettings.shared.backgroundColor
    @State private var selectedGender: Gender = UserSettings.shared.gender
    @State private var selectedLanguage: Language = UserSettings.shared.language
    
    @EnvironmentObject private var settingApp: UserSettings
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    
    var body: some View {
        VStack {
            HStack {
                Text("Category")
                
                Button {
                    selectedCategory = .love
                    UserSettings.shared.category = .love
                    settingApp.category = selectedCategory
                } label: {
                    Text("Love")
                        .foregroundStyle(.black)
                        .background(selectedCategory != .friendship ? .primaryPurple : .white)
                }
                
                Button {
                    selectedCategory = .friendship
                    UserSettings.shared.category = .friendship
                    settingApp.category = selectedCategory
                } label: {
                    Text("Friendship")
                        .foregroundStyle(.black)
                        .background(selectedCategory == .friendship ? .primaryPurple : .white)
                }
            }
            
            HStack {
                Text("Background_Color")
                
                Button {
                    selectedColor = .red
                    UserSettings.shared.backgroundColor = .red
                    settingApp.backgroundColor = selectedColor
                } label: {
                    Text("Red")
                        .foregroundStyle(.black)
                        .background(selectedColor != .blue ? .primaryPurple : .white)
                }
                
                Button {
                    selectedColor = .blue
                    UserSettings.shared.backgroundColor = .blue
                    settingApp.backgroundColor = selectedColor
                } label: {
                    Text("Blue")
                        .foregroundStyle(.black)
                        .background(selectedColor == .blue ? .primaryPurple : .white)
                }
            }
            
            HStack {
                Text("Gender")
                
                Button {
                    selectedGender = .female
                    UserSettings.shared.gender = .female
                    settingApp.gender = selectedGender
                } label: {
                    Text("Female")
                        .foregroundStyle(.black)
                        .background(selectedGender != .male ? .primaryPurple : .white)
                }
                
                Button {
                    selectedGender = .male
                    UserSettings.shared.gender = .male
                    settingApp.gender = selectedGender
                } label: {
                    Text("Male")
                        .foregroundStyle(.black)
                        .background(selectedGender == .male ? .primaryPurple : .white)
                }
            }
            
            HStack {
                Text("Language")
                
                Button {
                    selectedLanguage = .english
                    UserSettings.shared.language = .english
                    settingApp.language = selectedLanguage
                    appLanguage = selectedLanguage.rawValue
                } label: {
                    Text("English")
                        .foregroundStyle(.black)
                        .background(selectedLanguage != .russian ? .primaryPurple : .white)
                }
                
                Button {
                    selectedLanguage = .russian
                    UserSettings.shared.language = .russian
                    settingApp.language = selectedLanguage
                    appLanguage = selectedLanguage.rawValue
                } label: {
                    Text("Русский")
                        .foregroundStyle(.black)
                        .background(selectedLanguage == .russian ? .primaryPurple : .white)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(settingApp.backgroundColor.color)
    }
}

#Preview {
    SettingView()
}
