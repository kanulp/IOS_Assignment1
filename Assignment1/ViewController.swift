//
//  ViewController.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/26/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var picker_array: [TicketModel] = [TicketModel]()
    var ticketModel : TicketModel?
    var invoiceModel : InvoiceModel?

    
    var selectedPrice : Int = 1170
    var selectedQty : Int = 1

    @IBOutlet var txt_total: UITextView!
    
    @IBOutlet var btn_manager: UIButton!
    
    @IBOutlet var txt_ticket_type: UITextView!
    
    @IBOutlet var picker_ticket_type: UIPickerView!
    
    @IBOutlet var btn_buy: UIButton!
    
    @IBOutlet var txt_quantity: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.picker_ticket_type.delegate = self
        self.picker_ticket_type.dataSource = self
        ticketModel = TicketModel()
        invoiceModel = InvoiceModel()
        picker_array = ticketModel!.getDefaultTicket()
        txt_total.text = "1170"
        txt_quantity.text = "1"
        txt_ticket_type.text = "Balcony"
    }
    
    @IBAction func btn_press(_ sender: Any) {
        let clickedButton = sender as! UIButton
        
        switch clickedButton.currentTitle {
                   
        case "0" :
            txt_quantity.text? = "0"
            selectedQty = 0
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break
        case "1":
            txt_quantity.text? = "1"
            selectedQty = 1
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "2":
            txt_quantity.text? = "2"
            selectedQty = 2
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "3":
            txt_quantity.text? = "3"
            selectedQty = 3
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "4":
            txt_quantity.text? = "4"
            selectedQty = 4
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "5":
            txt_quantity.text? = "5"
            selectedQty = 5
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "6":
            txt_quantity.text? = "6"
            selectedQty = 6
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "7":
            txt_quantity.text? = "7"
            selectedQty = 7
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "8":
            txt_quantity.text? = "8"
            selectedQty = 8
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break

        case "9":
            txt_quantity.text? = "9"
            selectedQty = 9
            setPriceText(qty: selectedQty, amount: selectedPrice)
            break
            
        case "Buy":
            txt_total.text = txt_quantity?.text
            setPriceText(qty: selectedQty, amount: selectedPrice)
            let t  = InvoiceModel()
            t.ticket_type = txt_ticket_type.text as NSString?
            t.ticket_qty = selectedQty
            t.total = Int(txt_total.text)
            t.purchase_date =  String(NSDate().timeIntervalSince1970) as NSString
            InvoiceModel.addInvoice(model: t)
            
//                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

//            let secondViewController = storyBoard.instantiateViewController(withIdentifier: "ManagerViewController") as! ManagerViewController
//
//            let navigation = UINavigationController(rootViewController: secondViewController)
//            self.view.addSubview(navigation.view)
//            self.navigationController?.addChild(navigation)
//
//            navigation.didMove(toParent: self)

            break
            

        default :
            txt_quantity.text? = "qty"
            break
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker_array.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(picker_array[row].ticket_type!) : \(picker_array[row].ticket_price!) $"
        
     }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let valueSelected = picker_array[row].ticket_type.components(separatedBy: " ").first! as String
        txt_ticket_type.text = valueSelected
        selectedPrice = picker_array[row].ticket_price
        
        setPriceText(qty: selectedQty, amount: selectedPrice)
    }

    
    func setPriceText(qty:Int,amount:Int){
        let total = ticketModel?.calculatePrice(qty: qty, amount: amount)
        txt_total.text = String(total!)
    }
    
    
}

