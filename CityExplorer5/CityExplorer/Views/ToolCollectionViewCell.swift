//
//  ToolCollectionViewCell.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class ToolCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    
   
 
    
    func configure(with tool: ToolItem) {
        contentView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        

        nameLab.text = tool.name
        
        // 加载图标（实际项目中应该从资源文件加载）
        if let image = UIImage(named: tool.icon) {
            imageV.image = image
        } else {
            // 使用系统图标作为占位
            //imageV.image =
            //imageV.image.tintColor = UIColor.gray
        }
    }
}

