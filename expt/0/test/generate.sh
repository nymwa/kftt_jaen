set -ex

for N in {11..20}; do
    fairseq-interactive ../../../data/data-bin-1/ \
        --buffer-size 1024 \
        --batch-size 128 \
        --path ../checkpoints/checkpoint${N}.pt \
        --beam 4 \
        --lenpen 0.6 \
        < ../../../data/test.bpe.ja \
        | grep '^H' \
        | cut -f 3 \
        | python ../../decode.py \
        > output.${N}.txt
done
