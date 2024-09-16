//
//  CountryListVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab
//


import UIKit
import FittedSheets

protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(country: Country)
}

struct Country {
    let image: UIImage
    let label: String
}

class CountryListVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    weak var delegate: CountrySelectionDelegate?
    
    var countries: [Country] = [Country(image: UIImage(named: "unitedStates")!, label: "United States")]
    
    @IBOutlet weak var countryListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countryListTableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        countryListTableView.delegate = self
        countryListTableView.dataSource = self
        countryListTableView.separatorStyle = .none
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = countryListTableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell else {
            return CountryTableViewCell()
        }
        let country = countries[indexPath.row]
        cell.cellImg.image = country.image
        cell.cellLabel.text = country.label
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CountryTableViewCell {
            cell.backgroundColor = Colors.countryCellColor
            
            cell.checkMark.image = UIImage(named: "checkMark")
            
            let country = countries[indexPath.row]
            delegate?.didSelectCountry(country: country)
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
