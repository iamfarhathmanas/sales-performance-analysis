import pandas as pd

# Load dataset
sales = pd.read_csv('../data/sales_data.csv')
sales['order_date'] = pd.to_datetime(sales['order_date'])
sales['profit_margin_pct'] = sales['profit'] / sales['revenue'] * 100

print('Overall KPIs')
print(f"Revenue: {sales['revenue'].sum():,.2f}")
print(f"Profit: {sales['profit'].sum():,.2f}")
print(f"Margin: {sales['profit'].sum() / sales['revenue'].sum() * 100:.2f}%")
print(f"Units sold: {sales['quantity'].sum():,}")

print('\nProduct performance')
print(sales.groupby('product')[['revenue','profit','quantity']].sum().sort_values('revenue', ascending=False))

print('\nRegional performance')
print(sales.groupby('region')[['revenue','profit']].sum().sort_values('revenue', ascending=False))

print('\nChannel performance')
channel = sales.groupby('channel')[['revenue','profit']].sum()
channel['margin_pct'] = channel['profit'] / channel['revenue'] * 100
print(channel.sort_values('margin_pct', ascending=False))
