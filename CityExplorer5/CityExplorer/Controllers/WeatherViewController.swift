//
//  WeatherViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit



let weatherKey = "f7041544ac05c263807dccbfbece9420"// 网站分配的apikey
let queryWeather = "http://apis.juhe.cn/simpleWeather/query" //根据城市查询天气
class WeatherViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var wearthLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "天气查询"
        textField.placeholder = "搜索天气"
        textField.text = "淮南"
        view.backgroundColor = UIColor.white
        
    }
    @IBAction func clickSearch(_ sender: AnyObject) {
        if textField.text == nil || textField.text!.characters.count == 0 {
            return
        }
        self.queryWeather(city: textField.text?.trimmingCharacters(in: .whitespaces) ?? "")
    }
    //http://apis.juhe.cn/simpleWeather/query?city=北京&key=f7041544ac05c263807dccbfbece9420
    func queryWeather(city:String) {
        var usrString =  "http://apis.juhe.cn/simpleWeather/query?city=\(city)&key=\(weatherKey)"
        let charSet = CharacterSet.urlQueryAllowed as CharacterSet
        usrString = usrString.addingPercentEncoding(withAllowedCharacters: charSet)!
        //网络
        let dataTask = URLSession.shared.dataTask(with: URL(string:usrString)!) { (data, res, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                return
            }
            do {
                guard let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String :Any],
                   let result = dict["result"] as? [String :Any] else{
                   return
                }
                let city = (result["city"] as? String) ?? "--"
                if let realtime = result["realtime"] as? [String: Any] {
                    let temperature = (realtime["temperature"] as? String) ?? "--"
                     let direct = (realtime["direct"] as? String) ?? "--"
                     let power = (realtime["power"] as? String) ?? "--"
                     let info = (realtime["info"] as? String) ?? "--"
                    DispatchQueue.main.async {
                        self.wearthLabel.text = "城市:\(city)\n温度:\(temperature)\n风力:\(direct)\(power)\n天气:\(info)\n"
                    }
                    
                }
            } catch {
                print(error.localizedDescription)
            }
            
            
            
        }
        dataTask.resume()
    }
    
  
}
