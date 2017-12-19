//
//  CollectionViewController.swift
//  CollectionExample_cw22
//
//  Created by Sergey Intern  on 12/19/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    private var datasource: [Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateDatasource()
        
        collectionView?.register(FruitCollectionViewCell.nib, forCellWithReuseIdentifier: FruitCollectionViewCell.reuseID)
    }


    private func generateDatasource() {
        
        
        
        for i in 1...20 {
            let imageLiteralName = "\(i % 5 + 1)"
            let fruit = Fruit(name: "\(i)", image: UIImage(imageLiteralResourceName: imageLiteralName))
            datasource.append(fruit)
            collectionView?.reloadData()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCollectionViewCell.reuseID, for: indexPath) as? FruitCollectionViewCell else {
            fatalError("Error, cell doesn't exist")
        }
    
        let fruit = datasource[indexPath.item]
        
        cell.update(name: fruit.name, image: fruit.image)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
