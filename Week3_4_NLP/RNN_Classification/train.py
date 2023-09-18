from preprocessing import Prerpocessing
from sklearn.model_selection import train_test_split
from torch.nn.utils.rnn import pad_sequence
from model import Net
from word2vec import Word2Vec
from evalutate import binary_cross_entropy

import pandas as pd
import torchtext
import torch
import torch.nn as nn
import numpy as np
import torch.optim as optim
from tqdm.notebook import tqdm


def build_vocab(corpus):
    vocab = torchtext.vocab.build_vocab_from_iterator(corpus)
    vocab.set_default_index(0)
    return vocab

def read_data(data_file_path):
    # Doc du lieu
    data = pd.read_csv(data_file_path + "archive/train.csv", delimiter=',', names=['label', 'text'])
    corpus = data['text'].values.tolist()
    y = data['label'].values
    return corpus, y

def pre_data(corpus, data_file_path):
    # Tien xu ly data
    preprocessor = Prerpocessing(data_file_path)
    processed_corpus = list(map(preprocessor.preprocess_text, corpus))
    return processed_corpus
def word2vec_data(x, data_file_path):
    word2vec = Word2Vec(data_file_path)  # Tạo một đối tượng Word2Vec
    word2vec.add_words_to_word2vec(x)
    x_embeddings = []

    # Độ dài mà bạn muốn cho mỗi câu
    desired_sequence_length = 32
    for sentence in x:
        sentence_vectors = [word2vec.get_word_vector(word) for word in sentence]

        # Zero-padding if the sentence is shorter than desired_sequence_length
        if len(sentence_vectors) < desired_sequence_length:
            num_padding = desired_sequence_length - len(sentence_vectors)
            sentence_vectors += [np.zeros_like(sentence_vectors[0])] * num_padding

        x_embeddings.append(sentence_vectors[:desired_sequence_length])

    return x_embeddings
def split_data(x, y):
    x_train, x_temp, y_train, y_temp = train_test_split(x, y, test_size=0.4, random_state=40)
    x_val, x_test, y_val, y_test = train_test_split(x_temp, y_temp, test_size=0.5, random_state=40)
    return x_train, y_train, x_val, y_val, x_test, y_test

def train(x_train, y_train):
    ds_train = torch.utils.data.TensorDataset(x_train, y_train)
    train_loader = torch.utils.data.DataLoader(ds_train, batch_size=128, shuffle=True)

    # ds_test = torch.utils.data.TensorDataset(x_val, y_val)
    # test_loader = torch.utils.data.DataLoader(ds_test, batch_size=256, shuffle=True)
    device = torch.device('cpu')
    classifier = Net().to(device)
    optimizer = optim.Adam(classifier.parameters(), lr=0.005)  # 0.002 dives 85% acc
    criterion = nn.CrossEntropyLoss()

    epoch_bar = tqdm(range(20),
                     desc="Training",
                     position=0,
                     total=2)

    acc = 0

    for epoch in epoch_bar:
        batch_bar = tqdm(enumerate(train_loader),
                         desc="Epoch: {}".format(str(epoch)),
                         position=1,
                         total=len(train_loader))

        for i, (datapoints, labels) in batch_bar:

            optimizer.zero_grad()

            preds = classifier(datapoints.long().to(device))
            loss = criterion(preds, labels.to(device))
            loss.backward()
            optimizer.step()
            acc = (preds.argmax(dim=1) == labels).float().mean().cpu().item()

            # if (i + 1) % 50 == 0:
            #     acc = 0
            #
            #     # with torch.no_grad():
            #     #     for i, (datapoints_, labels_) in enumerate(test_loader):
            #     #         preds = classifier(datapoints_.to(device))
            #     #         acc += (preds.argmax(dim=1) == labels_.to(device)).sum().item()
            #     # acc /= len(x_test)

        #     batch_bar.set_postfix(loss=loss.item(),
        #                           accuracy="{:.2f}".format(acc),
        #                           epoch=epoch)
        #     batch_bar.update()
        #
        # epoch_bar.set_postfix(loss=loss.cpu().item(),
        #                       accuracy="{:.2f}".format(acc),
        #                       epoch=epoch)
        # epoch_bar.update()
        preds_y_test = classifier(x_train)
        acc_y_test = (preds_y_test.argmax(dim=1) == y_train).float().mean().cpu().item()
        print("acc train: ", acc_y_test)
    return classifier
def val(x_test, y_test, classifier):
    preds_y_test = classifier(x_test)
    acc_y_test = (preds_y_test.argmax(dim=1) == y_test).float().mean().cpu().item()
    return acc_y_test
def main():
    data_file_path = "/home/lap13385/Projects/Zalo_AI_Fresher_Training/Week3_4_NLP/RNN_Classification/source/"
    corpus, y = read_data(data_file_path)
    x_process = pre_data(corpus, data_file_path)
    x_embeddings = word2vec_data(x_process, data_file_path)
    x = torch.tensor(x_embeddings)
    y = torch.tensor(y)
    x_train, y_train, x_val, y_val, x_test, y_test = split_data(x, y)
    classifier = train(x_train, y_train)
    print("acc val: ",val(x_val, y_val, classifier))
    print("acc test: ",val(x_test, y_test, classifier))

if __name__ == "__main__":
    main()

