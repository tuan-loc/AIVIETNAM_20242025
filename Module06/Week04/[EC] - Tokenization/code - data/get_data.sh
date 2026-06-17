
#!/bin/bash
if [ ! -d "data" ]; then
  mkdir data
fi

if [ ! -f "data/IWSLT17.zip" ]; then
  wget https://huggingface.co/datasets/tmnam20/AIO_Tokenizer/resolve/main/IWSLT17.zip -P data
  unzip -qq data/IWSLT17.zip -d data
  mv data/IWSLT17 data/de-en
fi
