//
//  APIController.swift
//  cook_book
//
//  Created by Ankan Saha on 26/12/22.
//

import UIKit
import Foundation

class APIController: UIViewController {
    
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var ingredients: UILabel!
    @IBOutlet weak var process: UITextView!
    
    public var recipeNameNew: String = ""
    public var processNew: String = ""
    public var ingredientsNew: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var randomValue =  arc4random()%5
        var links:[String] = ["https://mocki.io/v1/ba66ffa8-7f87-44de-839b-34a8a538a870",
                              "https://mocki.io/v1/ba66ffa8-7f87-44de-839b-34a8a538a870",
                              "https://mocki.io/v1/ba66ffa8-7f87-44de-839b-34a8a538a870",
                              "https://mocki.io/v1/ba66ffa8-7f87-44de-839b-34a8a538a870",
                              "https://mocki.io/v1/ba66ffa8-7f87-44de-839b-34a8a538a870"]
        
        
        print("getting data for \(randomValue)")
        getData(from: links[Int(randomValue)])
        
        print("after getdata function")
        print(recipeNameNew)
        
        
        
        
        
        
        
        
        
        
        let task = URLSession.shared.dataTask(with: URL(string: links[Int(randomValue)])!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            print("Data:")
            print(json.recipeName)
            print(json.process)
            print(json.ingredients)
            
            
            self.recipeName.text = json.recipeName
            self.process.text = json.process
            self.ingredients.text = json.ingredients
            
            print(self.recipeNameNew, json.recipeName)
            
        })
            
        task.resume()
        
        
        
        
        
        
        
        
        
        
        
        
        
//        recipeName.text = "ONline reci"
//        ingredients.text = ingredientsNew
//        process.text = processNew
        
    }
    
    
    private func getData(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            print("Data:")
            print(json.recipeName)
            print(json.process)
            print(json.ingredients)
            
            self.recipeNameNew = json.recipeName
            self.processNew = json.process
            self.ingredientsNew = json.ingredients
            
            print(self.recipeNameNew, json.recipeName)
            
        })
            
        task.resume()
    }
    
    
    @IBAction func callAPI(_ sender: Any) {
        print("API button is working")
        let url = "https://mocki.io/v1/ba66ffa8-7f87-44de-839b-34a8a538a870"
        getData(from: url)
    }
}

struct Response: Codable {
    
    var recipeName: String
    var process: String
    var ingredients: String
}

