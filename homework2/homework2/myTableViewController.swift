//
//  myTableViewController.swift
//  homework2
//
//  Created by Alex Epstein on 2/11/20.
//  Copyright © 2020 Alex Epstein. All rights reserved.
//

import UIKit


class myTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class myTableViewController: UITableViewController {
    
    var cities = ["Durham", "Chapel Hill", "Carrboro", "Morrisville", "Raleigh", "Cary", "Dix Hills"]
    
    var temperatures = ["78˚", "78˚", "77˚", "80˚", "82˚", "81˚", "45˚"]
    
    var weatherImages = [UIImage(named: "cloudy"), UIImage(named: "sunny"), UIImage(named: "sunny"), UIImage(named: "cloudy"), UIImage(named: "rain"), UIImage(named: "rain"), UIImage(named: "cloudy")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 106

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Today's Weather"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! myTableViewCell
        
        cell.cityLabel.text = cities[indexPath.row]
        cell.tempLabel.text = temperatures[indexPath.row]
        cell.weatherImage.image = weatherImages[indexPath.row]
        
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! focusViewController
        
        let myRow = tableView!.indexPathForSelectedRow
        
        let myCurrCell = tableView!.cellForRow(at: myRow!) as! myTableViewCell
        
        destVC.cityText = (myCurrCell.cityLabel!.text)!
        destVC.tempText = (myCurrCell.tempLabel!.text)!
        destVC.weatherPicture = (myCurrCell.weatherImage!.image)!
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
