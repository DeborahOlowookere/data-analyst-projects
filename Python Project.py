import pandas as pd
import matplotlib.pyplot as plt

# Load the sales data from the CSV file
sales_data = pd.read_csv('sales.csv')

# Display the first five rows of the dataset
print(sales_data.head())

# Convert the sales column into a list
sales_list = sales_data['sales'].tolist()
print(sales_list)

# Calculate the total sales for the entire year
sales_sum = sales_data['sales'].sum() # for the year?
print(f'The sum of sales: {sales_sum}')


# Calculate the monthly percentage change in sales and add it as a new column
sales_data['monthly change (%)'] = sales_data['sales'].pct_change() * 100
print(sales_data)

# Calculate the average sales value
Avg_sales = sales_data['sales'].mean()
print(f'The average sale: {Avg_sales}')

# Identify the month with the highest sales and lowest month
highest_sales = sales_data['sales'].max()
highest_month = sales_data.loc[sales_data['sales'] == highest_sales, ['year', 'month', 'sales', 'expenditure']]
lowest_sales = sales_data['sales'].min()
lowest_month = sales_data.loc[sales_data['sales'] == lowest_sales, ['year', 'month', 'sales', 'expenditure']]
print("Highest Sales Month:\n", highest_month)
print("Lowest Sales Month:\n", lowest_month)

# Create a summary dictionary containing key sales statistics
summary = {
    'Key': ['Total sales', 'Average sales', 'Highest sales', 'Lowest sales'],
    'Value': [45542, 3795.1666666666665, '7479 (Jul)', '1521 (Feb)']
}

# Convert the summary dictionary into a DataFrame
summary_df = pd.DataFrame(summary)
print(summary_df)

# Save the summary DataFrame to a CSV file
summary_df.to_csv('sales_summary.csv', index=False)
print("summary saved to 'sales_summary.csv'")

# Plot a line chart to visualize the sales trend over the months
plt.figure(figsize=(10,6))
plt.plot(sales_data['month'], sales_data['sales'], marker ='o')
plt.title('Monthly Sales Trend')
plt.xlabel('Month')
plt.ylabel('Sales')
plt.grid(True)
plt.show()

# Create a bar chart combined with a line chart and scatter plot for sales trends
plt.bar(sales_data["month"], sales_data["sales"], color="pink")
plt.plot(sales_data["month"], sales_data["sales"], color="purple")
plt.scatter(sales_data["month"], sales_data["sales"], color="turquoise")
plt.xlabel("Months")
plt.ylabel("Sales")
plt.show()

# Create a bar chart to visualize the monthly sales percentage change
plt.bar(sales_data['month'], sales_data['monthly change (%)'], color = 'purple')
plt.title('Monthly sales changes in %')
plt.xlabel('Month')
plt.ylabel('monthly change (%)')
plt.grid(axis ='y')
plt.show()



