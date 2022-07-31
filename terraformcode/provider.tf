provider "google" {
  credentials = "${file("/home/ismailramadan/credinetial.json")}"
  project     = "ismail-354112"
  region      = "us-central1"
  zone = "us-central1-a"
  
}