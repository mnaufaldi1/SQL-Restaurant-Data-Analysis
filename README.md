# 🍽 Restaurant Sales Analysis (SQL)

### 🎯 Objective
Analyze restaurant orders to understand sales trends and customer behavior.

### 🧩 Dataset
Two tables:
- `menu_items` — item info, category, price.
- `order_details` — order time, date, and item references.

### ❓ Key Questions
1. Which menu items have never been ordered?
2. What hour of the day has the most orders?
3. Which day generates the most revenue?
4. Which 5 items produce the highest total sales?
5. What is the average number of items per order?

### 🧠 Key Insights (Detailed)

#### ⏰ 1. Peak Order Hour: 12–1 PM
During lunchtime, the restaurant experiences its highest order volume.  
This indicates a strong midday traffic pattern, likely from nearby workers or students.  
**Recommendation:**  
- Ensure kitchen and delivery staff are fully available between 11:30 AM – 1:30 PM.  
- Consider adding express lunch menus or limited-time lunch deals to increase throughput.

---

#### 💸 2. Day with the Most Revenue: Monday
Surprisingly, Monday generated the most total revenue in the dataset, followed by Friday.  
This could be due to weekday promotions or a strong regular customer base.  
**Recommendation:**  
- Double down on Monday and Friday campaigns or loyalty programs.  
- Compare future data to see if this pattern is consistent or seasonal.

---

#### 🍝 3. Top Revenue Category: Italian
Italian dishes (e.g., Spaghetti, Eggplant Parmesan) dominated total sales across all categories.  
This suggests high customer preference and reliable profit margins.  
**Recommendation:**  
- Maintain inventory levels for key Italian ingredients.  
- Test limited-edition Italian items to expand that success.

---

#### 📦 4. Average Items per Order: ~2.25
Most customers order around two items per transaction,  
implying primarily solo diners or pairs, not large groups.  
**Recommendation:**  
- Introduce bundle deals (e.g., “Meal for Two”) to increase average order value.  
- Offer add-ons or sides to encourage upselling.

---

#### 🍔 5. Best-Selling Dish: Hamburger
The Hamburger generated the highest sales volume across the menu.  
Its popularity makes it both a reliable revenue driver and a brand-defining item.  
**Recommendation:**  
- Maintain quality consistency and consider “premium” or “double” versions.  
- Pair it with sides (fries, drinks) in combo promotions.

---

#### 🌮 6. Least Ordered Item: Chicken Tacos
Chicken Tacos recorded the lowest order count,  
indicating either poor visibility, taste mismatch, or overlap with other dishes.  
**Recommendation:**  
- Conduct a customer survey or trial alternative seasoning/toppings.  
- Consider removing or rebranding if sales remain low.

---

#### 💰 7. Total Revenue per Category
Italian dishes led revenue, followed by Asian and Mexican categories.  
This shows clear customer preference hierarchy.  
**Recommendation:**  
- Focus marketing on Italian and Asian offerings.  
- Review pricing strategy for lower-performing categories.

---

#### 📈 8. Overall Summary
The restaurant performs strongest during weekday lunches,  
with Italian dishes leading sales and burgers as the standout individual item.  
Improving underperforming items and leveraging strong categories  
could increase profitability without expanding the menu.


### 🛠 Tools
PostgreSQL, pgAdmin

### 📁 Files
- `create_restaurant_db.sql` → schema + sample data  
- `analysis_queries.sql` → all grouped queries  
- `README.md` → overview and insights

### 🧾 Notes
The dataset was sourced from a public SQL practice project on YouTube.    
Additional analysis questions and interpretations were added independently for learning and demonstration purposes.
