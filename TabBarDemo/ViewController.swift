//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Rachana Pandit on 28/11/22.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var collImages:UICollectionView!
@IBOutlet weak var textViewDescription:UITextView!
var arrayImage:[String] = ["Flower1.jpeg","Flower2.jpeg","Flower3.jpeg","flower-4.jpeg","flower-5.jpeg"]
var count =  Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewDataSourceAndDelegate()
        DescriptionOfTextView()
        
    }
    
    func DescriptionOfTextView()
    {
        textViewDescription.text = "Flower, the characteristic reproductive structure of angiosperms. As popularly used, the term “flower” especially applies when part or all of the reproductive structure is distinctive in colour and form."
        textViewDescription.layer.cornerRadius = 5
        textViewDescription.layer.borderWidth = 0.8
        textViewDescription.layer.borderColor = CGColor.init(gray: 0.7, alpha: 1)
    }
    
    
    func CollectionViewDataSourceAndDelegate()
    {
        collImages.dataSource = self
        collImages.delegate =  self
    }
}

extension ViewController:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collImages.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1
        cell.layer.borderColor = .init(gray: 0.8, alpha: 1)
        
        cell.imgCollection.layer.cornerRadius = 5
        
        cell.imgCollection.image = UIImage(named: arrayImage[indexPath.row] as String)
        return cell
    }
}

extension ViewController:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {  print(indexPath.row)
        if (count < arrayImage.count - 1) && (indexPath.row < arrayImage.count - 1)
        {
            count = count+1
            collectionView.scrollToItem(at: IndexPath(row: indexPath.row + 1, section: 0), at: .centeredHorizontally, animated: true)
        }
        else
        {
            count = 0
            collectionView.scrollToItem(at: IndexPath(row:0, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}

