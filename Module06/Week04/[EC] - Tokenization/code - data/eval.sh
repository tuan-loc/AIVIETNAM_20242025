
# VOCAB=bytes

# VOCAB=chars

# VOCAB=bpe2048
# VOCAB=bpe4096
# VOCAB=bpe16384

VOCAB=bbpe2048
# VOCAB=bbpe4096


# BPE=--bpe bytes
# BPE=--bpe characters
BPE="--bpe byte_bpe --sentencepiece-model-path data/spm_bbpe2048.model"
# BPE=--bpe sentencepiece --sentencepiece-model data/spm_bpe2048.model
# BPE=--bpe byte_bpe --sentencepiece-model-path data/spm_bbpe4096.model
# BPE=--bpe sentencepiece --sentencepiece-model data/spm_bpe4096.model
# BPE=--bpe sentencepiece --sentencepiece-model data/spm_bpe16384.model

fairseq-generate \
    "data/bin_${VOCAB}" \
    --task translation \
    --arch transformer_iwslt_de_en \
    --share-decoder-input-output-embed \
    --source-lang de \
    --target-lang en \
    --gen-subset test \
    --sacrebleu --path "checkpoints/${VOCAB}/checkpoint_last.pt" \
    --tokenizer moses ${BPE} \
    --beam 5 --remove-bpe
