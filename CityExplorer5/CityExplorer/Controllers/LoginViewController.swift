//
//  LoginViewController.swift
//  CityExplorer
//
//  Created by apple on 2025/11/24.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var accountTF: UITextField!
    
    @IBOutlet weak var passWordTF: UITextField!
    
    @IBAction func clickLogin(_ sender: Any) {
        guard let user = accountTF.text,
         user.characters.count > 0 else {
            showALertVC(msg: "账号错误")
            return
        }
        guard let passWord = passWordTF.text,
            passWord.characters.count  > 0 else {
                showALertVC(msg: "密码错误")
                return
        }
        
        let userKey = "user_" + user
        userKey
        //找到说明注册过
        if let value = UserDefaults.standard.object(forKey: userKey) as? String,
            value == passWord{
            UserDefaults.standard.set(userKey, forKey: "CurrentAccount")
            //登录成功
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let tabbarVC = storyBoard.instantiateViewController(withIdentifier: "tabbarVC")
            UIApplication.shared.windows.first?.rootViewController = tabbarVC
            
        } else {
            showALertVC(msg: "账号或密码不正确")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         accountTF.text = "123"
        passWordTF.text = "123"
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
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
