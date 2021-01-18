func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
      completion(picture)
    } else {
      onFailure()
    }
}

loadPicture(from: someServer) { picture in 
  someView.currentPicture = picture
} onFailure: {
  print("Couldn't download the next picture.")
}