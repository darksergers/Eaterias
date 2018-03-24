//
//  PageViewController.swift
//  Eateries
//
//  Created by Serg Kalinin on 23/03/2018.
//  Copyright © 2018 Serg Kalinin. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var headersArray = ["Записывайте","Находите"]
    var subHeadersArray = ["Создайте свой список любимых ресторанов","Найдите и отметьте на карте ваши любимые рестораны"]
    var imagesArray = ["food","iphoneMap"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        } 
        

        
    }
    
    func displayViewController(atIndex index:Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < headersArray.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
        contentVC.imageFile = imagesArray[index]
        contentVC.header = headersArray[index]
        contentVC.subheader = subHeadersArray[index]
        contentVC.index = index
        return contentVC
    }

    func  newxtVC(atIndex index:Int) {
        if let contentVC = displayViewController(atIndex: index+1) {
            setViewControllers([contentVC], direction: .forward, animated: true, completion: nil)
        }
    }


}

extension PageViewController:UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        return displayViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        return displayViewController(atIndex: index)
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return headersArray.count
//    }
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController
//        return contentVC!.index
//    }
}
