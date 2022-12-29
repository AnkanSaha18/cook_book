//
//  LoginController.swift
//  cook_book
//
//  Created by Ankan Saha on 27/12/22.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var passlogin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passlogin.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
