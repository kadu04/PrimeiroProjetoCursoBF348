//
//  History.swift
//  Roleta
//
//  Created by Ricardo Massaki on 04/04/23.
//

import Foundation

// Feito na mão
//struct History {
//    var totalValue: Double
//    var historyAccountList: [historyAccountList]
//}
//
//struct historyAccountList {
//    var historyID: String
//    var date: String
//    var name: String
//    var price: Double
//    var iconImage: String
//}

//MARK: - Decodable
// Decodifica, ou seja, transforma um tipo de json em um objeto SWIFT.

//MARK: - Encodable
// Codifica, ou seja, transforma um tipo de dado no Swift em json.

//MARK: - Codable -> É MELHOR SEMPRE USAR O CODABLE !!!
// Codifica e decodifica.


//20-Transformar os arquivos json em swift


// Feito no quicktype -> é melhor colocar tudo como opcional, caso queira modificar depois.

// MARK: - History
struct History: Codable {
    var totalValue: Double?
    var historyAccountList: [HistoryAccountList]?
}

// MARK: - HistoryAccountList
struct HistoryAccountList: Codable {
    var historyID: String?
    var date: String?
    var name: String?
    var price: Double?
    var iconImage: String?
}
