
import UIKit
import SwiftyUIKit
import SwiftyPlayerKit

/// 录音完毕回调
extension ZMessageViewController: ZAudioRecordDelegate {
    /// 更新麦克风的音量大小
    public func audioRecordUpdateMetra(_ metra: Float, audioTimeInterval: Int32) {
        self.viewRecordAudio.updateMetersValue(metra, audioTimeInterval)
    }
    /// 录音太短
    public func audioRecordTooShort() {
        self.viewRecordAudio.messageTooShort()
    }
    /// 录音完成
    /// - parameter recordTime:         录音时长
    /// - parameter uploadData:         上传的 amr Data
    /// - parameter filepath:           amr 音频数据的本地文件地址
    public func audioRecordFinish(uploadData: Data, recordTime: Float, filepath: URL) {
        self.viewRecordAudio.endRecord()
        self.startSendAudio(uploadData, recordTime, filepath)
    }
    /// 录音失败
    public func audioRecordFailed() {
        self.viewRecordAudio.endRecord()
        ZProgressHUD.showMessage(vc: self, text: L10n.messageRecordError)
    }
    /// 取消录音
    public func audioRecordCanceled() {
        self.viewRecordAudio.endRecord()
    }
}
