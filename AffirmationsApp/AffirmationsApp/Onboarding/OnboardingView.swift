//
//  OnboardingView.swift
//  AffirmationsApp
//
//  Created by Ali on 01.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedCategory: Category = .love
    @State private var selectedColor: BackgroundColor = .red
    @State private var selectedGender: Gender = .female
    @State private var isOnboardingCompleted: Bool = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    @State private var currentPage = 0
    
    var body: some View {
        if isOnboardingCompleted {
            MainView()
        } else {
            VStack {
                TabView(selection: $currentPage) {
                    UserSelectionOnboarding(userChoice: $selectedCategory, choices: Category.allCases.map { $0.rawValue })
                        .tag(0)
                    UserSelectionOnboarding(userChoice: $selectedColor, choices: BackgroundColor.allCases.map { $0.rawValue })
                        .tag(1)
                    UserSelectionOnboarding(userChoice: $selectedGender, choices: Gender.allCases.map { $0.rawValue })
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(selectedColor == .red ? .red : .blue)
            .overlay(
                Button {
                    if currentPage < 2 {
                        currentPage += 1
                    } else {
                        UserSettings.shared.category = selectedCategory
                        UserSettings.shared.backgroundColor = selectedColor
                        UserSettings.shared.gender = selectedGender
                        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                        isOnboardingCompleted = true
                    }
                } label: {
                    Text("Continue")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.primaryPurple)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.white, lineWidth: 2)
                        )
                }
                    .buttonStyle(TappableButtonStyle())
                    .padding(.top, 600)
            )
        }
    }
}

struct UserSelectionOnboarding<ChoiceType: RawRepresentable>: View where ChoiceType.RawValue == String, ChoiceType: Hashable {
    @Binding var userChoice: ChoiceType
    var choices: [String]
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            ForEach(choices, id: \.self) { choice in
                Button {
                    withAnimation(.linear(duration: 0.5)) {
                        userChoice = ChoiceType(rawValue: choice)!
                    }
                } label: {
                    Text(NSLocalizedString(choice, comment: ""))
                        .font(.title.bold())
                        .foregroundStyle(userChoice.rawValue == choice ? .black : .white)
                        .padding(10)
                        .background(userChoice.rawValue == choice ? .white : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(TappableButtonStyle())
            }
        }
    }
}

#Preview {
    OnboardingView()
}
