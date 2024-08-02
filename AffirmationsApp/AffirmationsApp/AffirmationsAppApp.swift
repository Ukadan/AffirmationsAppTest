//
//  AffirmationsAppApp.swift
//  AffirmationsApp
//
//  Created by Ali on 01.08.2024.
//

import SwiftUI

@main
struct AffirmationsAppApp: App {
    private var settingApp = UserSettings()
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.locale, .init(identifier: appLanguage))
                .environmentObject(settingApp)
        }
    }
}
