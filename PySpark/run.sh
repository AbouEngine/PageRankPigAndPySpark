#!/bin/bash

## En local ->
## spark -x local -

## en dataproc...

## copy data
gsutil cp small_page_links.nt gs://abou_bucket/

## copy spark code
gsutil cp pagerank.py gs://abou_bucket/

## Clean out directory
gsutil rm -rf gs://abou_bucket/out
gsutil rm -rf gs://abou_bucket/pySpark


## create the cluster
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west2 --zone europe-west2-c --master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type n1-standard-4 --worker-boot-disk-size 500 --image-version 2.0-debian10 --project pagerank-402917


## run
## (suppose that out directory is empty !!)
gcloud dataproc jobs submit pyspark --region europe-west2 --cluster cluster-a35a gs://abou_bucket/mypagerank.py  -- gs://abou_bucket/public_lddm_data/page_links_en.nt.bz2 3

## access results
gsutil cat gs://abou_bucket/out/pagerank_data_1/part-r-00000

## delete cluster...
gcloud dataproc clusters delete cluster-a35a --region europe-west1 --quiet
