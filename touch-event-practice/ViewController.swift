//
//  ViewController.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/06/29.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit


class MyView1: UIView {
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
//    if !isDragging {
//      next?.touchesEnded(touches, with: event)
//    }
//    super.touchesEnded(touches, with: event)
    superview?.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
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
    
    
    view1.frame = .init(x: 100, y: 100, width: 200, height: 200)
    view1.backgroundColor = .darkGray
    
    scrollView.addSubview(view1)
    
    view2.frame = .init(x: 100, y: 400, width: 200, height: 200)
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


import AsyncDisplayKit

class MyNode1: ASDisplayNode {
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


class _MyView2: UIView {
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    superview?.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
}

class MyNode2: ASDisplayNode {
  
  let value: String
  
  init(value: String) {
    self.value = value
    super.init()
//    setViewBlock { () -> UIView in
//      _MyView2()
//    }

  }
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return view.superview?.hitTest(point, with: event)
//    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    view.superview?.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
//    super.touchesEnded(touches, with: event)
    // TODO: view.superviewはVCのViewなのにtouchイベントが届かない←hittestをsuperviewに対してしていなかった
    view.superview?.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
}

class MyNode3: ASDisplayNode {
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

class MyScrollNode: ASScrollNode {
  
  // TODO: ここらへん全然呼ばれない
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    // super.touchesを呼んでもイベントが通らないい
    super.touchesBegan(touches, with: event)
//    view.superview?.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    if !view.isDragging {
      view.next?.touchesEnded(touches, with: event)
    }
    super.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
//  override func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool {
//    return true
//  }

}

class MyCollectionView: ASCollectionView {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    return super.hitTest(point, with: event)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    superview?.touchesBegan(touches, with: event)
    print("touches began", String(describing: type(of: self)))
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    superview?.touchesEnded(touches, with: event)
    print("touches end", String(describing: type(of: self)))
  }
}

class ViewController2: ASViewController<ASDisplayNode> {

  let view1 = MyNode1()
  // TODO: MyNode2がcustomInitializerのときにどうするか
//  let view2 = MyNode2 { () -> UIView in
//    _MyView2()
//  }
  let view2 = MyNode2(value: "hoge")
  let view3 = MyNode3()

  let scrollNode = ASCollectionNode { () -> UIView in
    MyCollectionView(frame: .zero, collectionViewLayout: .init())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Node"
    
    scrollNode.view.frame = .init(x: 100, y: 100, width: 300, height: 300)
    scrollNode.view.backgroundColor = .lightGray
//    view.addSubview(scrollNode.view)
    view.addSubnode(scrollNode)
    
    scrollNode.view.panGestureRecognizer.cancelsTouchesInView = false
    scrollNode.view.panGestureRecognizer.cancelsTouchesInView = false
    scrollNode.view.canCancelContentTouches = false

    view1.frame = .init(x: 100, y: 100, width: 200, height: 200)
    view1.backgroundColor = .darkGray
//    view1.isLayerBacked = true // isLayerBacked = trueにするとhittestが呼ばれなくなる
//    scrollNode.view.addSubview(view1.view)
    
//    scrollNode.automaticallyManagesContentSize = true
    scrollNode.addSubnode(view1)
    
    view2.frame = .init(x: 100, y: 400, width: 200, height: 200)
    view2.backgroundColor = .orange
    
    // Geesture入れるとendが呼ばれなくなる
    let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
    // falseにするとendも呼ばれる
    gesture.cancelsTouchesInView = false
    view2.view.addGestureRecognizer(gesture)
    
//    view.addSubview(view2.view)
    view.addSubnode(view2)
    
    view3.frame = .init(x: 50, y: 50, width: 100, height: 100)
    view3.backgroundColor = .green
    
    view2.view.addSubview(view3.view)

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

