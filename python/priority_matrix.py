# %%
import os
import matplotlib.pyplot as plt

os.makedirs("../dashboard", exist_ok=True)

# Chỉ giữ 4 solution chính trên chart
solutions = [
    ("Smart Retry", 9.0, 6.0),
    ("Fallback Routing", 9.0, 8.0),
    ("Async Processing", 8.7, 8.0),
    ("Real-time Status", 6.0, 3.0),
    ("Retry Guidance UI", 6, 2),
    ("Error Message", 5, 2),
    ("Monitoring & Logging", 5.7, 5),
    ("State Tracking", 6, 5),
]


plt.figure(figsize=(10, 6.2))

# Plot points
for name, impact, effort in solutions:
    plt.scatter(effort, impact, s=110)

# Labels
label_offsets = {
    "Smart Retry": (0.1, 0.1),
    "Fallback Routing": (-0.6, 0.2),
    "Async Processing": (-0.6, -0.2),
    "Real-time Status": (0.1, 0.1),
    "Retry Guidance UI": (0.1, 0.1),
    "Error Message": (0.1, 0.1),
    "State Tracking": (0.1, 0.1),
    "Monitoring & Logging": (0.1, -0.2),
}

for name, impact, effort in solutions:
    dx, dy = label_offsets[name]
    plt.text(effort + dx, impact + dy, name, fontsize=10)

# Quadrant lines
plt.axhline(y=7, linestyle="--", linewidth=1.4)
plt.axvline(x=5, linestyle="--", linewidth=1.4)

# Quadrant labels
plt.text(3.8, 7.2, "Quick Wins", fontsize=12, weight="bold")
plt.text(5.2, 7.2, "Strategic Investments", fontsize=12, weight="bold")
plt.text(3.6, 6.7, "Nice-to-have", fontsize=12, weight="bold")
plt.text(5.2, 6.7, "Low Priority", fontsize=12, weight="bold")

# Title and axes
plt.title("Impact vs Effort Prioritization Matrix", fontsize=16, weight="bold")
plt.xlabel("Implementation Effort", fontsize=12)
plt.ylabel("Business Impact", fontsize=12)

# Axis range
plt.xlim(1.5, 9.4)
plt.ylim(4.8, 9.35)
plt.xticks(range(2, 10))
plt.yticks([5, 6, 7, 8, 9])

plt.grid(True, alpha=0.25)
plt.tight_layout()
plt.savefig("../dashboard/priority_matrix.png", dpi=300, bbox_inches="tight")
plt.show()
# %%
