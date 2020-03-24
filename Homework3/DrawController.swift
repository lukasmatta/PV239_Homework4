//
//  ViewController.swift
//  Homework3
//
//  Created by Lukáš Matta on 18/03/2020.
//  Copyright © 2020 Lukáš Matta. All rights reserved.
//

import UIKit

class DrawController: UIViewController {
    weak var itemsListDelegate: ItemsListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func closeButton(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func drawRed(_ sender: UIButton) {
        let newItem = ColoredNumber(value: Int.random(in: 11...49), color: UIColor.systemRed)
        itemsListDelegate?.add(item: newItem)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func drawBlue(_ sender: UIButton) {
        let newItem = ColoredNumber(value: Int.random(in: 11...49), color: UIColor.systemBlue)
        itemsListDelegate?.add(item: newItem)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func drawGreen(_ sender: UIButton) {
        let newItem = ColoredNumber(value: Int.random(in: 1...50), color: UIColor.systemGreen)
        itemsListDelegate?.add(item: newItem)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

