//
//  MainViewModel.swift
//  AffirmationsApp
//
//  Created by Ali on 01.08.2024.
//

import Foundation
import Combine

struct AffirmationCategory: Identifiable {
    let id = UUID()
    let categoryName: Category
    let languageText: Language
    let affirmations: [Affirmation]
}

struct Affirmation: Identifiable {
    let id = UUID()
    let text: String
}

class AffirmationsProvider: ObservableObject {
    static let shared = AffirmationsProvider()

    init() {
        loadData()
    }
    
    @Published var affirmationArray: [AffirmationCategory] = []
    
    func loadData() {
        affirmationArray = [
            AffirmationCategory(categoryName: .love, languageText: .english, affirmations: [
                Affirmation(text: "I am worthy of love and deserve to receive love in abundance"),
                Affirmation(text: "My heart is open to giving and receiving love"),
                Affirmation(text: "I am surrounded by love every day and in every way"),
                Affirmation(text: "I attract love and loving relationships into my life"),
                Affirmation(text: "Love flows to me and through me effortlessly"),
                Affirmation(text: "I radiate love and others reflect love back to me"),
                Affirmation(text: "My relationships are filled with love, happiness, and respect"),
                Affirmation(text: "I am grateful for the love that surrounds me"),
                Affirmation(text: "Love comes to me easily and effortlessly"),
                Affirmation(text: "I am a magnet for loving and fulfilling relationships")
            ]),
            AffirmationCategory(categoryName: .friendship, languageText: .english, affirmations: [
                Affirmation(text: "I am surrounded by supportive and loving friends"),
                Affirmation(text: "I attract positive and loyal friendships into my life"),
                Affirmation(text: "My friends and I share mutual respect and trust"),
                Affirmation(text: "I am a kind and caring friend, and I receive the same in return"),
                Affirmation(text: "My friendships are filled with joy, laughter, and understanding"),
                Affirmation(text: "I am grateful for the amazing friends in my life"),
                Affirmation(text: "I nurture and cherish my friendships"),
                Affirmation(text: "I attract friends who support and uplift me"),
                Affirmation(text: "My friends and I grow together in love and harmony"),
                Affirmation(text: "I am a magnet for genuine and lasting friendships")
            ]),
            AffirmationCategory(categoryName: .love, languageText: .russian, affirmations: [
                Affirmation(text: "Я достойна любви и заслуживаю получать любовь в изобилии"),
                Affirmation(text: "Мое сердце открыто для дарения и получения любви"),
                Affirmation(text: "Я окружена любовью каждый день и во всех отношениях"),
                Affirmation(text: "Я привлекаю любовь и любящие отношения в свою жизнь"),
                Affirmation(text: "Любовь течет ко мне и через меня без усилий"),
                Affirmation(text: "Я излучаю любовь, и другие отражают любовь ко мне"),
                Affirmation(text: "Мои отношения наполнены любовью, счастьем и уважением"),
                Affirmation(text: "Я благодарна за любовь, которая меня окружает"),
                Affirmation(text: "Любовь приходит ко мне легко и без усилий"),
                Affirmation(text: "Я магнит для любящих и удовлетворяющих отношений")
            ]),
            AffirmationCategory(categoryName: .friendship, languageText: .russian, affirmations: [
                Affirmation(text: "Я окружена поддерживающими и любящими друзьями"),
                Affirmation(text: "Я привлекаю положительные и верные дружеские отношения в свою жизнь"),
                Affirmation(text: "Мои друзья и я разделяем взаимное уважение и доверие"),
                Affirmation(text: "Я добрая и заботливая подруга, и получаю то же самое в ответ"),
                Affirmation(text: "Мои дружеские отношения наполнены радостью, смехом и пониманием"),
                Affirmation(text: "Я благодарна за замечательных друзей в моей жизни"),
                Affirmation(text: "Я поддерживаю и дорожу своими дружескими отношениями"),
                Affirmation(text: "Я привлекаю друзей, которые поддерживают и поднимают меня"),
                Affirmation(text: "Мои друзья и я растем вместе в любви и гармонии"),
                Affirmation(text: "Я магнит для настоящих и длительных дружеских отношений")
            ])
        ]
    }
}
    
