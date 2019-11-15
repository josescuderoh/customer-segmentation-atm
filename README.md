# Author-Topic modeling (ATM) for Customer Segmentation

This repo explores the implementation of a topic modeling strategy for basket analysis and customer segmentation using a subset of the Dunnhumby dataset containing the activity of 5.000 customers over 2 years at a retail chain. Several literature was foun for implementing LDA or LDA-variants for basket analysis and customer segmentation, however, none was found to apply the dynamics of authors-topics-documents to customers-baskets-products, as it's carried out in this work.

This repo is divided in three main parts (so is the code):
1. *ETL*: since this data was delivered as multiple csv files that were merged, transformed and sent to q sql database for ease of access and future reference. The file and database schema can also be found here.
2. *Data querying and cleaning*: In this step the database is queried with the data required and then a couple of datasets for customers and baskets are created.
3. *Modeling*: this script contains the application and results obtained from the author topic modeling approach that was used for this work.

# More about the ATM 

TBD

# Why ATM for basket analysis and customer segmentation?

TBD

# References

TBD