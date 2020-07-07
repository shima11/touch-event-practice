
import Foundation

import AsyncDisplayKit
import TextureSwiftSupport

public final class VerticalScrollWrapperNode<Content: ASDisplayNode>: SafeAreaDisplayNode {

  override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("hittest", String(describing: type(of: self)))
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  
  override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }

  public override var supportsLayerBacking: Bool {
    false
  }
  
  private let scrollNode = _ASScrollNode()
  public let content: Content
    
  public init(content: () -> Content) {
    
    let _content = content()
    self.content = _content
     
    super.init()
    
    automaticallyManagesSubnodes = true

    scrollNode.scrollableDirections = .down
    scrollNode.automaticallyManagesContentSize = true
    scrollNode.automaticallyManagesSubnodes = true
    
    scrollNode.layoutSpecBlock = { _, _ in
      let stack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 0,
        justifyContent: .start,
        alignItems: .stretch,
        children: [_content]
      )
    
      return stack
    }
    clipsToBounds = true
  }
  
  public override func didLoad() {
    super.didLoad()
    
    scrollNode.view.clipsToBounds = false
    scrollNode.view.delaysContentTouches = false
    scrollNode.view.alwaysBounceVertical = true
  }
  
  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    content.style.width = .init(unit: .points, value: constrainedSize.max.width)
    scrollNode.style.width = .init(unit: .points, value: constrainedSize.max.width)
    return LayoutSpec {
      scrollNode
    }
  }
  
  public override func setNeedsLayout() {
    super.setNeedsLayout()
    content.setNeedsLayout()
  }
}
