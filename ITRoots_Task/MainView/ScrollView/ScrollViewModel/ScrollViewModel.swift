//
//  ScrollViewModel.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation
import UIKit

class ScrollViewModel {
    let collectionArray = ["chelsea", "arsenal", "manchester city", "manchester united", "leicester city", "tottenham hotspur", "everton", "west ham united", "newcastle"]
    let teamPhotosArray: [UIImage] = [
        UIImage(named: "chelsea") ?? UIImage(),
        UIImage(named: "arsenal") ?? UIImage(),
        UIImage(named: "city") ?? UIImage(),
        UIImage(named: "united") ?? UIImage(),
        UIImage(named: "leicester") ?? UIImage(),
        UIImage(named: "tottenham") ?? UIImage(),
        UIImage(named: "everton") ?? UIImage(),
        UIImage(named: "west ham") ?? UIImage(),
        UIImage(named: "newcastle") ?? UIImage()
    ]
    
    let leagues = ["Premier League", "La Liga", "Ligue 1", "Bundesliga", "Serie A", "Serie B", "Eredivisie", "Champions League", "UEFA Europa League", "FIFA Club World Cup", "Copa America", "Caf Champions League", "Caf Confederation Cup" , "Caf Africa Nations Cup"]
    
    let leaguesImages: [UIImage] = [
        UIImage(named: "premier league") ?? UIImage(),
        UIImage(named: "laliga") ?? UIImage(),
        UIImage(named: "ligue 1") ?? UIImage(),
        UIImage(named: "Bundesliga") ?? UIImage(),
        UIImage(named: "seria a") ?? UIImage(),
        UIImage(named: "Serie B") ?? UIImage(),
        UIImage(named: "Eredivisie") ?? UIImage(),
        UIImage(named: "champion") ?? UIImage(),
        UIImage(named: "europe league") ?? UIImage(),
        UIImage(named: "FIFA Club World Cup") ?? UIImage(),
        UIImage(named: "Copa America") ?? UIImage(),
        UIImage(named: "CAF_Champions_League") ?? UIImage(),
        UIImage(named: "caf") ?? UIImage(),
        UIImage(named: "Caf Africa Nations Cup") ?? UIImage()
    ]
}
