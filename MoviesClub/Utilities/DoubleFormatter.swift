//
//  DoubleFormatter.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import Foundation


let doubleFormatter : NumberFormatter = {
        let numberForm = NumberFormatter()
        numberForm.numberStyle = .decimal
        numberForm.minimumFractionDigits = 0
        numberForm.maximumFractionDigits = 1
        return numberForm
    }()
