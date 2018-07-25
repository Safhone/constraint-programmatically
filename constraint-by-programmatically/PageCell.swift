//
//  PageCell.swift
//  constraint-by-programmatically
//
//  Created by Safhone on 7/25/18.
//  Copyright © 2018 KOSIGN. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            approvalImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: ("\n\n\n\(unwrappedPage.bodyText)"), attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText  = attributedText
            descriptionTextView.textAlignment   = .center
        }
    }
    
    private let approvalImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "1"))
        
        imageView.contentMode                               = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.isEditable                                 = false
        textView.isScrollEnabled                            = false
        textView.translatesAutoresizingMaskIntoConstraints  = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLayout()
        
    }
    
    private func setUpLayout() {
        
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints                                 = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive                         = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive                 = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive               = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive  = true
        topImageContainerView.addSubview(approvalImageView)
        
        approvalImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive                   = true
        approvalImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive                   = true
        approvalImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive    = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive                  = true
        descriptionTextView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive       = true
        descriptionTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive    = true
        descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive    = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
