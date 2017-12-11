//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Yeojong Kim on 2017. 12. 12..
//  Copyright © 2017년 Yeojong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var numberImages = [String]()
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        numberImages = [
            "no_1.png", "no_2.png", "no_3.png", "no_4.png", "no_5.png", "no_6.png"
            /* , "no_7.png", "no_8.png", "no_9.png", "no_10.png" */
        ]
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("numberOfSecions")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionView, numberOfItemsInSection")
        return numberImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionView, cellForItemAt \(indexPath.row)")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "my_collection_view_cell", for: indexPath) as! CollectionViewCell
        
        let image = UIImage(named: numberImages[indexPath.row])
        cell.cellImageView.image = image
        cell.cellLabel.text = "No. \(indexPath.row)"
        
        print("cell accessibilityActivationPoint x : \(cell.accessibilityActivationPoint.x), y : \(cell.accessibilityActivationPoint.y)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionView, sizeForItemAt \(indexPath.row)")
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        print("width : \(width), height : \(height)")
        print("cell width : \(width / 8)")
        let size = CGSize(width: width / 8, height: 116)
        return size
    }
    
    
}

