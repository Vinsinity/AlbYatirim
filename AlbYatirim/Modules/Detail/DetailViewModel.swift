//
//  DetailViewModel.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

// - MARK: ViewModel Protocol
protocol DetailViewModelProtocol: AnyObject {
    var delegate: DetailViewModelDelegate? { get set }
    func load()
}

// - MARK: Home ViewModel
class DetailViewModel: DetailViewModelProtocol {
    var delegate: (any DetailViewModelDelegate)?
    var symbol: String
    var requestCount = 2
    var startRequestCount = 0
    
    init(symbol: String) {
        self.symbol = symbol
    }
    
    func load() {
        delegate?.detailViewOutput(.setLoading(true))
        Service.shared.fetch(request: .init(endpoint: .symbol(symbol), method: .get)) { 
            [unowned self] (response: ServiceResult<GetSymbolResponse>) in
            startRequestCount += 1
            switch response {
            case .success(let response):
                let interst = response.payload.Sector?.SectorLabel ?? "YOK"
                delegate?.detailViewOutput(.showSector(sector: .init(companyDetail: .init(icon: response.payload.CoverImage, shortName: response.payload.ShortName ?? "Y", longName: response.payload.LongName ?? "Y"), interests: [interst]), changes: prepareChangesData(response.payload.LongProperty), statics: prepareStaticsData(response.payload.LongProperty)))
            case .failure(let error):
                print(error)
                delegate?.detailViewOutput(.showAlert(title: "Error", message: error.localizedDescription))
            }
            if startRequestCount == requestCount {
                delegate?.detailViewOutput(.setLoading(false))
            }
        }
        
        Service.shared.fetch(request: .init(endpoint: .getCompanyCard(symbol), method: .get)) { 
            [unowned self] (response: ServiceResult<GetDetailResponse>) in
            startRequestCount += 1
            switch response {
            case .success(let response):
                delegate?.detailViewOutput(.sectorInformation(information: prepareCompantInformationData(response.payload)))
            case .failure(let error):
                delegate?.detailViewOutput(.showAlert(title: "Error", message: error.localizedDescription))
            }
            if startRequestCount == requestCount {
                delegate?.detailViewOutput(.setLoading(false))
            }
        }
    }
    
    private func prepareCompantInformationData(_ data: Payload) -> [AboutCompanyItem] {
        var about: [AboutCompanyItem] = []
        if let generalManager = data.managementInformation.generalManager {
            about.append(.init(title: "CEO", content: generalManager))
        }
        
        if let empoloyeeNumber = data.aboutInformation.numberOfEmployee {
            about.append(.init(title: "Çalışan Sayısı", content: empoloyeeNumber))
        }
        
        if let phone = data.contactInformation.phone {
            about.append(.init(title: "Telefon", content: phone))
        }
        return about
    }
    
    private func prepareChangesData(_ data: GetBistDataLongProperty?) -> [SectorChangeItem] {
        let changes: [SectorChangeItem] = [
            .init(low: String(describing: data?.L ?? 0.0),
                  high: String(describing: data?.h ?? 0.0),
                  percentChange: data?.C ?? 0.0, period: "Günlük"),
            .init(low: String(describing: data?.wL ?? 0.0),
                  high: String(describing: data?.wH ?? 0.0),
                  percentChange: data?.WP ?? 0.0, period: "Haftalık"),
            .init(low: String(describing: data?.mL ?? 0.0),
                  high: String(describing: data?.mH ?? 0.0),
                  percentChange: data?.MP ?? 0.0, period: "Aylık"),
            .init(low: String(describing: data?.yL ?? 0.0),
                  high: String(describing: data?.yH ?? 0.0),
                  percentChange: data?.YP ?? 0.0, period: "Yıllık"),
        ]
        return changes
    }
    
    private func prepareStaticsData(_ data: GetBistDataLongProperty?) -> [SectorStaticItem] {
        
        var statics: [SectorStaticItem] = []
        
        if let open = data?.O {
            statics.append(.init(title: "Açılış", content: String(describing: open)))
        }
        
        if let close = data?.cl {
            statics.append(.init(title: "Kapanış", content: String(describing: close)))
        }
        
        if let high = data?.h {
            statics.append(.init(title: "En Yüksek", content: String(describing: high)))
        }
        
        if let low = data?.L {
            statics.append(.init(title: "En Düşük", content: String(describing: low)))
        }
        
        if let yearlyLow = data?.yL {
            statics.append(.init(title: "Yıllık En Düşük", content: String(describing: yearlyLow)))
        }
        
        if let yearlyhigh = data?.yH {
            statics.append(.init(title: "Yıllık En Yüksek", content: String(describing: yearlyhigh)))
        }
        
        if let bookValue = data?.Bv {
            statics.append(.init(title: "Defter Değeri", content: String(describing: bookValue)))
        }
        
        if let roe = data?.re {
            statics.append(.init(title: "Özsermaye Karlılık", content: String(describing: roe)))
        }
        
        if let Ll = data?.Ll {
            statics.append(.init(title: "Taban", content: String(describing: Ll)))
        }
        
        if let Ul = data?.Ul {
            statics.append(.init(title: "Tavan", content: String(describing: Ul)))
        }
        
        if let pE = data?.pE {
            statics.append(.init(title: "F/K", content: String(describing: pE)))
        }
        
        if let Pb = data?.Pb {
            statics.append(.init(title: "PP/DD", content: String(describing: Pb)))
        }
        
        if let mv = data?.mv {
            statics.append(.init(title: "Piysa Değeri", content: String(describing: mv)))
        }
        
        return statics
    }
}

enum DetailViewModelOutputs: Equatable {
    case setLoading(Bool)
    case showAlert(title: String, message: String)
    case showSector(sector: SectorDetailPresentModel, changes: [SectorChangeItem], statics: [SectorStaticItem])
    case sectorInformation(information: [AboutCompanyItem])
}

protocol DetailViewModelDelegate: AnyObject {
    func detailViewOutput(_ output: DetailViewModelOutputs)
}
