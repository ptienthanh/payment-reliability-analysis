import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv("../failure_by_method.csv")

# Sort cho đẹp
df = df.sort_values("failure_rate_percentage", ascending=False)

# Plot
plt.figure(figsize=(8, 5))
plt.bar(df["payment_method"], df["failure_rate_percentage"])

plt.xlabel("Payment Method")
plt.ylabel("Failure Rate (%)")
plt.title("Failure Rate by Payment Method")

plt.xticks(rotation=30)
plt.grid(True)
plt.savefig("../dashboard/failure_rate_by_method.png")

plt.show()
