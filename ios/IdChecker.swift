import NFCReader
import Foundation
@available(iOS 13, *)
@objc(IdChecker)


class IdChecker: NSObject, NFCDelegate {
    var handleCallback:RCTResponseSenderBlock?
    var response : [String : Any]?
    func NFCNotAvaiable() {
        print("NFCNotAvaiable___ :::")
//        let resultsDict = [
//            "success" : false,
//            "data" : "NFCNotAvaiable"
//            // "data" : count
//        ] as [String : Any];
//        handleCallback!([resultsDict])
//        self.errorAlert("Thiết bị không hỗ trợ hoặc không được bật NFC")
    }

    // Đọc NFC thành công
    func NFCSuccess(model: NFCReader.NFCPassportModel) {
           print("NFCSuccess ::",model)
        DispatchQueue.main.async {
            let resultsDict = [
                "success" : true,
                "data" : "NFCSuccess"
                // "data" : count
            ] as [String : Any];
            self.handleCallback!([resultsDict])
        }
        
    }
    // Đọc NFC thất bại
    func NFCFail(_ error: NFCReader.NFCPassportReaderError) {
        
        // Xử lý trong main queue
        
        DispatchQueue.main.async {
            print("NFCFail :::",error)
                 let resultsDict = [
                     "success" : false,
                      "data" : "NFCFail"
                 ] as [String : Any];
            self.handleCallback!([resultsDict])
        }
    }
    // Hoàn thành xác thực NFC, trả về thông tin dạng Json
    func VerifySuccess(jsonData: NFCReader.JSON) {
        print("VerifySuccess ::",jsonData)
        DispatchQueue.main.async {
            let resultsDict = [
                "success" : true,
                "data" : "VerifySuccess"
            ] as [String : Any];
            self.handleCallback!([resultsDict])
        }
        
    }
    // Xác thực NFC bị lỗi
    func VerifyFail(_ error: NFCReader.AFError) {
        print("VerifyFail ::",error)
        DispatchQueue.main.async {
            let resultsDict = [
                "success" : false,
                 "data" : "VerifyFail"
            ] as [String : Any];
            self.handleCallback!([resultsDict])
        }
        
    }
     @objc
    func increment(_ callback : @escaping RCTResponseSenderBlock) {


    let nfc = NFCManager(dateOfBirthYYMMDD: "970920",
                             dateOfExpireYYMMDD: "370920",
                             cardID: "036097014565",
                             isCheckBCA: true)
        
        // Set URL API
        nfc.setDomainURL("")
        // Set Token
        nfc.setToken("")
        nfc.scanPassport()
//        print("a:::",a)
//        if (!!a) {
            self.handleCallback = callback
//        }
        nfc.delegate = self;
        
 }

}


