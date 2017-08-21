//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by fei on 2017/8/21.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var selectedIndexArray:Array = Array<IndexPath>()
    
    var dataArray:Array = Array<String>()
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = CGSize(width: 20, height: 20)
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing = 5
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumLineSpacing = 20
        
        dataArray.append("第一个第二个第三个")
        for _ in 0 ..< 100 {
            let index = arc4random()%5;
            dataArray.append("\(index*index*index*500 + 8)")
        }
        
    }
    
    // MARK: UICollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextLabelCell", for: indexPath) as! TextLabelCell

        cell.contentLbl.text = dataArray[indexPath.row]
        cell.cellStatusWithSelected(selected: ((selectedIndexArray.index(of: indexPath) != nil)))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TextLabelCell
        if let i = selectedIndexArray.index(of: indexPath) {
            print("selected：\(i)")
            selectedIndexArray.remove(at: i)
            cell.cellStatusWithSelected(selected: false)
        } else {
            selectedIndexArray.append(indexPath)
            cell.cellStatusWithSelected(selected: true)
        }
        
    }

    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        for index in selectedIndexArray {
            
            print(dataArray[index.row])
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

