//
//  ViewController.swift
//  touch-event-practice
//
//  Created by Jinsei Shima on 2021/10/12.
//  Copyright © 2021 jinsei_shima. All rights reserved.
//

import UIKit

// gestureのあるsubviewでのtouchイベントのハンドリングについて（cancelsTouchesInView）

class ViewController5: UIViewController {


  class MyButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      print(String(describing: Self.self), "touches began")
      super.touchesBegan(touches, with: event)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      print(String(describing: Self.self), "touches cancelled")
      super.touchesCancelled(touches, with: event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      print(String(describing: Self.self), "touches ended")
      super.touchesEnded(touches, with: event)
    }
  }
  class MyView: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      print(String(describing: Self.self), "touches began")
      super.touchesBegan(touches, with: event)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      print(String(describing: Self.self), "touches cancelled")
      super.touchesCancelled(touches, with: event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      print(String(describing: Self.self), "touches ended")
      super.touchesEnded(touches, with: event)
    }
  }

  let button = MyButton()
  let view1 = MyView()

  override func viewDidLoad() {
    super.viewDidLoad()

    button.frame = .init(x: 100, y: 200, width: 100, height: 100)
    view1.frame = .init(x: 100, y: 400, width: 100, height: 100)
    view1.backgroundColor = .blue

    // falseにするとgestureのtapが発火する。trueのままだと発火しない
//    button.isUserInteractionEnabled = false

    view.addSubview(button)
    view.addSubview(view1)

    if #available(iOS 14.0, *) {
      button.addAction(.init(handler: { (action) in
        print(String(describing: Self.self), "tap button")
      }), for: .touchUpInside)
    }
    button.setTitle("Button", for: .normal)
    button.setTitleColor(.darkText, for: .normal)
    button.sizeToFit()

    // gestureを追加するとsubviewにあるviewへのtouchはcancelされる（デフォルトだとcancelsTouchesInView=trueなので）
    // cancelsTouchesInView=falseにするとsubviewへのtouchもcancelされず呼ばれるようになる。
    let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
    // falseにするとボタンのタップも発火するしgestureのdidTapも発火する（trueはボタンしか反応しない）
    // UIControlをタップした時は親ViewのtouchXXXは発火しない
//    gesture.cancelsTouchesInView = false
    view.addGestureRecognizer(gesture)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

  }

  @objc func didTap() {
    print(String(describing: Self.self), "tap view")
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(String(describing: Self.self), "touches began")
    super.touchesBegan(touches, with: event)
  }
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(String(describing: Self.self), "touches cancelled")
    super.touchesCancelled(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(String(describing: Self.self), "touches ended")
    super.touchesEnded(touches, with: event)
  }

}

