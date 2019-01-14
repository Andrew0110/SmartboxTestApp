//
//  ViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class TTPlacesViewController: BaseVC {

    @IBOutlet weak var placesTableView: UITableView!

    var currentType: TTPlaceType = .event
    
//  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadPlaces()
    }
    
//  MARK: - Preparations
    private func setupTableView() {
        placesTableView.delegate = self
        placesTableView.dataSource = self
        placesTableView.tableFooterView = UIView()
        
        placesTableView.estimatedRowHeight = 100
    }
    
//  MARK: - Actions
    @IBAction func segmentedControlChanged(_ segmentControl: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            currentType = .event
        } else {
            currentType = .shop
        }
        placesTableView.reloadData()
    }
    
//  MARK: - Network Actions
    private func loadPlaces() {
        showActivityIndicator()
        TTPlaceAPIManager.instance.getTTPlaces { [weak self] (places, error) in
            if error != nil {
                self?.showAlert(error!)
            }
            TTPlacesStore.instance.setPlaces(places)
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.placesTableView.reloadData()
            }
        }
    }
}

//  MARK: - TableView methods
extension TTPlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TTPlacesStore.instance.getPlaces(with: currentType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TTPlaceCell", for: indexPath) as? TTPlaceCell else {
            return UITableViewCell()
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TTPlaceCell else { return }
        
        let place = TTPlacesStore.instance.getPlaces(with: currentType)[indexPath.row]
        cell.configure(with: place);
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let place = TTPlacesStore.instance.getPlaces(with: currentType)[indexPath.row]
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TTPlaceDetailViewController") as? TTPlaceDetailViewController else { return }
        vc.place = place
        navigationController?.pushViewController(vc, animated: true)
    }
}
