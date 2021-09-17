//
//  MovieListViewController.swift
//  zonezero
//
//  Created by AMBER ÇATALBAŞ on 14.09.2021.
//

import UIKit

class MovieListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  let movie = Movie()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    
  }
}

extension MovieListViewController: UITableViewDelegate,UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell {
      cell.movieTitle.text = movie.movieArrayList[indexPath.row]
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var movieTitle = movie.movieArrayList[indexPath.row]
    AlertUtility.present(title: "Movie Title", message: "\(movieTitle)", delegate: self)
  }
  
  
}
