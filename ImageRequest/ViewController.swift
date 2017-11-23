//
//  ViewController.swift
//  ImageRequest
//
//  Created by xengar on 2017-11-23.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!
        
        // use "URLSession.shared" to access the shared URLSession
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if error == nil {
                let downloadImage = UIImage(data: data!)
                performUIUpdatesOnMain {
                    self.imageView.image = downloadImage
                }
            } else {
                print("Error loading image")
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

