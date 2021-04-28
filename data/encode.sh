set -ex

python encode.py < dev.en > dev.bpe.en
python encode.py < dev.ja > dev.bpe.ja
python encode.py < test.en > test.bpe.en
python encode.py < test.ja > test.bpe.ja

for N in {1..20}; do
    python encode.py --alpha 0.10 < train.en > train.bpe.${N}.en &
    python encode.py --alpha 0.10 < train.ja > train.bpe.${N}.ja &
done
wait

