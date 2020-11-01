//
//  InvoiceModel.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/26/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import Foundation

class InvoiceModel : NSObject {
        
    var ticket_type: NSString!
    
    var ticket_qty: NSInteger!

    var total: NSInteger!
    
    var purchase_date : NSDate!
    
    public static var invoiceList: [InvoiceModel] = []

       public static var count: Int {
           return invoiceList.count
       }

       public static func addInvoice(model : InvoiceModel) {
           invoiceList.append(model)
       }
    public static func getInvoiceList() -> [InvoiceModel]{
        return invoiceList
    }
}
