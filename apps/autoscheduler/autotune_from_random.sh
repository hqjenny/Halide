echo > samples.all.txt

bash /scratch/hngenc/Halide/apps/autoscheduler/autotune_loop_samples.sh \
        bin/host/demo.generator \
        random_pipeline \
        "" \
        /scratch/hngenc/Halide/apps/autoscheduler/baseline.weights \
        bin \
        /scratch/hngenc/Halide/distrib \
        /scratch/hngenc/Halide/apps/autoscheduler/samples
        "seed=1 seed=2 seed=3 seed=4 seed=5 seed=6 seed=7 seed=8 seed=9 seed=10"
        # ../random_pipeline/bin/random_pipeline.generator
        # random_pipeline

bash /scratch/hngenc/Halide/apps/autoscheduler/autotune_loop_retrain.sh \
        bin/host/demo.generator \
        random_pipeline \
        "" \
        /scratch/hngenc/Halide/apps/autoscheduler/baseline.weights \
        bin \
        /scratch/hngenc/Halide/distrib \
        /scratch/hngenc/Halide/apps/autoscheduler/samples \
        "seed=1 seed=2 seed=3 seed=4 seed=5 seed=6 seed=7 seed=8 seed=9 seed=10"

