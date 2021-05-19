
import UIKit

/// 消息输入框区域按钮
public class ZMessageButton: UIButton, InputItem {
    
    private var timer: Timer?
    public var inputBarAccessoryView: InputBarAccessoryView?
    public var parentStackViewPosition: InputStackView.Position?
    
    public func textViewDidChangeAction(with textView: InputTextView) {
        
    }
    public func keyboardSwipeGestureAction(with gesture: UISwipeGestureRecognizer) {
        
    }
    public func keyboardEditingEndsAction() {
        
    }
    public func keyboardEditingBeginsAction() {
        
    }
    
    public required convenience init() {
        self.init(frame: CGRect.zero)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.adjustsImageWhenHighlighted = false
        self.isUserInteractionEnabled = true
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
