import re

#postfix = ['1', '2', '3', '4', '5', '6', '7', '8', '10', 'may_slide1', 'may_slide2', 'may_slide12']
postfix = ['1', '2', '3', '10', 'may_slide1', 'may_slide2', 'may_slide12']
#postfix = ['1']
print("depth\t#options\tManually-tuned\tBEAM-tuned")
for p in postfix:
    #print('parse '+ 'mcts_'+p)
    with open('bs_'+p,'r') as f:
        data = f.readlines()
    total_options = 0
    manual_time =  -1
    mcts_time =  -1
    
    for line in data:
        m  = re.match(r"---------JENNY tile_options (\d+)-----", line)
        if m:
            options = int(m.group(1))
            total_options += options
            continue

        m  = re.match(r"Manually-tuned time: (\S+)ms", line)
        if m:
            manual_time = float(m.group(1))
            continue


        m  = re.match(r"Auto-scheduled time: (\S+)ms", line)
        if m:
            mcts_time = float(m.group(1))
            continue

    print("{}\t{}\t{}\t{}".format(p, total_options, manual_time, mcts_time))
