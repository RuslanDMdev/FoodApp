//
//  testViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 02.05.2023.
//

import UIKit
import SnapKit
import YandexMapsMobile

class testViewController: UIViewController, YMKUserLocationObjectListener {
    
    let mapButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Проложить маршрут", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    func onObjectAdded(with view: YMKUserLocationView) {
        
    }
    
    
    func onObjectRemoved(with view: YMKUserLocationView) { }
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) { }
    
    var mapView = YMKMapView()
    
    private let centerButton: UIButton = {
        let centerButton = UIButton()
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.setImage(UIImage(systemName: "dot.circle.fill"), for: .normal)
        centerButton.contentVerticalAlignment = .fill
        centerButton.contentHorizontalAlignment = .fill
        centerButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return centerButton
    }()
    
    private let zoomInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    private let zoomOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()

    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(500)
        }
        mapView.addSubview(centerButton)
        mapView.addSubview(zoomInButton)
        mapView.addSubview(zoomOutButton)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: YMKPoint(latitude: 42.963218, longitude: 47.496004), zoom: 12, azimuth: 0, tilt: 0),
               animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 1),
               cameraCallback: nil)
       
        let scale = UIScreen.main.scale
        let mapKit = YMKMapKit.sharedInstance()
        
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)

        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.isHeadingEnabled = true
   
        userLocationLayer.setObjectListenerWith(self)
        
        configureButtons()
        addAttractions()
        addConstraints()
        initialize()
    }

}
// MARK: - Private methods

private extension testViewController {
    func initialize(){
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.text = "Маршрут"
        navigationItem.titleView = titleLabel
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        
        view.addSubview(mapButton)
        mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        mapButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(50)
        }
        
    }
    
    func configureButtons(){
        centerButton.addTarget(self, action: #selector(clickOnCenterButton), for: .touchUpInside)
        zoomInButton.addTarget(self, action: #selector(zoomIn), for: .touchUpInside)
        zoomOutButton.addTarget(self, action: #selector(zoomOut), for: .touchUpInside)
    }
    
    @objc func clickOnCenterButton(){
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.mapView.mapWindow.map.move(with: YMKCameraPosition.init(target: YMKPoint.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), zoom: 8, azimuth: 0, tilt: 0))
                
                LocationManager.shared.resolveLoactionName(with: location) { [weak self] name in
                    strongSelf.title = name
                }
                
            }
        }
    }
    
    @objc func zoomIn(){
        print("zoomed in")
        let zoom = mapView.mapWindow.map.cameraPosition
        mapView.mapWindow.map.move(with: YMKCameraPosition.init(target: YMKPoint.init(latitude: mapView.mapWindow.map.cameraPosition.target.latitude, longitude: mapView.mapWindow.map.cameraPosition.target.longitude), zoom: zoom.zoom + 1.5, azimuth: 0, tilt: 0))
       
    }
    
    @objc func zoomOut(){
        let zoom = mapView.mapWindow.map.cameraPosition
        mapView.mapWindow.map.move(with: YMKCameraPosition.init(target: YMKPoint.init(latitude: mapView.mapWindow.map.cameraPosition.target.latitude, longitude: mapView.mapWindow.map.cameraPosition.target.longitude), zoom: zoom.zoom - 1.5, azimuth: 0, tilt: 0))
    }
    
    func addAttractions(){
        let mapObjects = mapView.mapWindow.map.mapObjects
        let style = YMKIconStyle(
            anchor: CGPoint(x: 5, y: 5) as NSValue,
            rotationType:YMKRotationType.rotate.rawValue as NSNumber,
            zIndex: 5,
            flat: true,
            visible: true,
            scale: 5,
            tappableArea: nil)
        
        let textViewOne =
            UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
        let pointOne = YMKPoint(latitude: 42.963218, longitude: 47.496004)
        textViewOne.text = "Ван Лав"
        let viewProviderOne = YRTViewProvider(uiView: textViewOne)!;
        let placemarkOne = mapObjects.addPlacemark(with: pointOne, view: viewProviderOne)
        placemarkOne.opacity = 1
        placemarkOne.isDraggable = true
        placemarkOne.setIconStyleWith(style)
        placemarkOne.setIconWith(UIImage(named: "Location2")!)
        
//        let textViewTwo =
//            UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
//        let pointTwo = YMKPoint(latitude: 43.017452, longitude: 46.824505)
//        textViewTwo.text = "Сулакский каньон"
//        let viewProviderTwo = YRTViewProvider(uiView: textViewTwo)!;
//        let placemarkTwo = mapObjects.addPlacemark(with: pointTwo, view: viewProviderTwo)
//        placemarkTwo.opacity = 1
//        placemarkTwo.isDraggable = true
//        placemarkTwo.setIconStyleWith(style)
//        placemarkTwo.setIconWith(UIImage(named: "Location")!)
//
//        let textViewThree =
//            UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
//        let pointThree = YMKPoint(latitude: 42.386158, longitude: 46.962594)
//        textViewThree.text = "Гуниб"
//        let viewProviderThree = YRTViewProvider(uiView: textViewThree)!;
//        let placemarkThree = mapObjects.addPlacemark(with: pointThree, view: viewProviderThree)
//        placemarkThree.opacity = 1
//        placemarkThree.isDraggable = true
//        placemarkThree.setIconStyleWith(style)
//        placemarkThree.setIconWith(UIImage(named: "Location")!)
        
    }
    
    func addConstraints() {


        zoomInButton.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.bottom.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(20)
        }

        zoomOutButton.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.bottom.equalToSuperview().inset(50)
            make.right.equalTo(zoomInButton).inset(20)
        }

    }
    
    // MARK: - Move to another controller
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        let mainVC = MainViewController()
        let navVC = UINavigationController(rootViewController: mainVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    @objc private func mapButtonTapped() {
//        guard let url = Foundation.URL(string: "https://yandex.ru/maps/?rtext=42.964443,47.508204~43.010154,47.229627~43.017452,46.824505~42.386158,46.962594") else {
//            return
//        }
        guard let url = Foundation.URL(string: "https://yandex.ru/maps/?rtext=42.964443,47.508204~42.963218,47.496004") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
