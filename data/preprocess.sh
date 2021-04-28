set -ex

fairseq-preprocess -s ja -t en \
    --trainpref train.bpe.1 \
    --validpref dev.bpe \
    --testpref test.bpe \
    --destdir data-bin-1 \
    --joined-dictionary \
    --workers 12

for N in {2..20}; do
fairseq-preprocess -s ja -t en \
    --trainpref train.bpe.${N} \
    --validpref dev.bpe \
    --testpref test.bpe \
    --destdir data-bin-${N} \
    --srcdict data-bin-1/dict.ja.txt \
    --joined-dictionary \
    --workers 12
done

