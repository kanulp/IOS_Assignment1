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
    
    
    func calculatePrice(qty:Int,amount:Int) -> Int {
        return qty*amount
    }
    
    func getDefaultTicket() -> [TicketModel] {
        let ticketModel = TicketModel()
        ticketModel.ticket_type = "Balcony Level Ticket 12 Price"
        ticketModel.ticket_price = 1170
        
        let ticketModel2 = TicketModel()
        ticketModel2.ticket_type = "Lower Level Ticket 20 Price"
        ticketModel2.ticket_price = 10434
        
        let ticketModel3 = TicketModel()
        ticketModel3.ticket_type = "Courtside 15 Price"
        ticketModel3.ticket_price = 27777
        
        var array = [TicketModel]()
        array.append(ticketModel)
        array.append(ticketModel2)
        array.append(ticketModel3)

        return array
    }
    
}
