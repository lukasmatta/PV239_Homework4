//
//  CollectionController.swift
//  Homework3
//
//  Created by Lukáš Matta on 18/03/2020.
//  Copyright © 2020 Lukáš Matta. All rights reserved.
//

import UIKit

protocol ItemsListDelegate: class {
    func add(item: ColoredNumber)
}

class CollectionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    var items = [ColoredNumber]()

    override func viewDidLoad() {
        super.viewDidLoad()
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == "losujSegue",
            let addItemController = segue.destination as? ViewController
        {
            addItemController.itemsListDelegate = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.myLabel.text = "\(items[indexPath.item].value)"
        cell.myLabel.textColor = items[indexPath.item].color
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CollectionController: ItemsListDelegate {
    func add(item: ColoredNumber) {
        items.append(item)
        let newIndexPath = IndexPath(item: items.count - 1, section: 0)
        itemsCollectionView.insertItems(at: [newIndexPath])
    }
}
