//
//  ViewController.swift
//  extraCollectionView
//
//  Created by undhad kaushik on 16/01/23.
//

struct FoodItem{
    var id: Int
    var name: String
    var price: Double
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var selectItemIndex: Int = -2

    var arrFoodItems: [FoodItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }

    private func setup(){
        configurRagisterNib()
        loadArrFoodItem()
    }
    
    private  func configurRagisterNib(){
        let nibFile: UINib = UINib(nibName: "FoodCollectionViewCell", bundle: nil)
        collectionView.register(nibFile, forCellWithReuseIdentifier: "FoodCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
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


extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFoodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FoodCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        cell.name.text = arrFoodItems[indexPath.row].name
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let foodItem = arrFoodItems[indexPath.row]
            selectItemIndex = indexPath.row
            //            print(foodItem.name)
            //            print(foodItem.id)
            collectionView.reloadData()
        }
    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 8, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
