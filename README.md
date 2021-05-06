
# restasr

Kaldi project for real-time decoding.

**INPUT**: wav file in (`raw_data` folder).

**OUTPUT**: ctm file (`output` folder).

## Preparation

**exp** **folder**: you must include here your `tdnn1a_sp_bi_online` folder (not included in this repo. for copyright). You can obtain such a folder with the following commands after you have trained your models:

    # steps/online/nnet3/prepare_online_decoding.sh --mfcc-config conf/mfcc_hires.conf data/lang_chain exp/nnet3_cleaned/extractor exp/chain_cleaned/tdnn1a_sp_bi exp/tdnn1a_sp_bi_online
    # utils/mkgraph.sh --self-loop-scale 1.0 data/lang_s_test_tgpr exp/tdnn1a_sp_bi_online exp/tdnn1a_sp_bi_online/graph_s

**path.sh** : set the `KALDI_ROOT` value. 

**server-load.sh** : set the correct values  of your folders and files.

**exp/tdnn1a_sp_bi_online/conf**: **ivector_extractor.conf** and **online.conf**: be sure you have the correct path inside these two files.


## Tree structure of the project

    .
    ├── cmd.sh
    ├── conf
    │   ├── mfcc.conf
    │   ├── mfcc_hires.conf
    │   ├── mfcc_t.conf
    │   ├── online_cmvn.conf
    │   ├── slurm_pony.conf
    │   └── slurm_pony.pl
    ├── exp
    │   └── tdnn1a_sp_bi_online
    │       ├── conf
    │       │   ├── ivector_extractor.conf # Be careful, path to the project
    │       │   ├── mfcc.conf
    │       │   ├── online_cmvn.conf
    │       │   ├── online.conf # Be careful path to the project
    │       │   └── splice.conf
    │       ├── final.mdl
    │       ├── frame_subsampling_factor
    │       ├── graph_s
    │       │   ├── disambig_tid.int
    │       │   ├── HCLG.fst
    │       │   ├── num_pdfs
    │       │   ├── phones
    │       │   │   ├── align_lexicon.int
    │       │   │   ├── align_lexicon.txt
    │       │   │   ├── disambig.int
    │       │   │   ├── disambig.txt
    │       │   │   ├── optional_silence.csl
    │       │   │   ├── optional_silence.int
    │       │   │   ├── optional_silence.txt
    │       │   │   ├── silence.csl
    │       │   │   ├── word_boundary.int
    │       │   │   └── word_boundary.txt
    │       │   ├── phones.txt
    │       │   └── words.txt
    │       ├── ivector_extractor
    │       │   ├── final.dubm
    │       │   ├── final.ie
    │       │   ├── final.mat
    │       │   ├── global_cmvn.stats
    │       │   ├── online_cmvn.conf
    │       │   └── splice_opts
    │       ├── phones.txt
    │       └── tree
    ├── output # Here you will obtain your .ctm files
    ├── path.sh
    ├── raw_data # Here you put your audio files
    ├── README.md
    ├── server-load.sh
    ├── steps -> /vol/tensusers3/ctejedor/lacristianmachine/opt/kaldi/egs/wsj/s5/steps/
    ├── uber_single.sh
    └── utils -> /vol/tensusers3/ctejedor/lacristianmachine/opt/kaldi/egs/wsj/s5/utils/
    
    17 directories, 45 files

## Run

    ./server-load.sh



## Contact and credits
Cristian Tejedor-García
[Centre for Language and Speech Technology](https://www.ru.nl/clst/)
Email: cristian [dot] tejedorgarcia [at] ru [dot] nl
