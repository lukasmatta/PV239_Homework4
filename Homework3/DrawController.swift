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

    @IBOutlet weak var buttons: UIStackView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        loadingSpinner.isHidden = true

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
        var randomNumber: Int = 0;
        
        let url = URL(string: "https://www.random.org/integers/?num=1&min=\(from)&max=\(to)&base=10&format=plain&col=1")
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    self.stopLoading()
                    let errorMessage = error.debugDescription
                    self.showError(errorMessage: errorMessage)
                }
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let trimmedString = dataString.trim()
                print(trimmedString)
                if let generatedNumber = Int(trimmedString) {
                    randomNumber = generatedNumber
                }
                DispatchQueue.main.async {
                    let newItem = ColoredNumber(value: randomNumber, color: color)
                    self.itemsListDelegate?.add(item: newItem)
                    self.presentingViewController?.dismiss(animated: true, completion:                     self.stopLoading)
                }
            }
        }

        task.resume()
        startLoading()
    }
    
    private func startLoading() {
        buttons.isHidden = true
        loadingSpinner.isHidden = false
        loadingSpinner.startAnimating()
    }
    
    private func stopLoading() {
        loadingSpinner.stopAnimating()
        loadingSpinner.isHidden = true
        buttons.isHidden = false
    }
    
    private func showError(errorMessage: String) {
        let alert = UIAlertController(title: "An error occured :(", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension String {
    func trim() -> String {
          return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

