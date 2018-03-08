//
//  NUXViewController.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/20/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import UIKit

class NUXViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var doneButton: UIButton!
    
    var username: String?
    var brands: [NSDictionary]?
    var selectedBrands: NSMutableArray = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        username = "n00b"
        brands = [["brand_name": "Coastal Living", "type": "COASTAL_LIVING"], ["brand_name": "Cooking Light", "type": "COOKING_LIGHT"], ["brand_name": "Entertainment Weekly", "type": "EW"], ["brand_name": "Extra Crispy", "type": "EXTRA_CRISPY"], ["brand_name": "Fansided", "type": "FANSIDED"], ["brand_name": "Food & Wine", "type": "F_AND_W"], ["brand_name": "Fortune", "type": "FORTUNE"], ["brand_name": "Foundry", "type": "FOUNDRY"]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 153, height: 110)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.headerReferenceSize = CGSize(width: 0, height: 0)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let brands = brands {
            return brands.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as! BrandCell
        
        let brand = brands![indexPath.row]
        cell.titleLabel.text = brand.object(forKey: "brand_name") as? String
        let selectedView = UIView.init()
        selectedView.backgroundColor = UIColor.lightGray
        cell.selectedBackgroundView = selectedView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBrand = brands![indexPath.row]
        print(selectedBrand)
        selectedBrands.add(selectedBrand)
        print(selectedBrands)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedBrand = brands![indexPath.row]
        print(deselectedBrand)
        selectedBrands.removeObject(identicalTo: deselectedBrand)
        print(selectedBrands)
    }
    
    @IBAction func donePressed(_ sender: Any) {
        // save user with brands
        
        // segue to home
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
