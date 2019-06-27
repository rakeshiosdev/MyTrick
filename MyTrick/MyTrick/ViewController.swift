//
//  ViewController.swift
//  MyTrick
//
//  Created by RakeshPC on 27/06/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nestedArray()
        self.filterElement()
    }

}


//Handle nested Array
extension ViewController {
    
    fileprivate func nestedArray(){
        let simpleArray = flatternArray(nestedArray: [1,2,3,4,5])
        print("simpleArray: \(simpleArray)")
        
        let nestedArray = flatternArray(nestedArray: [1,2,3,4,5, [6,7,8,9]])
        print("nestedArray: \(nestedArray)")
    }
    
    func flatternArray(nestedArray: [Any]) -> [Int] {
        var myFlattenedArray = [Int]()
        
        for element in nestedArray {
            if element is Int {
                myFlattenedArray.append(element as! Int)
                
            } else if element is [Int] {
                let nestedElement = element as! [Int]
                for num in nestedElement {
                    myFlattenedArray.append(num)
                }
            }
        }
        
        return myFlattenedArray
    }
    
}


// Filter with clouser
extension ViewController {
    
    func filterElement(){
        let filter = self.filterWithPredicateClouser(clouesr: greterThan
            , numbers: [1,2,3,4,5,6])
        print("filter element: \(filter)")
    }
    
    func greterThan(value: Int) -> Bool {
        return value > 3
    }
    
    func filterWithPredicateClouser(clouesr: (Int) -> Bool, numbers: [Int]) -> [Int] {
        var filterNumberes = [Int]()
        for num in numbers {
            if clouesr(num) {
                filterNumberes.append(num)
            }
        }
        return filterNumberes
    }
    
}
