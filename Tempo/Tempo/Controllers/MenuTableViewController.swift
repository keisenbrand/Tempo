//
//  MenuTableViewController.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/26/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var brands = [["brand_name": "Coastal Living", "type": "COASTAL_LIVING"], ["brand_name": "Cooking Light", "type": "COOKING_LIGHT"], ["brand_name": "Entertainment Weekly", "type": "EW"], ["brand_name": "Extra Crispy", "type": "EXTRA_CRISPY"], ["brand_name": "Fansided", "type": "FANSIDED"], ["brand_name": "Food & Wine", "type": "F_AND_W"], ["brand_name": "Fortune", "type": "FORTUNE"], ["brand_name": "Foundry", "type": "FOUNDRY"], ["brand_name": "Health", "type": "HEALTH"], ["brand_name": "Hello Giggles", "type": "HG"], ["brand_name": "InStyle", "type": "INSTYLE"], ["brand_name": "LIFE VR", "type": "LIFE_VR"], ["brand_name": "Money", "type": "MONEY"], ["brand_name": "myrecipes", "type": "MRE"], ["brand_name": "PEOPLE TV", "type": "PEOPLE_TV"], ["brand_name": "PEOPLE", "type": "PEOPLE"], ["brand_name": "People En Español", "type": "PESP"], ["brand_name": "Real Simple", "type": "REAL_SIMPLE"], ["brand_name": "SI Kids", "type": "SI_KIDS"], ["brand_name": "Southern Living", "type": "SOUTHERN_LIVING"], ["brand_name": "Sports Illustrated", "type": "SI"], ["brand_name": "The Drive", "type": "THE_DRIVE"], ["brand_name": "TIME", "type": "TIME"], ["brand_name": "Travel + Leisure", "type": "T_AND_L"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.blue
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        let brand = brands[indexPath.row] as NSDictionary
        cell.brandName.text = brand.object(forKey: "brand_name") as? String
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
