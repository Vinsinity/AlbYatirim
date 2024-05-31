//
//  GetDetailResponse.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import Foundation

struct GetDetailResponse: Codable {
    let success: Bool
    let code: Int
    let message: String?
    let payload: Payload
    let errors: [String]?
}

// MARK: - Payload
struct Payload: Codable {
    let aboutInformation: AboutInformation
    let contactInformation: ContactInformation
    let managementInformation: ManagementInformation
    let partnerInformation, shareHolderInformation, exchangePositionInformation: [Information]

    enum CodingKeys: String, CodingKey {
        case aboutInformation = "AboutInformation"
        case contactInformation = "ContactInformation"
        case managementInformation = "ManagementInformation"
        case partnerInformation = "PartnerInformation"
        case shareHolderInformation = "ShareHolderInformation"
        case exchangePositionInformation = "ExchangePositionInformation"
    }
}

// MARK: - AboutInformation
struct AboutInformation: Codable {
    let bistCode: String?
    let coverImage: String?
    let companyName, ipoDate, firstTransactionDate: String?
    let registeredCapital: String?
    let numberOfEmployee, foundationDate: String?

    enum CodingKeys: String, CodingKey {
        case bistCode = "BistCode"
        case coverImage = "CoverImage"
        case companyName = "CompanyName"
        case foundationDate = "FoundationDate"
        case ipoDate = "IpoDate"
        case firstTransactionDate = "FirstTransactionDate"
        case registeredCapital = "RegisteredCapital"
        case numberOfEmployee = "NumberOfEmployee"
    }
}

// MARK: - ContactInformation
struct ContactInformation: Codable {
    let phone, fax, address: String?
    let website: [String]?

    enum CodingKeys: String, CodingKey {
        case phone = "Phone"
        case fax = "Fax"
        case address = "Address"
        case website = "Website"
    }
}

// MARK: - Information
struct Information: Codable {
    let name, capital: String?
    let percent: String?
}

// MARK: - ManagementInformation
struct ManagementInformation: Codable {
    let generalManager: String?
    let boardMembers: [String]?

    enum CodingKeys: String, CodingKey {
        case generalManager = "GeneralManager"
        case boardMembers = "BoardMembers"
    }
}
