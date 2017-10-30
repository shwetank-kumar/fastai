import numpy as np
from matplotlib import pyplot as plt

def plot_batch(batch, labels, classes=[0,1]):
    # batch = batch.astype(np.uint8)
    f = plt.figure(figsize=(12,6))
    sp = []
    n_c = 8
    n_r = len(batch)//n_c + 1
    for n in range(1,n_r+1):
        for m in range(1,n_c+1):
            img_num_plot = n_c*(n-1) + m
            img_num_batch = img_num_plot - 1
            if len(batch)>=img_num_plot:
                sp.append(f.add_subplot(n_r,n_c,img_num_plot))
                sp[img_num_batch].axis('Off')
                img = batch[img_num_batch].astype(np.uint8)
                plt.imshow(img)
                sp[img_num_batch].set_title(classes[int(labels[img_num_batch])],
                fontsize=12)
