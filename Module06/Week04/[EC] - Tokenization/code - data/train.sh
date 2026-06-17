
# VOCAB=bytes

# VOCAB=chars

# VOCAB=bpe2048
# VOCAB=bpe4096
# VOCAB=bpe16384

VOCAB=bbpe2048
# VOCAB=bbpe4096


CUDA_VISIBLE_DEVICES=0 fairseq-train \
    "data/bin_${VOCAB}" \
    --task translation \
    --arch transformer_iwslt_de_en \
    --share-decoder-input-output-embed \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --max-tokens 8192 \
    --eval-bleu \
    --eval-bleu-args '{"beam": 5, "max_len_a": 1.2, "max_len_b": 10}' \
    --eval-bleu-detok moses \
    --eval-bleu-remove-bpe \
    --eval-bleu-print-samples \
    --keep-best-checkpoints 1 --no-save-optimizer-state \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir "checkpoints/${VOCAB}" \
    --batch-size 256 --max-update 10000
