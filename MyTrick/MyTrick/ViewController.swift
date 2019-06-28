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
        let simpleArray = flatteredArray(array: [1,2,3,4,5])
        print("simpleArray: \(simpleArray)")
        
        let nestedArray = flatteredArray(array: [1,2,3,4,5, [6,7,8,9]])
        print("nestedArray: \(nestedArray)")
    }
    
    func flatteredArray(array: [Any]) -> [Int] {
        var myArray = [Int]()
        
        for element in array {
            if element is Int {
                myArray.append(element as! Int)
                
            }else if element is [Any] {
                let recursiveElement = flatteredArray(array: element as! [Any])
                for num in recursiveElement {
                    myArray.append(num)
                }
            }
        }
        return myArray
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
