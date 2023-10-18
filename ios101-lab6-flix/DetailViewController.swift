//
//  DetailViewController.swift
//  ios101-lab6-flix
//
//  Created by Paul Leiva on 10/18/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Prevent large titles for the DetailViewController
        navigationItem.largeTitleDisplayMode = .never
        
        /// Configure the labels
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
        /// Unwrap the optional vote average
        if let voteAverage = movie.voteAverage {
            // voteAverage is a Double
            /// We can convert it to a String using `\(movie.voteAverage)` (aka *String Interpolation*)
            /// inside String quotes (aka: * string literal *)
            voteLabel.text = "Vote Average: \(voteAverage)"
        }
        else {
            // if voteAverage is nil, set the voteLabel text to an empty string
            voteLabel.text = ""
        }
        
        /// The `releaseDate` is of type `Date`. We can convert it to a String using a `DateFormatter`.
        /// Create a `DateFormatter`
        let dateFormatter = DateFormatter()
        
        /// Set the date style for how the date formatter will display the date as a String
        /// You can experiment with other settings like, `.short`, `.long`, and `.full`
        dateFormatter.dateStyle = .medium
        
        // Unwrap the optional release date
        if let releaseDate = movie.releaseDate {
            /// Use the `DateFormatter`'s `string(from: Date)` method to convert the date to a String
            let releaseDateString = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = "Release Date: \(releaseDateString)"
        }
        else {
            /// if the release date is `nil`, set the `releaseDateLabel` text to an empty String
            releaseDateLabel.text = ""
        }
        
        // MARK: - Configure the image views
        
        /// Unwrap the optional posterPath
        if let posterPath = movie.posterPath,
        
        /// Create a URL by appending the posterPath to the base URL. https://developers.themoviedb.org/3/getting-started/images
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
            
            /// Use the Nuke library's load image function to (async) fetch and load the image from the image URL.
            Nuke.loadImage(with: imageUrl, into: posterImageView)
        }
        
        /// Unwrap the optional backdrop path
        if let backdropPath = movie.backdropPath,
           
        /// Create a URL by appending the backdrop path to the base URL. https://developers.themoviedb.org/3/getting-started/images
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {
            
            /// Use the Nuke library's load image function to (async) fetch and load the image form the imageUrl
            Nuke.loadImage(with: imageUrl, into: backdropImageView)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
