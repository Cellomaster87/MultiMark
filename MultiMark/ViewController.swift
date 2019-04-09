//
//  ViewController.swift
//  MultiMark
//
//  Created by Michele Galvagno on 09/04/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    var additionalWindows = [UIWindow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIScreen.didConnectNotification, object: nil, queue: nil) { [weak self] notification in
            guard let self = self else { return }
            
            guard let newScreen = notification.object as? UIScreen else { return }
            let screenDimensions = newScreen.bounds
            
            let newWindow = UIWindow(frame: screenDimensions)
            newWindow.screen = newScreen
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewViewController") as? PreviewViewController else {
                fatalError("Unable to find PreviewViewController")
            }
            
            newWindow.rootViewController = vc
            newWindow.isHidden = false
            self.additionalWindows.append(newWindow)
        }
    }


}

