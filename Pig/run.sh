## Créer un nouveau cluster sur GCP
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c --master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 1 --worker-machine-type n1-standard-4 --worker-boot-disk-size 500 --image-version 2.0-debian10 --project pagerank-402917

## Créer un bucket depuis l'interface graphique de GCP puis copier les données dans votre bucket avec la commande ci-dessous
gsutil cp -r gs://public_lddm_data/ gs://abou_bucket/

## Copier le code pig
gsutil cp dataproc.py gs://abou_bucket/

##Clean out directory
gsutil rm -rf gs://abou_bucket/out

## run
gcloud dataproc jobs submit pig --region europe-west1 --cluster cluster-a35a -f gs://abou_bucket/dataproc.py

## access results
gsutil cat -h gs://abou_bucket/out/pagerank_data_10/part-r-00000

## delete cluster...
gcloud dataproc clusters delete cluster-a35a --region europe-west1 --quiet
