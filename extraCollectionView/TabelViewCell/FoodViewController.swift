//
//  FoodViewController.swift
//  extraCollectionView
//
//  Created by undhad kaushik on 17/01/23.
//

import UIKit

class FoodViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrFoodItems: [FoodItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup(){
        cunfigurRagisterNib()
        loadArrFoodItem()
        
    }
   
    private func cunfigurRagisterNib(){
        let nibFile: UINib = UINib(nibName: "FoodItemTableViewCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: "FoodItemTableViewCell")
        
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
    }
    
    private func loadArrFoodItem(){
        
        let pitza: FoodItem = FoodItem(id: 1, name: "Pitza", price: 140)
        let burgur: FoodItem = FoodItem(id: 2, name: "Burgur", price: 20)
        let dosha: FoodItem = FoodItem(id: 3, name: "Dosha", price: 120)
        let dabeli: FoodItem = FoodItem(id: 4, name: "Dabeli", price: 15)
        let meggi: FoodItem = FoodItem(id: 5, name: "Meggi", price: 30)
        let pasta: FoodItem = FoodItem(id: 6, name: "Pasta", price: 25)
        
        arrFoodItems = [pitza,burgur,dosha,dabeli,meggi,pasta,pitza,burgur,dosha,dabeli,meggi,pasta,pitza,burgur,dosha,dabeli,meggi,pasta]
    }
    
    
}

extension FoodViewController: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FoodItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FoodItemTableViewCell") as! FoodItemTableViewCell
        
        let foodItem: FoodItem = arrFoodItems[indexPath.section]
        cell.nameLabel.text = foodItem.name
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrFoodItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodItem: FoodItem = arrFoodItems[indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 32))
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
}
