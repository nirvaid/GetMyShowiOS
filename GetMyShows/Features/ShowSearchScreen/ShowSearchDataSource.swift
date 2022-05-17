//
//  ShowSearchDataSource.swift
//  GetMyShows
//
//  Created by user220159 on 4/19/22.
//

import Foundation
import UIKit
class ShowSearchDataSource : NSObject , UITableViewDataSource{
    
    var displayShows = [DisplayShows]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : ShowSearchTableViewCell =
                tableView.dequeueReusableCell(withIdentifier:String(describing:ShowSearchTableViewCell.self)) as? ShowSearchTableViewCell else { return .init() }
        // todo configure cell here with Model Array
        cell.configure(displayShow: displayShows[indexPath.row])
        return cell
    }    
}
