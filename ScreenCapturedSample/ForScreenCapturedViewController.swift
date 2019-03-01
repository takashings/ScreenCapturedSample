//
//  ForScreenCapturedViewController.swift
//  ScreenCapturedSample
//
//  Created by Takashi Sawada on 2019/03/01.
//  Copyright © 2019 Takashi Sawada. All rights reserved.
//

import UIKit

final class ForScreenCapturedViewController: UIViewController {

    @IBOutlet private weak var yellowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didCapturedScreen(_:)),
            name: UIScreen.capturedDidChangeNotification,
            object: nil
        )
    }

    @objc private func didCapturedScreen(_ notification: Notification) {
        yellowView.isHidden = UIScreen.main.isCaptured
    }
    
    @IBAction private func onUndoButtonTapped(_ sender: UIBarButtonItem) {
        yellowView.isHidden = true
    }
}
