//
//  RandomImgVC.swift
//  FindColor
//
//  Created by Taewoo Kim on 2022/01/31.
//

import UIKit
import RxSwift
import RxCocoa

class RandomImgVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    private var viewModel: RandomImgListViewModel!
    
    static func instantiate(viewModel: RandomImgListViewModel) -> RandomImgVC {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! RandomImgVC
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        navigationItem.rightBarButtonItem = viewModel.refreshBtn
        
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        getImgListData()
        
        collectionView.rx.modelSelected(RandomImgViewModel.self)
            .subscribe(onNext: { (model) in
            }).disposed(by: disposeBag)
        
        viewModel.refreshBtn.rx.tap.asDriver()
            .throttle(.seconds(5))
            .drive(onNext: { [self]_ in
                collectionView.dataSource = nil
                getImgListData()
            }).disposed(by: disposeBag)
    }
    
    private func presentDetailView(img: RandomImage){
        
    }
    
    private func getImgListData(){
        viewModel.fetchRandomImgViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: "cell", cellType: ImgCollectionViewCell.self)) { index, viewModel, cell in
            cell.randomIV.image = viewModel.thumbImg
        }.disposed(by: disposeBag)
    }
}

extension RandomImgVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = (width - 30) / 3 // compute your cell width
        return CGSize(width: cellWidth, height: cellWidth / 0.6)
    }
}
