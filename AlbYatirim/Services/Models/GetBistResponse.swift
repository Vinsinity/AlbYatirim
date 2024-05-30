//
//  GetBistResponse.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import Foundation

struct GetBistResponse: Codable {
    var success: Bool
    var code: Int
    var message: String?
    var errors: [String]?
    var payload: BistPayload
}

struct BistPayload: Codable {
    var data: [GetBistData]
    var pagination: GetBistPagination
}

struct GetBistPagination: Codable {
    var pageSize: Int
    var totalPage: Int
    var totalRecords: Int
}

struct GetBistData: Codable {
    var UniqueID: String?
    var HisseHesap: String?
    var AnalysisSchema: String?
    var CategoryType: String?
    var LegacyCode: String?
    var ShortName: String?
    var LongName: String?
    var Precision: Int?
    var CoverImage: String
    var Sector: GetBistDataSector?
    var ShortProperty: GetBistDataShortProperty?
    var LongProperty: GetBistDataLongProperty?
    var UpdatedAt: String?
}

struct GetBistDataSector: Codable {
    var SectorValue: String?
    var SectorLabel: String?
}

struct GetBistDataShortProperty: Codable {
    var bid: String?
    var ask: String?
    var dailyVolume: String?
    var dailySumPrice: String?
    var dailyPercent: String?
    var weeklyPercent: String?
    var monthlyPercent: String?
    var yearlyPercent: String?
}

struct GetBistDataLongProperty: Codable {
    var C: Double?
    var E: Double?
    var L: Double?
    var O: Double?
    var W: Double?
    var a: Double?
    var b: Double?
    var c: Double?
    var d: Double?
    var h: Double?
    var l: Double?
    var v: Double?
    var Bv: Double?
    var CP: Double?
    var Dy: Double?
    var Ll: Double?
    var Nc: Double?
    var Ul: Double?
    var Wc: Double?
    var _i: String?
    var cl: Double?
    var dd: Double?
    var dt: Double?
    var mc: Double?
    var mp: Double?
    var mv: Double?
    var pE: Double?
    var Pb: Double?
    var pc: Double?
    var re: Double?
    var tT: Double?
    var tV: Double?
    var vo: Double?
    var wC: Double?
    var wH: Double?
    var wL: Double?
    var wa: Double?
    var wc: Double?
    var wp: Double?
    var yD: Double?
    var yH: Double?
    var yI: Double?
    var yc: Double?
    var yL: Double?
    var yp: Double?
    var WP: Double?
    var MP: Double?
    var YP: Double?
    var mL: Double?
    var mH: Double?
}
