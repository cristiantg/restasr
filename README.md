
# restasr

Example of a Kaldi project structure for real-time decoding.

**INPUT**: .wav files in (`raw_data` folder).

**OUTPUT**: .ctm files (`output` folder).

Execution: **server-load.sh** : set the correct values of your input file to call the decode service.


## Preparation

**path.sh** : set the correct `KALDI_ROOT` value. 

***model* folder**: you must include here your `model` files (not included in this repo. for obvious reasons). You can obtain such a folder with the following commands after you have trained your models (or just move your files accordingly manually):

    # steps/online/nnet3/prepare_online_decoding.sh --mfcc-config conf/mfcc_hires.conf data/lang_chain exp/nnet3_cleaned/extractor exp/chain_cleaned/tdnn1a_sp_bi exp/tdnn1a_sp_bi_online
    # utils/mkgraph.sh --self-loop-scale 1.0 data/lang_s_test_tgpr exp/tdnn1a_sp_bi_online exp/tdnn1a_sp_bi_online/graph_s

    # Then you need to change the absolute paths inthese two files:
    `model/v1.0/tdnn_1d_sp_online/conf/ivector_extractor.conf`
    `model/v1.0/tdnn_1d_sp_online/conf/online.conf`

***out_hclg* folder** folder: In this folder there must be the graph HCLG.fst, among others.

**uber_single** : set the correct values of your folders and files (*model* and *out_hclg* folders).



## Tree structure of the project

    .
    ├── cmd.sh
    ├── model
    │   └── tdnn
    │       └── v1.0
    │           ├── conf
    │           │   ├── ivector_extractor.conf
    │           │   ├── ivector_extractor.conf.orig
    │           │   ├── mfcc.conf
    │           │   ├── online.conf
    │           │   ├── online.conf.orig
    │           │   ├── online_cmvn.conf
    │           │   └── splice.conf
    │           ├── final.mdl
    │           ├── frame_subsampling_factor
    │           ├── ivector_extractor
    │           │   ├── final.dubm
    │           │   ├── final.ie
    │           │   ├── final.mat
    │           │   ├── global_cmvn.stats
    │           │   ├── online_cmvn.conf
    │           │   └── splice_opts
    │           ├── nnet3.info
    │           └── tree
    ├── out_hclg
    │   ├── HCLG.fst
    │   ├── disambig_tid.int
    │   ├── num_pdfs
    │   ├── phones
    │   │   ├── align_lexicon.int
    │   │   ├── align_lexicon.txt
    │   │   ├── disambig.int
    │   │   ├── disambig.txt
    │   │   ├── optional_silence.csl
    │   │   ├── optional_silence.int
    │   │   ├── optional_silence.txt
    │   │   ├── silence.csl
    │   │   ├── word_boundary.int
    │   │   └── word_boundary.txt
    │   ├── phones.txt
    │   └── words.txt
    ├── path.sh
    ├── raw_data # Here you put your audio files
    ├── server-load.sh
    ├── uber_single.sh
    └── utils (you can create it with: ln -s $KALDI_ROOT/egs/wsj/s5/utils/ utils)
    

## Run
    cd <this_project_path> && chmod -R 775 ./*
    # Be sure to set the correct paths in: path.sh, server-load.sh and 
    ./server-load.sh



## Contact and credits
Cristian Tejedor-García

[Centre for Language and Speech Technology](https://www.ru.nl/clst/)

Email: cristian [dot] tejedorgarcia [at] ru [dot] nl
