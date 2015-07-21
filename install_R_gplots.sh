#!/bin/bash
apt-get update && apt-get install -y curl r-base
curl -O http://cran.ma.imperial.ac.uk/src/contrib/Archive/gplots/gplots_2.6.0.tar.gz
tar xzf gplots_2.6.0.tar.gz

cat <<EOF > /tmp/inst.sh

options(repos=structure(c(CRAN="http://cran.ma.imperial.ac.uk")))

install.packages("gtools")
install.packages("gdata")
install.packages("gplots", repos = NULL, type="source")
EOF

Rscript /tmp/inst.sh

rm /tmp/inst.sh
