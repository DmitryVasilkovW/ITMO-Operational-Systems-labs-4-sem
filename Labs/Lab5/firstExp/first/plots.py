import matplotlib.pyplot as plt
import pandas as pd
import os

file_path = os.path.expanduser('~/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab5/firstExp/data/data1')

data = pd.read_csv(file_path, sep=' ', skiprows=1, header=None)
data.columns = ['TIME', 'MEM', 'VIRT', 'RES', 'SHR', 'CPU', 'FREE', 'SWAP']

# Преобразование строки времени в секунды
data['TIME'] = data['TIME'].apply(lambda x: sum(float(y.replace(',', '.')) * 60 ** i for i, y in enumerate(reversed(x.split(":")))))

data.sort_values(by='TIME', inplace=True)

data['MEM'] = data['MEM'].str.replace(',', '.').astype(float)
data['SWAP'] = data['SWAP'].str.replace(',', '.').astype(float)
data['CPU'] = data['CPU'].str.replace(',', '.').astype(float)
data['RES'] = data['RES'].apply(lambda x: float(x.replace('g', '').replace(',', '.')) * 1024 if isinstance(x, str) and 'g' in x else float(x.replace(',', '.')) if isinstance(x, str) else x)

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

plt.savefig(os.path.join(os.getcwd(), 'output.png'))

