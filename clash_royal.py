import pandas as pd

df = pd.read_csv("clash_royal.csv")

# Remove duplicates
df.drop_duplicates(inplace=True)

# Convert numeric columns
num_cols = ['maxEvolutionLevel', 'elixirCost', 'usage', 'hitpoints']

for col in num_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# Fill missing values
df['maxEvolutionLevel'] = df['maxEvolutionLevel'].fillna(0)
df['usage'] = df['usage'].fillna(df['usage'].median())
df['hitpoints'] = df['hitpoints'].fillna(0)

# Fill categorical nulls
cat_cols = ['rarity', 'type', 'mobility',
            'targets', 'attack_type']

for col in cat_cols:
    df[col] = df[col].fillna("Unknown")

# Remove URLs
df.drop(['iconUrls', 'evolutionIcons'], axis=1, inplace=True)

# Clean column names
df.columns = df.columns.str.lower().str.strip()

# Save cleaned file
df.to_csv("clash_royal_cleaned.csv", index=False)

print("Cleaning completed!")