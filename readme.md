# Authentication with google
You going to need a service account to authenticate with google.
Then you will need to download a service account key as json for the service account
You can do that via the google console's IAM section.

There are 2 ways to feed the service account key to terraform.
See comments in the provider.tf file to see how to use each one.

## GOOGLE_CREDENTIALS environmental variable
This is the safest method as the service account key will not be commited to the git repository.
You must simply provide the GOOGLE_CREDENTIALS environmental variable with the uglified json form of the key.

## Give the file directly
This is the less secure version as you must commit the service account key to your repo.
Simply download the service account key json and put it in the terraform folder with the name 
`service-account-key.json`

# Configuration
A `variables.tf` file must exist in the root directory.
This contains configuration option such as the name of your cluster, projectname, zone, etc
See the `variables.tf.example` file for reference.

# Terraform setup
Run the following command to download the terraform dependencies.
```
terraform init
```

# Node pools
This setup deletes the default nodepool created by terraform(a default pool needs to be created), and setups separate pools defined in the `nodepools.tf`. Tweak it to fit your needs.
The modules by default setups 3 node pools.
- A default pool
- An app pool with an app-pool NO_SCHEDULE taint
- A postgres-pool with a postgres-pool NO_SCHEDULE taint

# Master and pools versions
GKE Masters update on their own. Generaly google supports 2 kubernetes versions for the master.
(At the moment of writing 1.14 and 1.15)
You can specify the version for the master in the `variables.tf` file. If gke supports your master version, it will get the latest semver of your input and create the master with that version, else it will go to a newer version that gke supports.

The same goes for pools, but generally gke supports all pool versions. It will get the latest semver of your input from google and deploy the pool with that version.