import NFCReader
import Foundation
@available(iOS 13, *)
@objc(IdChecker)


class IdChecker: NSObject, NFCDelegate {
    var handleCallback:RCTResponseSenderBlock?
    var response : [String : Any]?
    func NFCNotAvaiable() {
        print("NFCNotAvaiable___ :::")
    }

    // Đọc NFC thành công
    func NFCSuccess(model: NFCReader.NFCPassportModel) {
           print("NFCSuccess ::",model)
           if (self.handleCallback == nil) {
            return
        }
        DispatchQueue.main.async {
            let resultsDict = [
                "success" : true,
                "data" : "NFCSuccess"
            ] as [String : Any];
            if (self.handleCallback != nil){
                    self.handleCallback!([resultsDict])
                }
                    self.handleCallback = nil
        }
        
    }
    // Đọc NFC thất bại
    func NFCFail(_ error: NFCReader.NFCPassportReaderError) {
        if (self.handleCallback == nil) {
            return
        }
            DispatchQueue.main.async {
                print("NFCFail :::",error)
                     let resultsDict = [
                         "success" : false,
                          "data" : "NFCFail"
                     ] as [String : Any];
                if (self.handleCallback != nil){
                    self.handleCallback!([resultsDict])
                }
                    self.handleCallback = nil
            }
        
    }
    // Hoàn thành xác thực NFC, trả về thông tin dạng Json
    func VerifySuccess(jsonData: NFCReader.JSON) {
        print("VerifySuccess ::",jsonData)
        if (self.handleCallback == nil) {
            return
        }
        DispatchQueue.main.async {
            let resultsDict = [
                "success" : true,
                "data" : "VerifySuccess"
            ] as [String : Any];
             if (self.handleCallback != nil){
                    self.handleCallback!([resultsDict])
                }
                    self.handleCallback = nil
        }
        
    }
    // Xác thực NFC bị lỗi
    func VerifyFail(_ error: NFCReader.AFError) {
        print("self.handleCallback ::",self.handleCallback as Any)
        print("VerifyFail ::",error)
        if (self.handleCallback == nil) {
            return
        }
       DispatchQueue.main.async {
           let resultsDict = [
               "success" : false,
                "data" : "VerifyFail"
           ] as [String : Any];
           if (self.handleCallback != nil){
                    self.handleCallback!([resultsDict])
                }
                    self.handleCallback = nil
       }
        
    }
    @objc
    func checkId(
        _ cardID: String, dateOfBirthYYMMDD: String, dateOfExpireYYMMDD: String,callback : @escaping RCTResponseSenderBlock
    ) -> Void{
    let nfc = NFCManager(dateOfBirthYYMMDD: dateOfBirthYYMMDD,
                             dateOfExpireYYMMDD: dateOfExpireYYMMDD,
                             cardID: cardID,
                             isCheckBCA: true)
        
        // Set URL API
        nfc.setDomainURL("")
        // Set Token
        nfc.setToken("")
        nfc.scanPassport()
        nfc.delegate = self;
       self.handleCallback = callback
 }
}


