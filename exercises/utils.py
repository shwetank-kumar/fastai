"""Utilities for training a CNN."""

import numpy as np
from PIL import Image
from matplotlib import pyplot as plt
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D, BatchNormalization


def plot_batch(batch, labels, classes):
    """Plot a batch of images."""
    # batch = batch.astype(np.uint8)
    f = plt.figure(figsize=(12, 6))
    sp = []
    n_c = 8
    n_r = len(batch)//n_c + 1
    for n in range(1, n_r+1):
        for m in range(1, n_c+1):
            img_num_plot = n_c*(n-1) + m
            img_num_batch = img_num_plot - 1
            if len(batch) >= img_num_plot:
                sp.append(f.add_subplot(n_r, n_c, img_num_plot))
                sp[img_num_batch].axis('Off')
                img = batch[img_num_batch].astype(np.uint8)
                plt.imshow(img)
                sp[img_num_batch].set_title(classes[np.squeeze(np.nonzero(
                                            labels[img_num_batch]))],
                                            fontsize=12)


def plot_file_list(img_file_list):
    """Plot a list of images."""
    f = plt.figure(figsize=(12, 6))
    sp = []
    n_c = 8
    n_r = len(img_file_list)//n_c+1
    for n in range(1, n_r+1):
        for m in range(1, n_c+1):
            img_num_plot = n_c*(n-1) + m
            img_num_batch = img_num_plot - 1
            if len(img_file_list) >= img_num_plot:
                sp.append(f.add_subplot(n_r, n_c, img_num_plot))
                sp[img_num_batch].axis('Off')
                img = Image.open(img_file_list[img_num_batch])
                plt.imshow(img)


class Vgg16BN():
    """Vgg16 CNN."""

    def __init__(self, size=(224, 224, 3), include_top=True):
        """Initialize the class."""
        self.create(size, include_top)

    def create(self, size, include_top):
        """Create the network."""
        model = self.model = Sequential()
        model.add(BatchNormalization(input_shape=size))
        model.add(Conv2D(64, (3, 3), activation='relu', padding='same'))
        model.add(Conv2D(64, (3, 3), activation='relu', padding='same',
                         input_shape=size))
        model.add(MaxPooling2D())
        model.add(BatchNormalization())
        model.add(Conv2D(128, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(Conv2D(128, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(MaxPooling2D())
        model.add(BatchNormalization())
        model.add(Conv2D(256, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(Conv2D(256, (3, 3), activation='relu', padding='same',
                         input_shape=size))
        model.add(Conv2D(256, (3, 3), activation='relu', padding='same',
                         input_shape=size))
        model.add(MaxPooling2D())
        model.add(BatchNormalization())
        model.add(Conv2D(512, (3, 3), activation='relu', padding='same',
                         input_shape=size))
        model.add(Conv2D(512, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(Conv2D(512, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(MaxPooling2D())
        model.add(BatchNormalization())
        model.add(Conv2D(512, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(Conv2D(512, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(Conv2D(512, (3, 3), activation='relu', padding='same',
                  input_shape=size))
        model.add(MaxPooling2D())
        model.add(Flatten())
        model.add(BatchNormalization())
        model.add(Dense(512, activation='relu'))
        model.add(BatchNormalization())
        model.add(Dropout(0.5))
        model.add(Dense(512, activation='relu'))
        model.add(BatchNormalization())
        model.add(Dropout(0.5))
        model.add(Dense(10, activation='softmax'))
