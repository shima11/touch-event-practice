//
//  ViewController.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/06/29.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit

extension UIResponder {
  func responderChain() -> String {
    guard let next = next else {
      return String(describing: type(of: self))
    }
    return String(describing: type(of: self)) + " -> " + next.responderChain()
  }
}

class MyView1: UIView {
  
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let value = super.point(inside: point, with: event)
    print("point", value, String(describing: type(of: self)))
    return value
  }
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }
}

class MyView2: UIView {
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let value = super.point(inside: point, with: event)
    print("point", value, String(describing: type(of: self)))
    return value
  }
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }
}

class MyView3: UIView {
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let value = super.point(inside: point, with: event)
    print("point", value, String(describing: type(of: self)))
    return value
  }
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }
}

class MyScrollView: UIScrollView {
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let value = super.point(inside: point, with: event)
    print("point", value, String(describing: type(of: self)))
    return value
  }
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    // super.touchesを呼んでもイベントが通らないい
//    super.touchesBegan(touches, with: event)
    superview?.touchesBegan(touches, with: event)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
//    if !isDragging {
//      next?.touchesEnded(touches, with: event)
//    }
//    super.touchesEnded(touches, with: event)
    superview?.touchesEnded(touches, with: event)
  }
  
//  override func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool {
//    return true
//  }
}

class ViewController1: UIViewController {

  let view1 = MyView1()
  let view2 = MyView2()
  let view3 = MyView3()

  let scrollView = MyScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "View"
      
    scrollView.frame = .init(x: 100, y: 100, width: 300, height: 300)
    scrollView.backgroundColor = .lightGray
    view.addSubview(scrollView)
    
    scrollView.panGestureRecognizer.cancelsTouchesInView = false
    scrollView.panGestureRecognizer.cancelsTouchesInView = false
    scrollView.canCancelContentTouches = false
    scrollView.alwaysBounceVertical = true
    
    view1.frame = .init(x: 100, y: 100, width: 200, height: 200)
    view1.backgroundColor = .darkGray
    
    scrollView.addSubview(view1)
    
    view2.frame = .init(x: 100, y: 400, width: 200, height: 200)
    view2.backgroundColor = .orange
    
    // Geesture入れるとendが呼ばれなくなる
    let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
    // falseにするとendも呼ばれる
    gesture.cancelsTouchesInView = false
    view3.addGestureRecognizer(gesture)
    
    view.addSubview(view2)
    
    view3.frame = .init(x: 50, y: 50, width: 100, height: 100)
    view3.backgroundColor = .green
    
    view2.addSubview(view3)

    print("responder:view1:", view1.responderChain())
    print("responder:view2:", view2.responderChain())
    print("responder:view3:", view3.responderChain())
  }

  @objc func tap() {
    print("tap")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }

}
