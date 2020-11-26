//
//  ViewController4.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/11/25.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit

// UIPopoverPresentationControllerの実験

class ViewController4: UIViewController {

  let button = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(button)

    button.frame = .init(x: 100, y: 200, width: 100, height: 100)
    button.center = view.center

    if #available(iOS 14.0, *) {
      button.addAction(.init(handler: { (action) in

        let actionController = ContentViewController()
        actionController.preferredContentSize = .init(width: 100, height: 100)
        actionController.modalPresentationStyle = .popover

        let popover = actionController.popoverPresentationController
        popover?.sourceView = self.button
        popover?.sourceRect = self.button.bounds
        popover?.permittedArrowDirections = .any
        popover?.delegate = self

        self.present(actionController, animated: true)

      }), for: .touchUpInside)
    } else {
      // Fallback on earlier versions
    }
    button.setTitle("Button", for: .normal)
    button.setTitleColor(.darkText, for: .normal)
    button.sizeToFit()

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

  }
}

extension ViewController4: UIPopoverPresentationControllerDelegate {

  func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
    return .none
  }
}

class ContentViewController: UIViewController {

  let label = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    label.text = "tooltip"
    label.textColor = .darkText
    view.addSubview(label)
    label.sizeToFit()
    
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    label.center = view.center

  }
}
