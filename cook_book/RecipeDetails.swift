//
//  RecipeDetails.swift
//  cook_book
//
//  Created by Ankan Saha on 24/12/22.
//

import UIKit

class RecipeDetails: UIViewController {


    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var photo: UILabel!
    @IBOutlet weak var ingridents: UILabel!
    @IBOutlet weak var process1: UITextView!
    
    var recipeNameCame = ""
    var photoCame = ""
    var ingridentsCame = ""
    var processCame = ""
    
    
    @IBAction func deleteData(_ sender: Any) {
//        print("delete world" ,  recipeName.text, "   ", recipeNameCame)
        var flag = DatabaseManager.getInstance().deleteData(withID: recipeNameCame)
        print(flag)
    }
    @IBAction func editData(_ sender: Any) {
//        print("edit world")

        if let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeEdit") as? RecipeEdit{
            vc.recipeNameCame = recipeNameCame
            vc.processCame = processCame
            vc.ingridentsCame = ingridentsCame
            vc.photoCame = photoCame
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeName.text = recipeNameCame
        photo.text = photoCame
        ingridents.text = ingridentsCame
        process1.text = processCame
        // Do any additional setup after loading the view.
        
        print(recipeNameCame)
        print(ingridentsCame)
        print(processCame)
        print(photoCame)

    }

}
