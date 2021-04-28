import sentencepiece as spm

if __name__ == '__main__':
    spm.SentencePieceTrainer.Train(
            input = 'train.jaen',
            model_prefix = 'kftt',
            model_type = 'bpe',
            vocab_size = 16000,
            character_coverage = 0.9995,
            num_threads = 16)
