import matplotlib.pyplot as plt
import numpy as np

fig, axes = plt.subplots(7, 1, figsize=(12, 10), sharex=True)

t = np.arange(0, 1000, 1)

clk = np.zeros_like(t)
for i in range(len(t)):
    if (i // 10) % 2 == 0:
        clk[i] = 1

rst = np.ones_like(t)
rst[t < 50] = 0
rst[(t >= 550) & (t < 580)] = 0

cnt = np.zeros_like(t)
for i in range(len(t)):
    if t[i] < 50 or (t[i] >= 550 and t[i] < 580):
        cnt[i] = 0
    else:
        cnt[i] = (t[i] % 100) // 20

led0 = np.ones_like(t)
led1 = np.ones_like(t)
led2 = np.ones_like(t)
led3 = np.ones_like(t)

for i in range(len(t)):
    if t[i] < 50 or (t[i] >= 550 and t[i] < 580):
        led0[i] = 0
    elif t[i] < 150:
        led0[i] = 0
    elif t[i] < 250:
        led1[i] = 0
    elif t[i] < 350:
        led2[i] = 0
    elif t[i] < 450:
        led3[i] = 0
    elif t[i] < 550:
        led0[i] = 0
    else:
        if t[i] < 650:
            led0[i] = 0
        elif t[i] < 750:
            led1[i] = 0
        else:
            led2[i] = 0

axes[0].plot(t, clk, drawstyle='steps-post', color='blue')
axes[0].set_ylabel('sys_clk')
axes[0].set_yticks([0, 1])

axes[1].plot(t, rst, drawstyle='steps-post', color='green')
axes[1].set_ylabel('sys_rst_n')
axes[1].set_yticks([0, 1])

axes[2].plot(t, cnt, drawstyle='steps-post', color='orange')
axes[2].set_ylabel('cnt')
axes[2].set_yticks([0, 1, 2, 3, 4])

axes[3].plot(t, led0, drawstyle='steps-post', color='red')
axes[3].set_ylabel('led0')
axes[3].set_yticks([0, 1])

axes[4].plot(t, led1, drawstyle='steps-post', color='red')
axes[4].set_ylabel('led1')
axes[4].set_yticks([0, 1])

axes[5].plot(t, led2, drawstyle='steps-post', color='red')
axes[5].set_ylabel('led2')
axes[5].set_yticks([0, 1])

axes[6].plot(t, led3, drawstyle='steps-post', color='red')
axes[6].set_ylabel('led3')
axes[6].set_yticks([0, 1])

plt.xlim(0, 1000)
plt.xlabel('Time (ns)')
plt.suptitle('Task 2-2 Running Light Simulation Waveform (CNT_MAX=4)')
plt.tight_layout()
plt.savefig('task2_2_waveform.png', dpi=300)