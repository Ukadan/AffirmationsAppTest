//
//  MainView.swift
//  AffirmationsApp
//
//  Created by Ali on 01.08.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var affirmationsProvider = AffirmationsProvider()
    @EnvironmentObject private var settingApp: UserSettings
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(AffirmationsProvider.shared.affirmationArray.filter { $0.categoryName == settingApp.category && $0.languageText == settingApp.language}) { affirmation in
                    AffirmationView(category: affirmation)
                }
            }
            .frame(maxHeight: .infinity)
            .background(settingApp.backgroundColor.color)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView().toolbarRole(.editor)) {
                        Image(systemName: "gear")
                            .foregroundStyle(.black)
                            .padding(.trailing, 10)
                    }
                }
            }
        }
    }
}

struct AffirmationView: View {
    var category: AffirmationCategory

    var body: some View {
        TabView {
            ForEach(category.affirmations) { affirmation in
                VStack {
                    Text(affirmation.text)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                }
                .rotationEffect(.degrees(270))
            }
        }
        .rotationEffect(.degrees(90))
        .tabViewStyle(PageTabViewStyle())
    }
}

//#Preview {
//    MainView()
//}
