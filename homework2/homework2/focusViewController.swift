//
//  focusViewController.swift
//  homework2
//
//  Created by Alex Epstein on 2/11/20.
//  Copyright © 2020 Alex Epstein. All rights reserved.
//

import UIKit

class focusViewController: UIViewController {
    
    
    var cityText:String = ""
    var tempText:String = ""
    var weatherPicture: UIImage?

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLabel.text = cityText
        tempLabel.text = tempText
        weatherImage.image = weatherPicture

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
