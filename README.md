# Author-Topic modeling (ATM) for Customer Segmentation

This repository explores the implementation of an author-topic modeling strategy for basket analysis and customer segmentation problem. This is carried out using a subset of a Dunnhumby dataset containing the activity of 5.000 customers over 2 years at a retail chain. The dataset is available [here](https://www.dunnhumby.com/careers/engineering/sourcefiles#).

Several literature was found for implementing topic models on basket data, including Latent Dirichlet Allocation (LDA), Sequence LDA, Correlated Topic Models (CTM), Dynamic Topic Model (DTM) and other LDA variants. Most use the set of products purchased by the customer as words in order to find latent topics to assign to all customers in a similar fashion to how LDA assigns a probability distribution over topics to a document, some others model baskets by assigning a probability distribution over products to topics and topics to baskets. However, *no other work has applied the dynamics of authors-topics-documents to customers-baskets-products*, in order to model customers as a probability distribution over topics and baskets as a distribution of topics.

## More about the ATM 

Proposed by Rosen-Zvi et al, the model is based on Topic LDA (Blei et al) and combine it with an author model by introducing Dirichlet prior for topic assignments over authors, in order to find what authors write about and what documents contain and how this is related to the whole corpus. Check the [paper](https://mimno.infosci.cornell.edu/info6150/readings/398.pdf) for more details on the model.

This model has been implemented in gensim as **atmodel** based on Rosen-Zvi's work and it inherits from the Ldamodel from the same package. All details [here](https://radimrehurek.com/gensim/models/atmodel.html).

## Why ATM for basket analysis and customer segmentation?

Here are some of the reasons why it would be useful to model customers and baskets using this approach:

- *Group baskets*: we can cluster baskets by their support in the whole dataset and we can understand how the different products are purchased together and what they have in common.
- *Cluster customers*: by obtaining the distribution of a customer over topics we can cluster together customers with similar behavior using algorithms such as KMeans, DBSCAN, etc.
- *Reduce dimensionality*: we could also reduce dimensionality of large sparse matrix that are used for clustering (among others) in order to interpret a customer's relationship with the products in a compact and clearer way.
- *Recommend*: this kind of approach allows us to recommend products given the basket status and the likelihood of related products using the latent distributions found by the model.
- *Cross-selling*: we could even discover interesting bundles to offer our customers given the relationship among products.
- *Layout optimization*: given this data and the set of topics/customers discovered, the information could be harnessed to make in-store layout decisions and experiment their impact in customer behavior. 


# Customer Segmentation

This repo is divided in three main parts (so is the code) that can be found in the **Code** folder:
1. [**ETL**](Code/ETL_Pipe.ipynb): since this data was delivered as multiple csv files that were merged, transformed and sent to a SQL database for ease of access and future reference. The file and database schema can also be found here.
2. [**Data querying and cleaning**](Code/DataCleaning.ipynb): In this step the database is queried with the data required and then a couple of datasets for customers and baskets are created.
3. [**ATM Modeling**](Code/ATM.ipynb): this script contains the application and results obtained from the author topic modeling approach that was used for this work.


# References

* Rosen-Zvi, Michal, et al. "The author-topic model for authors and documents." Proceedings of the 20th conference on Uncertainty in artificial intelligence. AUAI Press, 2004.
* Blei, David M., Andrew Y. Ng, and Michael I. Jordan. "Latent dirichlet allocation." Journal of machine Learning research 3.Jan (2003): 993-1022.