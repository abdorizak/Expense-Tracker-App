//
//  OnboardingCell.swift
//  Expense Tracker
//
//  Created by Abdirizak Hassan on 12/2/22.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    static let identfier = String(describing: OnboardingCell.self)
    
    private let onBoardingImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubViews(onBoardingImage, titleLabel, descriptionLabel)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        NSLayoutConstraint.activate([
            onBoardingImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            onBoardingImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: onBoardingImage.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        if DeviceTypes.isiPhoneSE {
            onBoardingImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
            onBoardingImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        } else {
            onBoardingImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
            onBoardingImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        }
    }
    
    func display(_ slide: Onboarding) {
        self.onBoardingImage.image = slide.image
        self.titleLabel.text = slide.title
        self.descriptionLabel.text = slide.description
    }
    
}
