import UIKit

enum Currency {
    case cad
    case mxn
}

let usToCad = 1.34
let usToMxn = 20.11

var currency: Currency = .mxn

let currencyFormatter:NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .currency
    return nf
}()

func convert(_ dollars: Double) -> Double {
    switch (currency){
        case .cad:
            return dollars * usToCad
        case .mxn:
            return dollars * usToMxn
    }
}

func convertString(amountString: String) -> String? {
    guard let amount = Double(amountString) else {
        return nil
    }
    return currencyFormatter.string(from: NSNumber(value: convert(amount)))
}

print(convertString(amountString: "20")!)
print(convertString(amountString: "1")!)
