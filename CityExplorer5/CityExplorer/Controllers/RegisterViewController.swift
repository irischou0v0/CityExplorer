//
//  RegisterViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/24.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passWordTF: UITextField!
    
    @IBAction func clickRegister(_ sender: Any) {
        guard let user = accountTF.text,
            user.characters.count > 0 else {
                showALertVC(msg: "账号错误")
                return
        }
        guard let passWord = passWordTF.text,
            passWord.characters.count > 0 else {
                showALertVC(msg: "密码错误")
                return
        }
        
        let userKey = "user_" + user
        //找到说明注册过
        if let value = UserDefaults.standard.object(forKey: userKey) as? String{
            showALertVC(msg: "账号已存在,注册失败")
        } else {
            UserDefaults.standard.set(passWord, forKey: userKey)
            let alertVC = UIAlertController.init(title: "提示", message: "注册成功", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "知道了", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showALertVC(msg:String)  {
        let alertVC = UIAlertController.init(title: "提示", message: msg, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "知道了", style: .default, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }

}
