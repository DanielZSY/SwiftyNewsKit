import UIKit
import SwiftyLocalKit

/// 消息语音音量显示试图
public class ZMessageRecordAudioView: UIView {
    
    private let lowerLimit: Float = -100.0
    private let arrayVolume = [
        UIImage(named: "RecordingSignal001", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal002", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal003", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal004", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal005", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal006", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal007", in: Bundle.messageKitAssetBundle, compatibleWith: nil),
        UIImage(named: "RecordingSignal008", in: Bundle.messageKitAssetBundle, compatibleWith: nil)
    ]
    private lazy var viewBG: UIView = {
        let item = UIView.init()
        item.alpha = 0.7
        item.backgroundColor = .black
        item.border(color: UIColor.clear, radius: (10), width: 0)
        return item
    }()
    private lazy var viewMain: UIView = {
        let item = UIView.init()
        item.alpha = 1
        item.backgroundColor = .clear
        item.border(color: UIColor.clear, radius: (10), width: 0)
        return item
    }()
    private lazy var imageCancel: UIImageView = {
        let item = UIImageView.init(image: UIImage(named: "RecordCancel", in: Bundle.messageKitAssetBundle, compatibleWith: nil))
        return item
    }()
    private lazy var imageAudio: UIImageView = {
        let item = UIImageView.init(image: UIImage(named: "RecordingBkg", in: Bundle.messageKitAssetBundle, compatibleWith: nil))
        return item
    }()
    private lazy var imageVolume: UIImageView = {
        let item = UIImageView.init(image: UIImage(named: "RecordingBkg", in: Bundle.messageKitAssetBundle, compatibleWith: nil))
        return item
    }()
    private lazy var lbPrompt: UILabel = {
        let item = UILabel.init()
        item.font = UIFont.systemFont(ofSize: 12)
        item.text = L10n.messageSwipeCancelSend
        item.textColor = .white
        item.backgroundColor = .clear
        item.numberOfLines = 2
        item.textAlignment = .center
        return item
    }()
    private lazy var lbCountdown: UILabel = {
        let item = UILabel.init()
        item.text = "10"
        item.alpha = 0
        item.font = UIFont.systemFont(ofSize: 24)
        item.textColor = .white
        item.backgroundColor = .clear
        item.numberOfLines = 1
        item.textAlignment = .center
        return item
    }()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.alpha = 0
        self.isHidden = true
        self.backgroundColor = .clear
        
        self.addSubview(self.viewBG)
        self.addSubview(self.viewMain)
        self.sendSubviewToBack(self.viewBG)
        self.viewMain.addSubview(self.lbCountdown)
        self.viewMain.addSubview(self.imageAudio)
        self.viewMain.addSubview(self.imageCancel)
        self.viewMain.addSubview(self.imageVolume)
        self.viewMain.addSubview(self.lbPrompt)
    }
    
    private func setViewFrame() {
        self.viewBG.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.viewMain.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        let imageCancelW = (80).scale
        self.imageCancel.frame = CGRect.init(x: self.viewMain.frame.width/2 - imageCancelW/2, y: (15).scale, width: imageCancelW, height: imageCancelW)
        let imageAudioW = (50).scale
        let imageAudioH = (80).scale
        let imageVolumeW = (30).scale
        self.imageAudio.frame = CGRect.init(x: self.imageCancel.frame.origin.x, y: self.imageCancel.frame.origin.y - (5).scale, width: imageAudioW, height: imageAudioH)
        self.imageVolume.frame = CGRect.init(x: self.imageAudio.frame.origin.x + self.imageAudio.frame.width + (10).scale, y: self.imageAudio.frame.origin.y, width: imageVolumeW, height: imageAudioH)
        
        self.lbCountdown.frame = CGRect.init(x: 0, y: (20).scale, width: self.viewMain.frame.width, height: imageCancelW)
        self.lbPrompt.frame = CGRect.init(x: (10).scale, y: self.imageAudio.frame.origin.y + self.imageAudio.frame.height + (5).scale, width: self.viewMain.frame.width - (30).scale, height: (40).scale)
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setViewFrame()
    }
    /// 开始录音
    public final func startRecord() {
        self.alpha = 0
        self.isHidden = false
        self.imageCancel.isHidden = true
        self.imageAudio.isHidden = false
        self.imageVolume.isHidden = false
        self.lbPrompt.backgroundColor = UIColor.clear
        self.lbPrompt.text = L10n.messageSwipeCancelSend
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1
        }, completion: { (end) in
            
        })
    }
    /// 正在录音
    public final func recording() {
        self.isHidden = false
        self.imageCancel.isHidden = true
        self.imageAudio.isHidden = false
        self.imageVolume.isHidden = false
        self.lbPrompt.backgroundColor = UIColor.clear
        self.lbPrompt.text = L10n.messageSwipeCancelSend
    }
    /// 录音过程中音量的变化
    public final func updateMetersValue(_ value: Float, _ audioTimeInterval: Int32) {
        var index = 0
        if value < 0.3 {
            index = 0
        } else if value >= 0.3 && value < 0.6 {
            index = 1
        } else if value >= 0.6 && value < 0.9 {
            index = 2
        } else if value >= 0.9 && value < 1.2 {
            index = 3
        } else if value >= 1.2 && value < 1.5 {
            index = 4
        } else if value >= 1.5 && value < 1.8 {
            index = 5
        } else if value >= 1.8 && value < 2.5 {
            index = 6
        } else {
            index = 7
        }
        self.imageVolume.image = arrayVolume[index]
        if audioTimeInterval > 50 {
            // TODO: 倒计时10秒效果
            self.lbCountdown.text = String(abs(60 - audioTimeInterval))
        }
    }
    /// 松开手指，取消发送
    public final func slideToCancelRecord() {
        self.isHidden = false
        self.imageCancel.isHidden = false
        self.imageAudio.isHidden = true
        self.imageVolume.isHidden = true
        self.lbPrompt.text = L10n.messageFingerCancelSend
    }
    /// 录音时间太短的提示
    public final func messageTooShort() {
        self.isHidden = false
        self.imageCancel.isHidden = false
        self.imageAudio.isHidden = true
        self.imageVolume.isHidden = true
        self.lbPrompt.text = L10n.messageRecordTimeShort
        // 0.5秒后消失
        let delayTime = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.endRecord()
        }
    }
    /// 录音结束
    public final func endRecord() {
        if self.isHidden && self.alpha == 0 { return }
        self.alpha = 1
        self.isHidden = false
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0
        }, completion: { (end) in
            self.isHidden = true
        })
    }
}
