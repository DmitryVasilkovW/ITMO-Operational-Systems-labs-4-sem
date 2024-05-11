import matplotlib.pyplot as plt
import pandas as pd
import os

def process_data(data):
    data['TIME'] = data['TIME'].astype(str).apply(lambda x: sum(float(y.replace(',', '.')) * 60 ** i for i, y in enumerate(reversed(x.split(":")))))
    data.sort_values(by='TIME', inplace=True)
    data['MEM'] = data['MEM'].str.replace(',', '.').astype(float)
    data['SWAP'] = data['SWAP'].str.replace(',', '.').astype(float)
    data['CPU'] = data['CPU'].str.replace(',', '.').astype(float)
    data['RES'] = data['RES'].apply(lambda x: float(x.replace('g', '').replace('m', '').replace(',', '.')) * 1024 if isinstance(x, str) and 'g' in x else float(x.replace('m', '').replace(',', '.')) if isinstance(x, str) and 'm' in x else float(x.replace(',', '.')) if isinstance(x, str) else x)
    return data

def plot_data(data, output_file):
    fig, axs = plt.subplots(4, figsize=(10, 15))

    axs[0].plot(data['TIME'], data['SWAP'], label='SWAP', color='orange')
    axs[0].set_xlabel('Time')
    axs[0].set_ylabel('Free Memory')
    axs[0].set_title('Free Swap Over Time')

    axs[1].plot(data['TIME'], data['MEM'], label='MEM')
    axs[1].set_xlabel('Time')
    axs[1].set_ylabel('Memory Usage')
    axs[1].set_title('Memory Usage Over Time')

    sorted_cpu = data.sort_values(by='TIME')['CPU']
    axs[2].plot(data['TIME'], sorted_cpu, label='CPU', color='r')
    axs[2].set_xlabel('Time')
    axs[2].set_ylabel('CPU Usage (%)')
    axs[2].set_title('CPU Usage Over Time')

    axs[3].plot(data['TIME'], data['VIRT'], label='VIRT', color='g')
    axs[3].plot(data['TIME'], data['RES'], label='RES', color='b')
    axs[3].set_xlabel('Time')
    axs[3].set_ylabel('Memory Usage')
    axs[3].legend()
    axs[3].set_title('Virtual and Resident Memory Usage Over Time')

    plt.tight_layout()

    plt.savefig(os.path.join(os.getcwd(), output_file))


file_path1 = os.path.expanduser('/Users/dmitryvasilkov/PycharmProjects/ITMO-Operational-Systems-labs-4-sem/Labs/Lab5/firstExp/data/data1')
data1 = pd.read_csv(file_path1, sep=' ', skiprows=1, header=None)
data1.columns = ['TIME', 'MEM', 'VIRT', 'RES', 'SHR', 'CPU', 'FREE', 'SWAP']
data1 = process_data(data1)
plot_data(data1, 'output1.png')

file_path2 = os.path.expanduser('/Users/dmitryvasilkov/PycharmProjects/ITMO-Operational-Systems-labs-4-sem/Labs/Lab5/firstExp/data/data2')
data2 = pd.read_csv(file_path2, sep=' ', skiprows=1, header=None)
data2.columns = ['TIME', 'MEM', 'VIRT', 'RES', 'SHR', 'CPU', 'FREE', 'SWAP']
data2 = process_data(data2)
plot_data(data2, 'output2.png')
