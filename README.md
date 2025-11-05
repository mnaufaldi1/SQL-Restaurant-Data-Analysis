# 🍽 Restaurant Sales Data Analysis (SQL)

## 🎯 Objective
Use SQL to analyze restaurant orders and menu data to uncover operational, customer, and revenue insights that can guide business strategy.

---

## 🧩 Dataset Overview
| Table | Description |
|------|-------------|
| `menu_items` | List of menu items, categories, and prices |
| `order_details` | Date, time, and item information for each order |

---

### 🛠 Tools
PostgreSQL, pgAdmin

---

## ❓ Key Business Questions

### Menu & Sales Performance
- Which items generate the highest total revenue?
- Which categories produce the most revenue?
- Which menu items are the least ordered?

### Customer Behavior & Order Patterns
- What hour of the day has the most orders?
- What day of the week generates the most revenue?
- What is the average number of items per order?

### Advanced / Strategic Analysis
- What is the impact of a 10% price increase on total revenue?
- Which 20% of menu items contribute to 80% of revenue? (Pareto Principle)

---

## 🧠 Key Insights (Detailed)

### ⏰ 1. Peak Order Hour: 12–1 PM
During lunchtime, the restaurant experiences its highest order volume.  
This indicates a strong midday traffic pattern, likely from nearby workers or students.<br>
**Recommendation:**
- Ensure kitchen and delivery staff are fully available between 11:30 AM – 1:30 PM.  
- Consider adding express lunch menus or limited-time lunch deals to increase throughput.

### 💸 2. Day with the Most Revenue: Monday
Surprisingly, Monday generated the most total revenue in the dataset, followed by Friday.  
This could be due to weekday promotions or a strong regular customer base.<br>
**Recommendation:**
- Double down on Monday and Friday campaigns or loyalty programs.  
- Compare future data to see if this pattern is consistent or seasonal.

### 🍝 3. Top Revenue Category: Italian
Italian dishes dominated total sales across all categories, followed by Asian and Mexican.  
This shows clear customer preference hierarchy.<br>
**Recommendation:**  
- Maintain inventory levels for key ingredients for those categories.  
- Test limited-edition items to expand that success.
- Review pricing strategy for lower-performing categories

### 🥇 4. Top 5 Revenue-Generating Menu Items
The following dishes contributed the highest total revenue:<br>
Korean Beef Bowls (Asian), Spaghetti (Italian), Tofu Pad Thai (Asian), Cheeseburger (American), Hamburger (American).<br>
**Recommendation:**
- Focus marketing and promotions on these items.
- Ensure inventory is sufficient for these high-demand dishes.

### 📦 5. Average Items per Order: ~2.25
Most customers order around two items per transaction,  
implying primarily solo diners or pairs, not large groups.<br>
**Recommendation:**  
- Introduce bundle deals (e.g., “Meal for Two”) to increase average order value.  
- Offer add-ons or sides to encourage upselling.

### 🍔 6. Best-Selling Dish: Hamburger
The Hamburger generated the highest sales volume across the menu.  
Its popularity makes it both a reliable revenue driver and a brand-defining item.<br>
**Recommendation:**  
- Maintain quality consistency and consider “premium” or “double” versions.  
- Pair it with sides (fries, drinks) in combo promotions.

### 🌮 7. Least Ordered Item: Chicken Tacos
Chicken Tacos recorded the lowest order count,  
indicating either poor visibility, taste mismatch, or overlap with other dishes.<br>
**Recommendation:**  
- Conduct a customer survey or trial alternative seasoning/toppings.  
- Consider removing or rebranding if sales remain low.

### 📈 8. Impact of 10% Price Increase
If the restaurant increased prices by 10%, total revenue would also increase by approximately 10%.<br>
**Recommendation:**
- Consider gradual price adjustments on best-selling items to improve margins.
- Monitor customer response to ensure sales volume remains stable.

### 📊 9. Pareto Top Items
The top 1–20 menu items (out of 32), ranked by total revenue, contribute approximately 80% of total sales.<br>
**Recommendation:**
- Focus marketing, promotions, and visibility on these high-revenue items.

### 🔍 Example Analysis Query

```sql
-- Which day of the week earns the most total revenue?
SELECT TO_CHAR(order_date, 'FMDay') AS day_name,
       SUM(price) AS total_revenue
FROM menu_items mi
JOIN order_details od ON mi.menu_item_id = od.item_id
GROUP BY day_name
ORDER BY total_revenue DESC;
```
---

## 💡 Overall Summary
The restaurant performs strongest during weekday lunches, with Italian dishes leading sales and burgers as the standout individual item. Improving underperforming items and leveraging strong categories could increase profitability without expanding the menu.

---

### 📁 Files
- `create_restaurant_db.sql` → schema + sample data  
- `analysis_queries.sql` → all grouped queries  
- `README.md` → overview and insights

---

### 🧾 Notes
The dataset was sourced from a public SQL practice project on YouTube (Maven Analytics).
Additional analysis and interpretations were added independently for learning and project work.

---

## 👤 About the Author
**Muhammad Naufaldi**  
Physics graduate with interest in technology, innovation, and data analysis.

### 🌐 Contact
- **LinkedIn:** https://www.linkedin.com/in/muhammad-naufaldi-608517246/
- **GitHub:** https://github.com/mnaufaldi1

