// import NFCReader
@objc(IdChecker)
class IdChecker: NSObject {
  var count = 0;
  // @objc(multiply:withB:withResolver:withRejecter:)
  // func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
  //   resolve(a*b)
  // }

  // @objc
  // func increment(_ callback : RCTResponseSenderBlock) {
  //   count += 1;
  //   print("count - ",count)
  //   let resultsDict = [
  //    "success" : true,
  //    "data" : count
  //    ];
  //   callback([NSNull() ,resultsDict])
  // }

  @objc(increment:)
  func increment(callback: RCTResponseSenderBlock) -> Void {
    count += 1;
    print("count :::",count)
  let resultsDict = [
  "success" : true,
   "data" : count as Any
  ];

callback([resultsDict])
  // let nfc = NFCManager(
  //   dateOfBirthYYMMDD: "920821",
  //   dateOfExpireYYMMDD: "320821",
  //   cardID: "037092005238",
  //   isCheckBCA: true)                                                           

  //       // Set URL API
  //       nfc.setDomainURL("https://apig.idcheck.xplat.online/real-id/v1/api-gateway/check-nfc-objdg")
  //       // Set Token
  //       nfc.setToken("")

  //       nfc.scanPassport()
      
      
      // func NFCNotAvaiable() {
      //     self.errorAlert("Thiết bị không hỗ trợ hoặc không được bật NFC")
      // }
      
      // // Đọc NFC thành công
      // func NFCSuccess(model: NFCReader.NFCPassportModel) {
          
      // }
      // // Đọc NFC thất bại
      // func NFCFail(_ error: NFCReader.NFCPassportReaderError) {
      //     // Xử lý trong main queue
      //     DispatchQueue.main.async {
      //         switch error {
      //         case .InvalidMRZKey:
      //             self.errorAlert("Thông tin NFC không đúng, vui lòng nhập lại!", handler: nil)
      //         case .UserCanceled:
      //             break
      //         default:
      //             self.errorAlert("Mất kết nối giữa thẻ chip và thiết bị điện thoại \n Đặt lại thẻ vào vị trí và giữ nguyên.", handler: nil)
      //         }
      //     }
      // }
      // // Hoàn thành xác thực NFC, trả về thông tin dạng Json
      // func VerifySuccess(jsonData: NFCReader.JSON) {
      //     print("jsonData ::",jsonData)
      // }
      // // Xác thực NFC bị lỗi
      // func VerifyFail(_ error: NFCReader.AFError) {
      //     print("error ::",error)
      // }

  
  }
}


