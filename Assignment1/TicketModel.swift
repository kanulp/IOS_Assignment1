//
//  TicketModel.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/26/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import Foundation

class TicketModel : NSObject {
    
    var ticket_type: NSString!

    var ticket_price: NSInteger!
    
    var ticket_qty : NSInteger!
    
    static var tickets : [TicketModel]? = [TicketModel]()
    
    
    func calculatePrice(qty:Int,amount:Int) -> Int {
        return qty*amount
    }
    
    //with this we can change any data of the ticket qty and price too!
     static func getDefaultTicket(){
                
        let ticketModel = TicketModel()
        ticketModel.ticket_type = "Balcony Level"
        ticketModel.ticket_qty = 12
        ticketModel.ticket_price = 1170
        
        let ticketModel2 = TicketModel()
        ticketModel2.ticket_type = "Lower Level"
        ticketModel2.ticket_qty = 20
        ticketModel2.ticket_price = 10434
        
        let ticketModel3 = TicketModel()
        ticketModel3.ticket_type = "Courtside"
        ticketModel3.ticket_qty = 15
        ticketModel3.ticket_price = 27777
        
        tickets?.append(ticketModel)
        tickets?.append(ticketModel2)
        tickets?.append(ticketModel3)

        
    }
}
