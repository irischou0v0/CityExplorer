//
//  ToolsViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let tools = [
        ToolItem(name: "天气查询", icon: "weather", type: .weather),
        ToolItem(name: "货币换算", icon: "currency", type: .currency),
        ToolItem(name: "简单翻译", icon: "translate", type: .translate),
        ToolItem(name: "地图导航", icon: "map", type: .map)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "实用工具"
        view.backgroundColor = UIColor.white
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width - 60) / 2, height: 120)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}

extension ToolsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tools.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToolCollectionViewCell", for: indexPath) as! ToolCollectionViewCell
        cell.configure(with: tools[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let tool = tools[indexPath.item]
        
        switch tool.type {
        case .weather:
               self.performSegue(withIdentifier: "toWeatherViewController", sender: nil)
        case .currency:
            showAlert(title: "货币换算", message: "此功能待开发")
        case .translate:
            showAlert(title: "简单翻译", message: "此功能待开发")
        case .map:
            showAlert(title: "地图导航", message: "此功能待开发")
        }
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default))
        present(alert, animated: true)
    }
    
   
    
}

struct ToolItem {
    let name: String
    let icon: String
    let type: ToolType
}

enum ToolType {
    case weather
    case currency
    case translate
    case map
}

