DATA_ROOT=../datasets

train_alg=dagger

features=vitbase
ft_dim=768
obj_features=vitbase
obj_ft_dim=768

ngpus=1
seed=0

name=${train_alg}-${features}
name=${name}-seed.${seed}
name=${name}-init.aug.45k

outdir=${DATA_ROOT}/R2R/exprs_map/finetune/${name}77500_9_2

flag="--root_dir ${DATA_ROOT}
      --dataset r2r
      --output_dir ${outdir}
      --world_size ${ngpus}
      --seed ${seed}
      --tokenizer bert      

      --enc_full_graph
      --graph_sprels
      --fusion dynamic

      --expert_policy spl
      --train_alg ${train_alg}
      
      --num_l_layers 9
      --num_x_layers 4
      --num_pano_layers 2
      
      --max_action_len 15
      --max_instr_len 200

      --batch_size 8
      --lr 1e-5
      --iters 100000
      --log_every 1000
      --optim adamW

      --features ${features}
      --image_feat_size ${ft_dim}
      --angle_feat_size 4

      --ml_weight 0.2   

      --feat_dropout 0.4
      --dropout 0.5
      
      --gamma 0."

# train
CUDA_VISIBLE_DEVICES='1' python r2r/main_nav.py $flag  \
      --tokenizer bert \
      --bert_ckpt_file '/home-gxu/tjf22/VLN-DUET-main/datasets/R2R/exprs_map/pretrain/cmt-vitbase-mlm.mrc.sap-init.lxmert-aug.speaker3_2_9knowledges-9/ckpts/model_step_77500.pt' \
      --eval_first
      # --bert_ckpt_file '/home-gxu/tjf22/VLN-DUET-main/datasets/R2R/exprs_map/pretrain/cmt-vitbase-mlm.mrc.sap-init.lxmert-aug.speaker3_2_9knowledges-2/ckpts/model_step_37500.pt' \
      # --bert_ckpt_file '/home-gxu/tjf22/VLN-DUET-main/datasets/R2R/exprs_map/finetune/dagger-vitbase-seed.0-init.aug.45k72500_9/ckpts/best_val_unseen'
# ../datasets/R2R/exprs_map/pretrain/cmt-vitbase-mlm.mrc.sap-init.lxmert-aug.speaker2/ckpts/model_step_97500.pt \

# test
#CUDA_VISIBLE_DEVICES='1' python r2r/main_nav.py $flag  \
#      --tokenizer bert \
#      --resume_file ../datasets/R2R/exprs_map/finetune/dagger-vitbase-seed.0-init.aug.45k85000_9_2/ckpts/best_val_unseen \
#      --test True \
#      --submit True
      #../datasets/R2R/trained_models/best_val_unseen \