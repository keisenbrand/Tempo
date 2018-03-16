//
//  NUXViewController.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/20/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import UIKit

class NUXViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var doneButton: UIButton!
    
    var username: String?
    var userID: String?
    var idToken: String?
    var fullName: String?
    var brands: [Brand]?
    var selectedBrands: NSMutableArray = []
    let cellHeight: CGFloat = 110
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TempoAPIClient.shared.getAllBrands(request: GetAllBrandsRequest(), completion: { [weak self] (response, error) in
            guard let strongSelf = self, let response = response, error == nil else {
                print("Error reading brands \(String(describing: error?.localizedDescription))")
                return
            }

            strongSelf.brands = response.brands
            strongSelf.collectionView.reloadData()
        })
        
        /*[["brand_name": "Coastal Living", "type": "COASTAL_LIVING"], ["brand_name": "Cooking Light", "type": "COOKING_LIGHT"], ["brand_name": "Entertainment Weekly", "type": "EW"], ["brand_name": "Extra Crispy", "type": "EXTRA_CRISPY"], ["brand_name": "Fansided", "type": "FANSIDED"], ["brand_name": "Food & Wine", "type": "F_AND_W"], ["brand_name": "Fortune", "type": "FORTUNE"], ["brand_name": "Foundry", "type": "FOUNDRY"], ["brand_name": "Health", "type": "HEALTH"], ["brand_name": "Hello Giggles", "type": "HG"], ["brand_name": "InStyle", "type": "INSTYLE"], ["brand_name": "LIFE VR", "type": "LIFE_VR"], ["brand_name": "Money", "type": "MONEY"], ["brand_name": "myrecipes", "type": "MRE"], ["brand_name": "PEOPLE TV", "type": "PEOPLE_TV"], ["brand_name": "PEOPLE", "type": "PEOPLE"], ["brand_name": "People En Español", "type": "PESP"], ["brand_name": "Real Simple", "type": "REAL_SIMPLE"], ["brand_name": "SI Kids", "type": "SI_KIDS"], ["brand_name": "Southern Living", "type": "SOUTHERN_LIVING"], ["brand_name": "Sports Illustrated", "type": "SI"], ["brand_name": "The Drive", "type": "THE_DRIVE"], ["brand_name": "TIME", "type": "TIME"], ["brand_name": "Travel + Leisure", "type": "T_AND_L"]]*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
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
        cell.layer.borderColor = UIColor(red:0.41, green:0.62, blue:0.93, alpha:1.0).cgColor
        
        let brand = brands![indexPath.row]
        let brandName = brand.brandName
        cell.titleLabel.text = brandName
        let photo = UIImage(named: brandName)
        if let photo = photo {
            cell.imageView.image = photo
            cell.imageView.contentMode = .scaleAspectFill
        } else {
            cell.imageView.image = nil
        }
        let overlayView = UIView(frame: cell.frame)
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.3
        cell.overlayView = overlayView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBrand = brands![indexPath.row]
        selectedBrands.add(selectedBrand)
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedBrand = brands![indexPath.row]
        selectedBrands.removeObject(identicalTo: deselectedBrand)
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
    }
    
    @IBAction func donePressed(_ sender: Any) {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        let bookmarks = selectedBrands as! [Brand]
        homeViewController?.bookmarkedBrands = bookmarks
        
        var req = AddUserRequest()
        req.brands = brands!
        req.username = username!
        req.userID = userID!
        req.userType = .editor
        TempoAPIClient.shared.addUser(request: req) { [weak self] (_, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                // Throw some error
                print("Error adding user \(error.localizedDescription)")
                return
            }
            
            strongSelf.navigationController?.pushViewController(homeViewController!, animated: true)
        }
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
