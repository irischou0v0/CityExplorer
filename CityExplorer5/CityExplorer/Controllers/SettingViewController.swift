//
//  SettingViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/24.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var accountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let account = UserDefaults.standard.object(forKey: "CurrentAccount") as? String {
            let startIndex = account.index(account.startIndex, offsetBy: 5)
            let user = account.substring(from: startIndex)
            accountLabel.text = "当前账号:\(user)\n" + "邮箱:123456@qq.com"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickAbout(_ sender: Any) {
    }
    
    @IBAction func clickFeek(_ sender: Any) {
    }
    
    
    @IBAction func clickTuiChu(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "CurrentAccount")
        //登录成功
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let loginVC = storyBoard.instantiateInitialViewController()
        UIApplication.shared.windows.first?.rootViewController = loginVC
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
