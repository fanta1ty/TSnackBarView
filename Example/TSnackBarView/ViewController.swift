//
//  ViewController.swift
//  TSnackBarView
//
//  Created by thinhnguyen12389 on 08/13/2022.
//  Copyright (c) 2022 thinhnguyen12389. All rights reserved.
//

import UIKit
import TSnackBarView

class ViewController: UIViewController {
    private lazy var contentView = ContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [weak self] in
            guard let self = self else { return }
            
            TSnackBarServiceImpl.shared.show(on: self.view,
                                             message: "Normal SnackBar View\nPlease use Normal SnackBar View for displaying normal text message.",
                                             onTapCloseAction: { [weak self] normalSnackBarView in
                guard let self = self else { return }
                normalSnackBarView.dismiss()
                
                TSnackBarServiceImpl.shared.show(on: self.view,
                                                 message: "Success SnackBar View\nPlease use Success SnackBar View for displaying success text message.",
                                                 style: .success,
                                                 onTapCloseAction: { [weak self] successSnackBarView in
                    guard let self = self else { return }
                    
                    successSnackBarView.dismiss()
                    
                    TSnackBarServiceImpl.shared.show(on: self.view,
                                                     message: "Error SnackBar View\nPlease use Error SnackBar View for displaying error text message.",
                                                     style: .error,
                                                     onTapCloseAction: { errorSnackBarView in
                        errorSnackBarView.dismiss()
                    })
                })
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func loadView() {
        view = contentView
    }
}

