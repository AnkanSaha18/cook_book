//
//  ViewController.swift
//  cook_book
//
//  Created by Ankan Saha on 12/12/22.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var recipe_name: UITextField!
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var process: UITextField!
    @IBOutlet weak var photo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world!")
//        var text : Util = Util()
//        (text.getPath("recipe_app.db"))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIButton) {
        let modelInfo = recipe_model(recipe_name: recipe_name.text!, ingredients: ingredients.text!, process: process.text!, photo: photo.text!)
        
        let isSave = DatabaseManager.getInstance().saveData(modelInfo)
        print(isSave)
        print("In save")
        
        
//        DatabaseManager.getInstance().fetchData()
//        DatabaseManager.getInstance().deleteData(withID: 32)
    }


}

