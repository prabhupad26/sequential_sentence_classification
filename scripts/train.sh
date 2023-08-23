#!/bin/bash

export SEED=15270
export PYTORCH_SEED=`expr $SEED / 10`
export NUMPY_SEED=`expr $PYTORCH_SEED / 10`

# path to bert vocab and weights
export BERT_VOCAB=allenai/scibert_scivocab_uncased
export BERT_WEIGHTS=allenai/scibert_scivocab_uncased

# path to dataset files
export TRAIN_PATH=/cluster/home/repo/sequential_sentence_classification/data/CSAbstruct/train.jsonl
export DEV_PATH=/cluster/home/repo/sequential_sentence_classification/data/CSAbstruct/dev.jsonl
export TEST_PATH=/cluster/home/repo/sequential_sentence_classification/data/CSAbstruct/test.jsonl

# model
export USE_SEP=true  # true for our model. false for baseline
export WITH_CRF=false  # CRF only works for the baseline

# training params
export cuda_device=0
export BATCH_SIZE=4
export LR=5e-5
export TRAINING_DATA_INSTANCES=1668
export NUM_EPOCHS=2

# limit number of sentneces per examples, and number of words per sentence. This is dataset dependant
export MAX_SENT_PER_EXAMPLE=10
export SENT_MAX_LEN=80

# this is for the evaluation of the summarization dataset
export SCI_SUM=false
export USE_ABSTRACT_SCORES=false
export SCI_SUM_FAKE_SCORES=false  # use fake scores for testing

CONFIG_FILE=/cluster/home/repo/sequential_sentence_classification/sequential_sentence_classification/config.jsonnet

python -m allennlp train $CONFIG_FILE --include-package sequential_sentence_classification -s $SERIALIZATION_DIR "$@"
