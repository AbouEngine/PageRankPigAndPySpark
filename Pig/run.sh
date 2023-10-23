## Creer un nouveau cluster sur GCP
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c --master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type n1-standard-4 --worker-boot-disk-size 500 --image-version 2.0-debian10 --project master-2-large-scale-data

## Créer un bucket depuis l'interface graphique de GCP puis copier les données dans votre bucket avec la commande ci-dessous
gsutil cp -r gs://public_lddm_data/ gs://abou_bucket/

## Copier le code pig
gsutil cp dataproc.py gs://abou_bucket/

##Clean out directory
gsutil rm -rf gs://abou_bucket/out
