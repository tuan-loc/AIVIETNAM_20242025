
#!/bin/bash
fairseq-preprocess --source-lang de --target-lang en --destdir data/bin_bpe16384 --joined-dictionary \
  --workers "$(nproc)" --trainpref data/train.moses.bpe16384 --validpref data/valid.moses.bpe16384 \
  --testpref data/test.moses.bpe16384

fairseq-preprocess --source-lang de --target-lang en --destdir data/bin_bytes --joined-dictionary \
  --workers "$(nproc)" --trainpref data/train.moses.bytes --validpref data/valid.moses.bytes \
  --testpref data/test.moses.bytes

fairseq-preprocess --source-lang de --target-lang en --destdir data/bin_chars --joined-dictionary \
  --workers "$(nproc)" --trainpref data/train.moses.chars --validpref data/valid.moses.chars \
  --testpref data/test.moses.chars

for VOCAB_SIZE in 2048 4096; do
  for TYPE in bbpe bpe; do
    fairseq-preprocess --source-lang de --target-lang en --destdir "data/bin_${TYPE}${VOCAB_SIZE}" \
      --joined-dictionary --workers "$(nproc)" --trainpref "data/train.moses.${TYPE}${VOCAB_SIZE}" \
      --validpref "data/valid.moses.${TYPE}${VOCAB_SIZE}" --testpref "data/test.moses.${TYPE}${VOCAB_SIZE}"
  done
done
