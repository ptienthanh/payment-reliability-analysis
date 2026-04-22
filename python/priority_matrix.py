import matplotlib.pyplot as plt

solutions = [
    ("Retry", 9, 6),
    ("Fallback", 9, 9),
    ("Async", 9, 9),
    ("Real-time status", 6, 3),
    ("Error message", 5, 2),
    ("Retry UI", 6, 2),
]

for name, impact, effort in solutions:
    plt.scatter(effort, impact)
    plt.text(effort+0.1, impact+0.1, name)

plt.xlabel("Effort")
plt.ylabel("Impact")
plt.title("Impact vs Effort Matrix")
plt.grid(True)
plt.show()