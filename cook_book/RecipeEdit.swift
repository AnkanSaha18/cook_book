//
//  RecipeEdit.swift
//  cook_book
//
//  Created by Ankan Saha on 25/12/22.
//

import UIKit

class RecipeEdit: UIViewController {

    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var ingridents: UITextField!
    @IBOutlet weak var process: UITextField!
    @IBOutlet weak var photo: UITextField!

    
    var recipeNameCame = ""
    var photoCame = ""
    var ingridentsCame = ""
    var processCame = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeName.text=recipeNameCame
        ingridents.text=ingridentsCame
        process.text=processCame
        photo.text=photoCame

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirm(_ sender: UIButton) {
//        print("hello in edition page  ", recipeName.text!)
        var flag = DatabaseManager.getInstance().editData(oldRecipeName: recipeNameCame, recipeName: recipeName.text!, process: process.text!, ingridents: ingridents.text!, photo: photo.text!)
        print(flag)
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
