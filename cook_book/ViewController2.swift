//
//  ViewController2.swift
//  cook_book
//
//  Created by Ankan Saha on 12/12/22.
//

import UIKit

class ViewController2: UIViewController{
    var recipes = DatabaseManager.getInstance().fetchData()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension ViewController2: UITableViewDelegate{
  // func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //    print("you tapped on "+recipes[indexPath.row].recipe_name)
   //}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeDetails") as? RecipeDetails{
            vc.recipeNameCame = recipes[indexPath.row].recipe_name
            vc.processCame = recipes[indexPath.row].process
            vc.ingridentsCame = recipes[indexPath.row].ingredients
            vc.photoCame = recipes[indexPath.row].photo
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController2: UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = recipes[indexPath.row].recipe_name
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeDetails") as? RecipeDetails{
//            vc.recipeNameCame = recipes[indexPath.row].recipe_name
//            vc.processCame = recipes[indexPath.row].process
//            vc.ingridentsCame = recipes[indexPath.row].ingredients
//            vc.photoCame = recipes[indexPath.row].photo
//
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}
