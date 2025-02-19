import pandas as pd
import pandas as pd
import matplotlib.pyplot as plt

# Load sales data
sales_data = pd.read_csv('sales.csv')

# Display first five rows
print(sales_data.head())

# Convert sales column to a list
sales_list = sales_data['sales'].tolist()
print(sales_list)

# Calculate total sales for the year
sales_sum = sales_data['sales'].sum()
print(f'Total sales for the year: {sales_sum}')

# Calculate the monthly percentage change in sales
sales_data['monthly change (%)'] = sales_data['sales'].pct_change() * 100

# Calculate average sales value
avg_sales = sales_data['sales'].mean()
print(f'Average monthly sales: {avg_sales:.2f}')

# Identify months with highest and lowest sales
highest_sales = sales_data['sales'].max()
lowest_sales = sales_data['sales'].min()

highest_month = sales_data.loc[sales_data['sales'].idxmax(), ['year', 'month', 'sales', 'expenditure']]
lowest_month = sales_data.loc[sales_data['sales'].idxmin(), ['year', 'month', 'sales', 'expenditure']]

print("Highest Sales Month:\n", highest_month)
print("Lowest Sales Month:\n", lowest_month)

# Create a summary dictionary
summary = {
    'Metric': ['Total Sales', 'Average Sales', 'Highest Sales', 'Lowest Sales'],
    'Value': [
        sales_sum,
        avg_sales,
        f'{highest_sales} ({highest_month["month"]})',
        f'{lowest_sales} ({lowest_month["month"]})'
    ]
}

# Convert summary dictionary into a DataFrame
summary_df = pd.DataFrame(summary)

# Save summary to CSV
summary_df.to_csv('sales_summary.csv', index=False)
print("Summary saved to 'sales_summary.csv'.")

# Plot Monthly Sales Trend
plt.figure(figsize=(10, 6))
plt.plot(sales_data['month'], sales_data['sales'], marker='o', linestyle='-', color='b')
plt.title('Monthly Sales Trend')
plt.xlabel('Month')
plt.ylabel('Sales')
plt.grid(True)
plt.show()

# Combined Bar, Line, and Scatter Chart for Sales Trends
plt.figure(figsize=(10, 6))
plt.bar(sales_data["month"], sales_data["sales"], color="pink", label="Sales (Bar)")
plt.plot(sales_data["month"], sales_data["sales"], color="purple", marker="o", linestyle="-", label="Sales (Line)")
plt.scatter(sales_data["month"], sales_data["sales"], color="turquoise", label="Sales (Points)")
plt.xlabel("Months")
plt.ylabel("Sales")
plt.legend()
plt.show()

# Bar Chart for Monthly Sales Percentage Change
plt.figure(figsize=(10, 6))
plt.bar(sales_data['month'], sales_data['monthly change (%)'], color='purple')
plt.title('Monthly Sales Percentage Change')
plt.xlabel('Month')
plt.ylabel('Percentage Change (%)')
plt.grid(axis='y')
plt.show()
