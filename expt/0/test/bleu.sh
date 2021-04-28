set -ex

for N in {11..20}; do
    perl ../../multi-bleu.perl ../../../data/test.en < output.${N}.txt > result.${N}.txt
done
