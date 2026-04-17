import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv("failure_by_hour.csv")

# Sort by hour
df = df.sort_values("hour_of_day")

# Plot line chart
plt.figure(figsize=(10, 5))
plt.plot(
    df["hour_of_day"],
    df["failure_rate_percentage"],
    marker="o"
)

# Labels
plt.xlabel("Hour of Day")
plt.ylabel("Failure Rate (%)")
plt.title("Transaction Failure Rate by Hour")

# Ticks + grid
plt.xticks(range(0, 24))
plt.grid(True)

# Show chart
plt.show()
