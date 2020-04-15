provider "google" {
  #Comment the below credentials line if you feed the service account credentials via the GOOGLE_CREDENTIALS environmental variable
  credentials = "${file("service-account-key.json")}"
  project     = "${var.projectname}"
  zone      = "${var.zonename}"
}