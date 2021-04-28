set -ex

DATABIN=../../data/data-bin-1
for N in {2..20}; do
    DATABIN=${DATABIN}:../../data/data-bin-${N}
done

fairseq-train \
    $DATABIN \
    --seed 33308 \
    --log-interval 1 \
    --log-format simple \
    --fp16 \
    --max-epoch 20 \
    --update-freq 4 \
    --max-tokens 10000 \
    --arch transformer \
    --encoder-normalize-before \
    --decoder-normalize-before \
    --encoder-embed-dim 512 \
    --encoder-ffn-embed-dim 2048 \
    --encoder-attention-heads 8 \
    --decoder-embed-dim 512 \
    --decoder-ffn-embed-dim 2048 \
    --decoder-attention-heads 8 \
    --share-all-embeddings \
    --dropout 0.1 \
    --attention-dropout 0.1 \
    --activation-dropout 0.1 \
    --activation-fn relu \
    --optimizer adam \
    --adam-betas '(0.9, 0.999)' \
    --lr 0.003 \
    --lr-scheduler inverse_sqrt \
    --warmup-updates 1000 \
    --warmup-init-lr 1e-07 \
    --clip-norm 0.3 \
    --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy \
    --label-smoothing 0.1 \
    | tee train.log

