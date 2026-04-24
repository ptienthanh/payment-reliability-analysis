# %%
import matplotlib.pyplot as plt

metrics = ["Success Rate", "Failure Rate", "Drop-off"]
before = [85, 15, 60]
after = [92, 8, 30]

x = range(len(metrics))

plt.figure(figsize=(8,5))
plt.bar(x, before, width=0.4, label="Before")
plt.bar([i+0.4 for i in x], after, width=0.4, label="After")

plt.xticks([i+0.2 for i in x], metrics)
plt.ylabel("Percentage (%)")
plt.title("Before vs After Performance Comparison")
plt.legend()

plt.show()
# %%
