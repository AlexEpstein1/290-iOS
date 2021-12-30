//
//  focusViewController.swift
//  homework2
//
//  Created by Alex Epstein on 2/11/20.
//  Copyright © 2020 Alex Epstein. All rights reserved.
//

import UIKit

class focusViewController:

UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var changePicture: UIImageView!
    
    var nameText:String = ""
    var tickerText:String = ""
    var priceText:String = ""
    var changeText:String = ""
    var changeImage:UIImage?
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameText
        tickerLabel.text = tickerText
        priceLabel.text = priceText
        changeLabel.text = changeText
        changePicture.image = changeImage
        
        

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
