//
//  HistoryViewController.swift
//  Assignment1
//
//  Created by Karan Gajjar on 10/29/20.
//  Copyright © 2020 Karan Gajjar. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    let cellReuseIdentifier = "cell"

    var list : [InvoiceModel]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let qty = "\(list?[indexPath.row].ticket_qty ?? 0)"
        let title = self.list?[indexPath.row].ticket_type as String?
        
        let cell: UITableViewCell = {
                 guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
                    return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellReuseIdentifier)
                 }
                 return cell
             }()
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = qty
        
        return cell
    }
    // method to run when table view cell is tapped
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             print("You tapped cell number \(indexPath.row).")
            
            

            let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
            
            detailViewController?.invoiceModel = (list?[indexPath.row])! as InvoiceModel
            
            self.navigationController?.pushViewController(detailViewController!, animated: true)
            
            
         }
 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        list = InvoiceModel.getInvoiceList()
    }
    
    
    
    
    

    
    

}
