//
//  CollectionViewController.swift
//  Capchit
//
//  Created by AJ Ibraheem on 01/12/2015.
//  Copyright © 2015 The Leaf. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"
private let collectionReuseableView = "HeaderView"


class CollectionViewController: UICollectionViewController {
    
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    let caps:[Cap] = [Utilities.getExampleCap()]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
    }

    //UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return caps.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        let cap = caps[indexPath.item]
        
        //UI Configurations
        cell.backgroundColor = UIColor( red: 245/255, green: 245/255, blue: 245/255, alpha: 1 )
        cell.layer.borderColor = UIColor( red: 245/255, green: 245/255, blue: 245/255, alpha: 0 ).CGColor
        cell.layer.borderWidth = 1.1
        cell.layer.cornerRadius = 5.0
        cell.capImageView.layer.cornerRadius = cell.capImageView.frame.width / 2
        cell.capImageView.clipsToBounds = true
        //Data Configurations
        cell.titleLabel.text = cap.title
        cell.capImageView.image = cap.image
        cell.capAudioIcon.hidden = false //(cap.audio == nil ? true : false)
        cell.plusIcon.hidden = (cap.showPlusIcon ? false : true )
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            return collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: collectionReuseableView, forIndexPath: indexPath)
        }else{
            return UICollectionReusableView()
        }
    }

    //UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool { return true }
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool { return true }
    
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        cell.contentView.alpha = 0.3
    }
    
    override func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        cell.contentView.alpha = 1.0
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width:CGFloat = 0.4;
        let height:CGFloat = 0.23
        
        //print("Screen Width: \(screenWidth) and ScreenHeight: \(screenHeight)")
        return CGSizeMake(screenWidth * width, screenHeight * height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        var top:CGFloat = 0.03; var left:CGFloat = 0.057; var bottom:CGFloat = 0.0; var right:CGFloat = 0.057;
        
        if caps.count <= 2 { top = 0.15; left = 0.15; bottom = 0.15; right = 0.15; }
        if caps.count == 3 { top = 0.03; left = 0.15; bottom = 0.0; right = 0.15; }
        
        //print("Top: \(screenHeight * top) Bottom: \(screenHeight*bottom) Left:\(screenWidth*left) Right:\(screenWidth*right)")
        return UIEdgeInsetsMake((screenHeight * top), (screenWidth*left), (screenHeight*bottom), (screenWidth*right))
    }
    
}
