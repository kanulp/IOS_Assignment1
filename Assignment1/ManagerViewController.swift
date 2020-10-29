//
//  ManagerViewController.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/29/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import UIKit

class ManagerViewController : UIViewController {
    
    
    @IBOutlet var btn_history: UIButton!
    
    @IBOutlet var btn_reset: UIButton!
    
    
    @IBAction func btn_press(_ sender: Any) {
        
        let clickedButton = sender as! UIButton
               
               switch clickedButton.currentTitle {
                          
               case "History" :
               
                   break
                
               case "Reset" :
                
                break
                
               default:
                break
                
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
