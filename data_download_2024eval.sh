parent_dir=data
ROOT_DIR=$(cd $(dirname $0); pwd)/
mkdir -p "${ROOT_DIR}/${parent_dir}/dcase2024t2/eval_data/raw"

# download eval data
cd "${parent_dir}/dcase2024t2/eval_data/raw"
for machine_type in \
    HairDryer \
; do
curl -L -O "https://zenodo.org/records/11363076/files/eval_data_${machine_type}_test.zip"
unzip "eval_data_${machine_type}_test.zip"
done

# Adds reference labels to test data.
python ${ROOT_DIR}/tools/rename_eval_wav.py --dataset_parent_dir=${parent_dir} --dataset_type=DCASE2024T2
