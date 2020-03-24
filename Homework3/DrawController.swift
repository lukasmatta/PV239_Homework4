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
        drawNumberAndClose(from: 11, to: 49, color: UIColor.systemRed)

    }
    
    @IBAction func drawBlue(_ sender: UIButton) {
        drawNumberAndClose(from: 1, to: 49, color: UIColor.systemBlue)
    }
    
    @IBAction func drawGreen(_ sender: UIButton) {
        drawNumberAndClose(from: 1, to: 50, color: UIColor.systemGreen)
    }
    
    private func drawNumberAndClose(from: Int, to: Int, color: UIColor) {
        let newItem = ColoredNumber(value: Int.random(in: from...to), color: color)
        itemsListDelegate?.add(item: newItem)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

