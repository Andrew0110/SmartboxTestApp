//
//  ViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class PlacesViewController: BaseVC {

    @IBOutlet weak var placesTableView: UITableView!

    var currentType: PlaceType = .event
    
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
    }
    
    //  MARK: - Actions
    @IBAction private func segmentedControlChanged(_ segmentControl: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            currentType = .event
        } else {
            currentType = .shop
        }
        placesTableView.reloadData()
    }
    
    //  MARK: - Network Actions
    private func loadPlaces() {
        activityIndicator(active: true)
        PlaceAPIManager.instance.getTTPlaces { [weak self] (places, error) in
            if let error = error {
                self?.showAlert(error)
            }
            PlacesStore.instance.setPlaces(places)
            DispatchQueue.main.async {
                self?.activityIndicator(active: false)
                self?.placesTableView.reloadData()
            }
        }
    }
}

//  MARK: - TableView methods
extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlacesStore.instance.getPlaces(with: currentType).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? PlaceCell else { return }
        
        let place = PlacesStore.instance.getPlaces(with: currentType)[indexPath.row]
        cell.configure(with: place);
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let place = PlacesStore.instance.getPlaces(with: currentType)[indexPath.row]
        
        let vc = PlaceDetailViewController.storyboardInstance()
        vc.place = place
        navigationController?.pushViewController(vc, animated: true)
    }
}
