//
//  ViewController.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/06/29.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit


class MyView: UIView {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
}

class MyView2: UIView {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
}

class MyView3: UIView {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
}

class MyScrollView: UIScrollView {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    // super.touchesを呼んでもイベントが通らないい
//    super.touchesBegan(touches, with: event)
    superview?.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    if !isDragging {
      next?.touchesEnded(touches, with: event)
    }
    super.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
//  override func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool {
//    return true
//  }
}

class ViewController: UIViewController {

  let view1 = MyView()
  let view2 = MyView2()
  let view3 = MyView3()

  let scrollView = MyScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    scrollView.frame = .init(x: 100, y: 100, width: 300, height: 500)
    scrollView.backgroundColor = .lightGray
    view.addSubview(scrollView)
    
    scrollView.panGestureRecognizer.cancelsTouchesInView = false
    scrollView.panGestureRecognizer.cancelsTouchesInView = false
    scrollView.canCancelContentTouches = false
    
    
    view1.frame = .init(x: 100, y: 100, width: 200, height: 300)
    view1.backgroundColor = .darkGray
    
    scrollView.addSubview(view1)
    
    view2.frame = .init(x: 100, y: 700, width: 200, height: 200)
    view2.backgroundColor = .orange
    
    // Geesture入れるとendが呼ばれなくなる
    let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
    // falseにするとendも呼ばれる
    gesture.cancelsTouchesInView = false
    view2.addGestureRecognizer(gesture)
    
    view.addSubview(view2)
    
    view3.frame = .init(x: 50, y: 50, width: 100, height: 100)
    view3.backgroundColor = .green
    
    view2.addSubview(view3)

  }

  
  @objc func tap() {
    print("tap")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }

}

