# Bayesain-Network

Bayesian Belief Networks are the overlay of two mathematical concepts, probability theory
and graph theory. These networks can be applied to various situations and allow the combination of expert knowledge
when constructing them. Ultimately, they are powerful models that can explain rigorous mathematics in an easily
interpretable way.

### Common Types
Recall that the Naive Bayes Formula is as follows:
$$P(A|B)=\frac{P(B|A)\times P(A)}{P(B)}$$

Gaussian Naive Bayes
Naive Bayes is a classification type of algorithm meaning it can be used with the dependent variable is binary.The Naıve Bayes algorithm has the assumption that all features are independent of one another. Even though in many instances this will not be true, the algorithm still performs surprisingly well and thus can be used for various data sets and situations. The Na ̈ıve Bayes algorithm is trained quickly because of the assumption of independence. This means that there are no coefficients that need to be fitted since all the algorithm does is finds the probability for each class (dependent outcome) for each feature value. The outcome probabilities in the Na ̈ıve Bayes algorithm are calculated by the frequency of outcome divided by the total number of instances.<br>

This algorithm is the Naive Bayes when establishing a Gaussian Distribution for the data. Gaussian Distribution is another name for Normal Distribution which is a continuous function that resembles the bell curve. It has a probability density function with a mean of 0 and a standard deviation of 1. For large datasets, meaning large number of rows of data, the Gaussian distribution can be approximate to the binomial distribution of events. Gaussian Na ̈ıve Bayes works by calculating the mean and standard deviation from the training data and then uses the probability density function from the Gaussian Distribution to make predictions. Gaussian Na ̈ıve Bayes was utilized for this particular project for the following reasons:
- Dependent Variable is Binary and thus it’s a classification task
- Gaussian Na ̈ıve Bayes is easiest in the computational standpoint because only the mean and standard deviation need to
be estimated from the training data

Naive Bayes also uses conditional probability when building the network. Conditional probabilities can be understood
as the probability of one event happening given another event has happened. Thus the following definition is given, If A
and B are two events in a sample space S, then the conditional probability of A given B is:

$$P(A|B)=\frac{P(A \cap B}{P(B)}, \text{where} B>0$$
