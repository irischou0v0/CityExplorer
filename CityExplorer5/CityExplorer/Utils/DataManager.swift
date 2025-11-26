//
//  DataManager.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    // 模拟景点数据（使用北京的数据作为示例，用户可以根据自己的城市修改）
    var attractions: [AttractionModel] = []
    
    private init() {
        loadAttractions()
    }
    
    func loadAttractions() {
        attractions = [
            AttractionModel(
                id: "2",
                name: "八公山风景区",
                description: "八公山位于淮南市八公山区，是国家AAAA级旅游景区，以深厚的历史文化底蕴和独特的自然景观闻名。这里是淝水之战的古战场，也是豆腐的发源地，素有'风声鹤唳，草木皆兵'的典故出处。",
                imageName: "bagongshan",
                rating: 4.6,
                address: "淮南市八公山区八公山镇",
                openTime: "08:00",
                closeTime: "17:30",
                videoURL: "bagongshan.mp4",
                comments: [
                    Comment(username: "历史爱好者", content: "历史文化底蕴深厚，风景也很美！", rating: 4.8, date: "2024-03-20"),
                    Comment(username: "登山客", content: "爬山锻炼的好地方，空气清新。", rating: 4.5, date: "2024-03-15")
                ]
            ),
            
            AttractionModel(
                id: "3",
                name: "焦岗湖旅游景区",
                description: "焦岗湖是淮河流域最大的天然淡水湖，被誉为'华东白洋淀'。景区内荷花淀、芦苇荡纵横交错，水鸟栖息，是集生态观光、休闲度假、水上娱乐为一体的综合性旅游区。",
                imageName: "jiaoganghu",
                rating: 4.4,
                address: "淮南市毛集实验区",
                openTime: "08:30",
                closeTime: "18:00",
                videoURL: "bagongshan.mp4",
                comments: [
                    Comment(username: "摄影爱好者", content: "荷花盛开时特别美，拍照绝佳地点！", rating: 4.7, date: "2024-07-10"),
                    Comment(username: "家庭游客", content: "带孩子来玩很合适，环境优美。", rating: 4.3, date: "2024-06-25")
                ]
            ),
            
            AttractionModel(
                id: "4",
                name: "寿县古城墙",
                description: "寿县古城墙是中国现存保存完好的宋代古城墙之一，始建于北宋时期。城墙周长7147米，高8.33米，具有重要的历史价值和建筑艺术价值，被誉为'地下博物馆'。",
                imageName: "guchengqiang",
                rating: 4.5,
                address: "淮南市寿县古城内",
                openTime: "全天",
                closeTime: "全天",
                videoURL: "bagongshan.mp4",
                comments: [
                    Comment(username: "古建筑迷", content: "宋代城墙保存这么完整很难得！", rating: 4.8, date: "2024-04-05"),
                    Comment(username: "文化探索者", content: "走在城墙上能感受到历史的厚重。", rating: 4.4, date: "2024-03-28")
                ]
            ),
            
            AttractionModel(
            id: "5",
            name: "龙湖公园",
            description: "龙湖公园是淮南市最大的综合性公园，以龙湖为主体，园内亭台楼阁、小桥流水相映成趣。公园分为休闲区、游乐区、观赏区等多个功能区域，是市民休闲娱乐的重要场所。",
            imageName: "longhugongyuan",
            rating: 4.3,
            address: "淮南市田家庵区洞山中路",
            openTime: "06:00",
            closeTime: "22:00",
            videoURL: "bagongshan.mp4",
            comments: [
            Comment(username: "本地居民", content: "每天散步的好地方，环境很舒服。", rating: 4.5, date: "2024-05-12"),
            Comment(username: "游客", content: "公园很大，适合全家一起来玩。", rating: 4.2, date: "2024-05-08")
            ]
            ),
            
          
            
            AttractionModel(
                id: "6",
                name: "淮南煤矿博物馆",
                description: "淮南煤矿博物馆是中国第一座大型煤矿遗址博物馆，完整保留了近代煤矿工业遗址。馆内展示了淮南煤矿百年发展历史、采矿工艺演变以及矿工生活场景，是了解中国煤炭工业发展的重要窗口。",
                imageName: "coal_museum",
                rating: 4.2,
                address: "淮南市大通区矿南路",
                openTime: "09:00",
                closeTime: "17:00",
                videoURL: "bagongshan.mp4",
                comments: [
                    Comment(username: "工业史爱好者", content: "很有教育意义，能深入了解煤矿历史。", rating: 4.5, date: "2024-02-18"),
                    Comment(username: "学生家长", content: "带孩子来学习科普知识很不错。", rating: 4.0, date: "2024-02-12")
                ]
            ),
            
            AttractionModel(
            id: "7",
            name: "茅仙洞风景区",
            description: "茅仙洞是八公山国家森林公园的核心景区，因汉代茅盈、茅固、茅衷三兄弟在此修道成仙而得名。洞内钟乳石千姿百态，道教文化底蕴深厚，是集自然景观与人文景观为一体的旅游胜地。",
            imageName: "maoxiandong",
            rating: 4.4,
            address: "淮南市凤台县茅仙洞景区",
            openTime: "08:00",
            closeTime: "17:00",
            videoURL: "bagongshan.mp4",
            comments: [
            Comment(username: "道教文化迷", content: "道教氛围浓厚，洞内景观很神奇。", rating: 4.6, date: "2024-06-08"),
            Comment(username: "登山爱好者", content: "爬山探洞一次满足，很有意思。", rating: 4.3, date: "2024-06-01")
            ]
            ),
            
            AttractionModel(
            id: "8",
            name: "舜耕山国家森林公园",
            description: "舜耕山因传说舜帝曾在此耕作而得名，是淮南市的城市绿肺。公园森林覆盖率达95%，拥有丰富的动植物资源，登山步道、观景平台等设施完善，是市民休闲健身的理想场所。",
            imageName: "shungengshan",
            rating: 4.3,
            address: "淮南市田家庵区舜耕中路",
            openTime: "06:00",
            closeTime: "18:30",
            videoURL: "bagongshan.mp4",
            comments: [
            Comment(username: "健身达人", content: "每天早上来爬山，空气特别好！", rating: 4.5, date: "2024-04-20"),
            Comment(username: "自然爱好者", content: "城市中的天然氧吧，很舒服。", rating: 4.2, date: "2024-04-15")
            ]
            ),
            
            AttractionModel(
            id: "9",
            name: "淮南豆腐文化园",
            description: "作为豆腐的发源地，淮南豆腐文化园集中展示了豆腐制作工艺的历史演变。游客可以参观传统豆腐作坊，体验豆腐制作过程，品尝各种豆腐美食，深入了解这一传统美食的文化内涵。",
            imageName: "tofu_culture",
            rating: 4.1,
            address: "淮南市八公山区豆腐村",
            openTime: "09:00",
            closeTime: "17:30",
            videoURL: "bagongshan.mp4",
            comments: [
            Comment(username: "美食爱好者", content: "豆腐宴很特别，味道很正宗！", rating: 4.3, date: "2024-08-10"),
            Comment(username: "文化体验者", content: "亲手做豆腐的体验很有趣。", rating: 4.0, date: "2024-08-05")
            ]
            ),
            
            AttractionModel(
            id: "10",
            name: "淮河风情带",
            description: "淮河风情带沿淮河而建，是淮南市重点打造的滨水景观带。这里集观光休闲、文化展示、生态保护于一体，夜晚灯光璀璨，是欣赏淮河风光、感受淮河文化的绝佳地点。",
            imageName: "huaihe_river",
            rating: 4.2,
            address: "淮南市田家庵区淮河大道",
            openTime: "全天",
            closeTime: "全天",
            videoURL: "bagongshan.mp4",
            comments: [
            Comment(username: "夜景摄影", content: "晚上的灯光很美，拍照很出片。", rating: 4.4, date: "2024-09-12"),
            Comment(username: "散步爱好者", content: "傍晚沿着河边散步很惬意。", rating: 4.1, date: "2024-09-08")
            ]
            ),
        ]
    }
    
    func getAttraction(by id: String) -> AttractionModel? {
        return attractions.first { $0.id == id }
    }
}

