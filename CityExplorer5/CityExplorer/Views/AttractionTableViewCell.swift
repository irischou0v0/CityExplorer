//
//  AttractionTableViewCell.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var attractionImageV: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    
    @IBOutlet weak var ratingLab: UILabel!
    
    @IBOutlet weak var addressLab: UILabel!
    
    /*
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
      // setupViews()
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
  
    

    func setupAttractionModel(attraction : AttractionModel) {
        
        nameLab.text = attraction.name
        ratingLab.text = "⭐ \(attraction.rating)"
        addressLab.text = attraction.address
        
        // 加载图片（实际项目中应该从网络或资源文件加载）
        if let image = UIImage(named: attraction.imageName) {
            attractionImageV.image = image
        } else {
            // 使用占位图
            attractionImageV.image = UIImage(named: "placeholder")
            attractionImageV.backgroundColor = UIColor.lightGray
        }

    }
  
    
    
}

