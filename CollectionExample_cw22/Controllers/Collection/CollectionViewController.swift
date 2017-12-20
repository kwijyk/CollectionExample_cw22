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
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let destVC = segue.destination as? DetailsViewController else { return }
        destVC.fruit = sender as? Fruit
    }


}


    // MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension CollectionViewController {
    
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fruit = datasource[indexPath.item]
        performSegue(withIdentifier: "showDetails", sender: fruit)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.purple
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard kind == UICollectionElementKindSectionHeader else {
//            return UICollectionReusableView()
//        }
//      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath)
//        return header
//    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
 
    private var minimumItemSpacing: CGFloat { return 10 }
    private var sectionInsets: UIEdgeInsets { return UIEdgeInsets(top: 20, left: 12, bottom: 30, right: 12) }
    private var itemsPerRow: CGFloat { return 3 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right + minimumItemSpacing * (itemsPerRow - 1)
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}


