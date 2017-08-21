//
//  TextLabelCell.swift
//  CollectionViewDemo
//
//  Created by fei on 2017/8/21.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class TextLabelCell: UICollectionViewCell {
        
    @IBOutlet var contentLbl: UILabel!
    @IBOutlet var backView: UIView!

    override func awakeFromNib() {
        backView.layer.borderWidth = 1;
        backView.layer.borderColor = UIColor.lightGray.cgColor;
    }
    
    
    func cellStatusWithSelected(selected:Bool) {
        if selected {
            backView.layer.borderColor = UIColor.red.cgColor;
            contentLbl.textColor = UIColor.red;
        } else {
            backView.layer.borderColor = UIColor.lightGray.cgColor;
            contentLbl.textColor = UIColor.lightGray;
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        attributes.frame = CGRect(x: 0, y: 0, width:NSString(string: contentLbl.text!).size(attributes: [NSFontAttributeName:contentLbl.font]).width+42, height: 40)
            
//            NSString(string: contentLbl.text!).boundingRect(with: CGSize(width: intmax_t(), height: 40), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:contentLbl.font], context: nil)
        return attributes
        
    }
}

