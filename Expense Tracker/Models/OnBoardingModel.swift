//
//  OnBoardingModel.swift
//  Expense Tracker
//
//  Created by Abdirizak Hassan on 12/2/22.
//

import UIKit

struct Onboarding {
    let title: String
    let description: String
    let image: UIImage
}


struct MockData {
    static let onBoardingData: [Onboarding] = [
        .init(title: "Controll You Expense", description: "Control your expenses better than your competition. This is where you can always find the competitive advantage.", image: UIImage(named: "OnboardingImage4")!),
        .init(title: "Plan Your Mothly Expense", description: "I am indeed rich, since my income is superior to my expenses, and my expense is equal to my wishes.", image: UIImage(named: "OnboardingImage3")!),
        .init(title: "Spending More Money!!", description: "I'm not a big spender or shopper. Neither am I extravagant, nor do I have big expenses. I mainly spend on travel. I don't buy overpriced clothes, as I feel such expenses are unnecessary. I probably wouldn't buy expensive watches or jewellery either.", image: UIImage(named: "OnboardingImage4")!),
        .init(title: "Your Profit..!", description: "The Profit and Loss Statement tells you a lot about how your business is doing. It can also help you to determine ways that you can go about saving money so that you get to bring more money home! Basically, the P&L statement measures all of your income sources verses all your business expenses for any given period of time.", image: UIImage(named: "OnboardingImage1")!)
    ]
}
