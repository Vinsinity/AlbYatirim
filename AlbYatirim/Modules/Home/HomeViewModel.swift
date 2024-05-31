//
//  HomeViewModel.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Alamofire

// - MARK: ViewModel Protocol
protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewModelDelegate? { get set }
    var router: HomeRouter? { get set }
    func load()
    func selectRow(at index: Int)
}

// - MARK: Home ViewModel
class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: (any HomeViewModelDelegate)?
    var router: HomeRouter?
    var sectors: [SectorListTableViewCellPresentModel] = []
    
    // MARK: Load functionality
    func load() {
        delegate?.homeViewOutput(output: .setLoading(true))
        let parameters: Parameters = [
            "pagination": "false",
            "offset": 1,
            "limit": 30,
            "sector": "S8212",
        ]
        
        Service.shared.fetch(request: .init(parameters: parameters, endpoint: .getStocks("Bist"), method: .get, encoding: URLEncoding.default)) {
            [unowned self] (response: ServiceResult<GetBistResponse>) in
            
            delegate?.homeViewOutput(output: .setLoading(false))
            switch response {
            case .success(let response):
                self.prepareResponse(response: response)
            case .failure(let error):
                delegate?.homeViewOutput(output: .showAlert(title: "", message: error.localizedDescription))
            }
        }
    }
    
    // MARK: Prepare response for view
    func prepareResponse(response: GetBistResponse) {
        var sectors: [SectorListTableViewCellPresentModel] = []
        for sector in response.payload.data {
            sectors.append(SectorListTableViewCellPresentModel(icon: sector.CoverImage, shortName: sector.ShortName ?? "ERH", longName: sector.LongName ?? "ERHAN", change: sector.LongProperty?.C ?? 911, price: Double(sector.ShortProperty?.dailySumPrice ?? "0.0") ?? 0.0))
        }
        self.sectors = sectors
        delegate?.homeViewOutput(output: .showList(sectorList: sectors))
    }
    
    // MARK: Select a row from view list
    func selectRow(at index: Int) {
        router?.route(to: .detail(symbol: sectors[index].shortName), parameters: nil)
    }
    
}

// - MARK: ViewModel Outputs
enum HomeViewModelOutputs: Equatable {
    case setLoading(Bool)
    case showAlert(title: String, message: String)
    case showList(sectorList: [SectorListTableViewCellPresentModel])
}

// - MARK: ViewModel Delegate
protocol HomeViewModelDelegate: AnyObject {
    func homeViewOutput(output: HomeViewModelOutputs)
}
