set -ex

perl lowercase.perl \
    < ../corpora/kftt-data-1.0/data/tok/kyoto-train.cln.en \
    > train.en

perl lowercase.perl \
    < ../corpora/kftt-data-1.0/data/tok/kyoto-train.cln.ja \
    > train.ja

cat train.en train.ja > train.jaen

perl lowercase.perl \
    < ../corpora/kftt-data-1.0/data/tok/kyoto-dev.en \
    > dev.en

perl lowercase.perl \
    < ../corpora/kftt-data-1.0/data/tok/kyoto-dev.ja \
    > dev.ja

perl lowercase.perl \
    < ../corpora/kftt-data-1.0/data/tok/kyoto-test.en \
    > test.en

perl lowercase.perl \
    < ../corpora/kftt-data-1.0/data/tok/kyoto-test.ja \
    > test.ja
