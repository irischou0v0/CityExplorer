//
//  AttractionsListViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class AttractionsListViewController: UIViewController {
    
    var attractions: [AttractionModel] = []
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "城市景点"
        view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 120
        
        // 加载数据
        attractions = DataManager.shared.attractions
    }
    
    func setupTableView() {
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // tableView.reloadData()
    }
}

extension AttractionsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionTableViewCell", for: indexPath) as! AttractionTableViewCell
        let attraction = attractions[indexPath.row]
        cell.setupAttractionModel(attraction: attraction)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAttractionDetailViewController" ,
           let vc = segue.destination as? AttractionDetailViewController,
           let row = tableView.indexPathForSelectedRow?.row{
            let attraction = attractions[row]
            vc.attraction = attraction
        }
    }
}

