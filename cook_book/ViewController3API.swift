//
//  ViewController3API.swift
//  cook_book
//
//  Created by Ankan Saha on 13/12/22.
//

import Foundation
import UIKit

class ViewController3API:
    UIViewController {
    @IBOutlet weak var textLabal: UILabel!
    

    
//    init(your_property: String)
//    {
//        self.your_property = your_property
//        super.init(nibName: nil, bundle:nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabal.text = "hdslkfj"
        
        
        let url = "https://catfact.ninja/fact"

        
        getData(from: url)
    }
    
    private func getData(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard var data = data, error == nil else {
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
            
            guard var json = result else {
                return
            }
            
            print(json.fact)
            print(json.length)
            
        })
            
        task.resume()
    }

    
    @IBAction func textButton(_ sender: UIButton) {
        textLabal.text = "hello world"
    }
    
}

struct Response: Codable {
    var fact: String
    var length: Int
}
