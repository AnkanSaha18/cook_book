//
//  DatabaseManager.swift
//  cook_book
//
//  Created by Ankan Saha on 12/12/22.
//

import Foundation
import SimpleToast
import SwiftUI

var shareInstance = DatabaseManager()

class DatabaseManager: NSObject{
    private var showToast = false
    
    private let toastOptions = SimpleToastOptions(
        alignment: .top,
        hideAfter: 2,
        backdropColor: Color.blue.opacity(0.2),
        animation: .default,
        modifierType: .slide
    )
    
    
    
    
    
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager{
        if shareInstance.database == nil
        {
            shareInstance.database = FMDatabase(path: Util.getPath("recipe_app.db"))
        }
        return shareInstance
    }
    
    func saveData(_ modelInfo:recipe_model)->Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO recipe_app(recipe_name,ingridents,process,photo) VALUES (?,?,?,?)", withArgumentsIn: [modelInfo.recipe_name, modelInfo.ingredients, modelInfo.process, modelInfo.photo])
        shareInstance.database?.close()
        return isSave!
    }
    
    func fetchData() -> [recipe_model]
    {
        shareInstance.database?.open()
        _ = "SELECT * FROM recipe_app;"
                
        var recipes: [recipe_model]!

        if ((shareInstance.database?.open()) != nil)
        {
            let query = "select * from recipe_app"

            do {
                let results = try shareInstance.database?.executeQuery(query, values:nil)
                
                
                while (true)
                {
                    results?.next()
                    let recipe = recipe_model(recipe_name: results?.string(forColumn: "recipe_name") ?? "none", ingredients: results?.string(forColumn: "ingridents") ?? "none", process: results?.string(forColumn: "process") ?? "none", photo: results?.string(forColumn: "photo") ?? "none")
                    
                    if recipes == nil {
                        recipes = [recipe_model]()
                    }
                    if (recipe.recipe_name == "none")
                    {
                        break
                    }
                    
                    print(recipe.recipe_name)
                    
                    recipes.append(recipe)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }

        
        return recipes
    }
    
    func deleteData(withID NAME: String) -> Bool {
        var deleted = false
        
        if ((shareInstance.database?.open()) != nil)
        {
            let query = "delete from recipe_app where recipe_name like '\(NAME)';"
//            print(query)
            
            do{
                try shareInstance.database?.executeUpdate(query, values: nil)
                deleted = true
                showToast.toggle()
            }
            catch{
                print(error.localizedDescription)
            }
        }
        return deleted
    }
    func editData(oldRecipeName: String, recipeName: String, process: String, ingridents: String, photo: String ) -> Bool{
        var edited = false
        if(shareInstance.database?.open() != nil)
        {
            let query = "update recipe_app set recipe_name = '\(recipeName)', process = '\(process)', ingridents = '\(ingridents)', photo = '\(photo)' where recipe_name = '\(oldRecipeName)';"
//            print(query)
            
            do{
                try shareInstance.database?.executeUpdate(query, values: nil)
                edited = true
                showToast.toggle()
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
        return edited
    }
}
