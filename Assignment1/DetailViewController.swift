//
//  DetailViewController.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/30/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
     @IBOutlet var txt_item: UITextView!
    
    
    @IBOutlet var txt_qty: UITextView!
    
    
    @IBOutlet var txt_total: UITextView!
    
    
    @IBOutlet var txt_date: UITextView!
    
    var invoiceModel : InvoiceModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        txt_item.text = invoiceModel?.ticket_type as String?
        
        txt_qty.text = "\(invoiceModel?.ticket_qty ?? 0)" as String?
             
        txt_total.text = "\(invoiceModel?.total ?? 0)" as String?
                    
        let formatter = DateFormatter()
        let yourDate = NSDate()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
        
        let timeStamp = dateFormatter.string(from: invoiceModel!.purchase_date! as Date)

        
        txt_date.text = timeStamp
                    
        
    }
    
    

}
