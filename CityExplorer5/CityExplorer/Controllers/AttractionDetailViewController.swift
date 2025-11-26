//
//  AttractionDetailViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AttractionDetailViewController: UIViewController {
    
    var attraction: AttractionModel!
    var playerViewController: AVPlayerViewController?
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLab: UILabel!
    
    @IBOutlet weak var timeLab: UILabel!
    
    @IBOutlet weak var addressLab: UILabel!
    
    @IBOutlet weak var descriptionLab: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = attraction.name
        view.backgroundColor = UIColor.white
        
        setupContent()
    }
    
    
    func setupContent() {
        
        // 图片
        imageV.layer.masksToBounds = true
        if let image = UIImage(named: attraction.imageName) {
            imageV.image = image
        } else {
            imageV.backgroundColor = UIColor.lightGray
        }
        
        
        // 名称和评分
        
        nameLabel.text = attraction.name
        
        ratingLab.text = "评分：⭐ \(attraction.rating)"
        
        // 开放时间
        timeLab.text = "开放时间：\(attraction.openTime) - \(attraction.closeTime)"
        
        // 地址
        addressLab.text = "地址：\(attraction.address)"
        

        // 介绍
        
        descriptionLab.text = attraction.description
        
        // 用户评论标题
        //commentsTitleLabel.text = "用户评论"
        
        // 评论列表
//        if let comment = attraction.comments.first {
//            let commentView = createCommentView(comment: comment)
//            contentView.addSubview(commentView)
//            contentView.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                commentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//                commentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                commentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//                commentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//                ])
//
//        }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        var topAnchor  : NSLayoutYAxisAnchor = contentView.topAnchor
        for (index, comment) in attraction.comments.enumerated() {
            let commentView = createCommentView(comment: comment)
            contentView.addSubview(commentView)
            
            NSLayoutConstraint.activate([
                commentView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                commentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                commentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                
                ])
            if (index == (attraction.comments.count - 1)) {
                NSLayoutConstraint.activate([
                   commentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
                    ])
                
            }
            topAnchor = commentView.bottomAnchor
        }
        
    
        
        
    }
    
    
    @IBAction func clickPlay(_ sender: AnyObject) {
        playVideo()
    }
    
    
    func createCommentView(comment: Comment) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        containerView.layer.cornerRadius = 8
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let usernameLabel = UILabel()
        usernameLabel.text = comment.username
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(usernameLabel)
        
        let ratingLabel = UILabel()
        ratingLabel.text = "⭐ \(comment.rating)"
        ratingLabel.font = UIFont.systemFont(ofSize: 12)
        ratingLabel.textColor = UIColor.orange
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(ratingLabel)
        
        let contentLabel = UILabel()
        contentLabel.text = comment.content
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.numberOfLines = 0
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(contentLabel)
        
        let dateLabel = UILabel()
        dateLabel.text = comment.date
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = UIColor.gray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            ratingLabel.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            contentLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: ratingLabel.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: contentLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentLabel.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
            ])
        
        return containerView
    }
    
    @objc func playVideo() {
        
        if let videoUrl = Bundle.main.url(forResource: self.attraction.videoURL, withExtension: nil) {
            playerViewController = AVPlayerViewController()
            let player = AVPlayer.init(url: videoUrl)
            playerViewController?.player = player
            self.present(playerViewController!, animated: true, completion: {
                player.play()
            })
        }
        
    }
}

