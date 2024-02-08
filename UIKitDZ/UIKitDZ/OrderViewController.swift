// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// OrderViewController
class OrderViewController: UIViewController {
    @IBOutlet var showOrderAlert: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        showOrderAlert.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc func buttonPressed() {
        let alertController = UIAlertController(
            title: "Выставить счет?",
            message: nil,
            preferredStyle: .alert
        )

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let proceedAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "showCheckViewController", sender: nil)
        }
        alertController.addAction(proceedAction)

        present(alertController, animated: true, completion: nil)
    }
}
