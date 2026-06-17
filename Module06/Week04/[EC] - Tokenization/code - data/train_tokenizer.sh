
#!/bin/bash
python train_tokenizer.py --bpe-vocab 16384 --byte-vocab --char-vocab
for VOCAB_SIZE in 2048 4096; do
  python train_tokenizer.py --bpe-vocab ${VOCAB_SIZE} --bbpe-vocab ${VOCAB_SIZE}
done
