//
//  ResetViewController.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/30/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var picker_array: [TicketModel] = [TicketModel]()
    var selectedQty : Int?
    var selectedRow : Int?
    
    
    @IBOutlet var edit_ticket: UITextField!
    @IBOutlet var btn_cancel: UIButton!
    @IBOutlet var btn_ok: UIButton!
    @IBOutlet var picker_view: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker_view.delegate = self
        self.picker_view.dataSource = self
              
        picker_array = TicketModel.tickets!
        edit_ticket.text = "12"
    }
    
    
    
    
    @IBAction func btn_press(_ sender: Any) {
        
        let clickedButton = sender as! UIButton
              
        switch clickedButton.currentTitle {
                         
            case "Cancel" :
                edit_ticket.text = "\(picker_array[selectedRow!].ticket_qty!)"
                break
            case "OK" :
                showAlert()
                let newQty = edit_ticket.text
                TicketModel.tickets![selectedRow!].ticket_qty = Int(newQty!)
                picker_view.reloadAllComponents()
                break
        default :
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
        
        let type = "\(picker_array[row].ticket_type!)"
        let qty = "\(picker_array[row].ticket_qty!)"
        let price = "\(picker_array[row].ticket_price!)"
    
        return "\(type) \(qty) price : \(price) $"
        
     }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let valueSelected = picker_array[row].ticket_qty
        edit_ticket.text = "\(valueSelected ?? 0)"
        selectedRow = row
        
    }
    func showAlert() {
         let alert = UIAlertController(title: "Success", message: "Ticket quantity updated successfully.", preferredStyle: UIAlertController.Style.alert)

               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               // show the alert
               self.present(alert, animated: true, completion: nil)
    }
}
