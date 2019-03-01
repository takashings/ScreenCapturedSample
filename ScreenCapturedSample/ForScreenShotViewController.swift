//
//  ForScreenShotViewController.swift
//  ScreenCapturedSample
//
//  Created by Takashi Sawada on 2019/03/01.
//  Copyright © 2019 Takashi Sawada. All rights reserved.
//

import UIKit

final class ForScreenShotViewController: UIViewController {

    @IBOutlet private weak var blackView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didTakeScreenCaptured(_:)),
            name: UIApplication.userDidTakeScreenshotNotification,
            object: nil
        )
    }

    @objc private func didTakeScreenCaptured(_ notification: Notification) {
        blackView.isHidden = UIScreen.main.isCaptured
    }

    @IBAction private func onUndoButtonTapped(_ sender: UIBarButtonItem) {
        blackView.isHidden = true
    }
}
