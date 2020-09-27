//
//  TouchDetectWindow.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/07/26.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit

final class TouchDetectWindow: UIWindow {


  override init(windowScene: UIWindowScene) {
    super.init(windowScene: windowScene)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//    return nil
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest window", String(describing: type(of: view)))
    } else {
      print("hittest window nil")
    }
    // TODO: ここでTooltipのタッチ判定を行ってTooltipをタッチしていたらnilを返すようにしたらTooltipの後ろのタップが発火しないかも

    return view
  }

  override final public func sendEvent(_ event: UIEvent) {

    super.sendEvent(event)

    event.touches(for: self)?.forEach { touch in
      if let view = touch.view {
        print("xxx:", type(of: view))
      }
    }
  }
}
