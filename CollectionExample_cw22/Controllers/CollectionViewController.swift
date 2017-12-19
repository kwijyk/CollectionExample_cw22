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
}



