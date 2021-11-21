# Industrial_Wastewater_Discharges 
uses R language (for now)!

This project is an excellent platform for me to bring my theoretical knowledge to the practical level and learn along the way.

The main puepose of this project is to build a predictive model as an early warning system that can forecast the amount of Biological Oxygen Demand (BOD) in industrail wastewater discharge based on historical data.

The first few files that have been uploaeded include:
- data integration
- preprocessing and cleaning
- dealing with outliers and NAs
- data engineering and reshaping (pivot_wider)
- exploratory data analysis
- feature selection

As some of the **highlights of my learning process**, so far, I can mention about 
- how to create a wide dataset out of a narrow, long, and complicated dataset?
- how to adjust data engineering to keep the contrast between attributes for feature selection?
- why some imputation techniques are not suitable for some datasets?
- how the skewness of the dataset can interfere with feature selection techniques and why some feature selection methods are not working on some datasets? 

The general workflow can be described as:

data integration -> preprocessing -> exploratory data analysis -> feature selection -> bulding model -> model evaluation -> model interpretation

For the modeling part (building_a_predictive_model) I implemented 10-fold cross validation on three different techniques including Random Forest, Decision Tree, and Linear Regression.
