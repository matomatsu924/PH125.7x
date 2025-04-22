# Key Points
Mauricio Matoma

# Data Science: Linear Regression

## Section 1: Introduction to Regression

### 1.1. Baseball as a Motiviting Example

#### Baseball Basics

### Key points

- The goal of a baseball game is to score more runs (points) than the
  other team.

- Each team has 9 batters who have an opportunity to hit a ball with a
  bat in a predetermined order. 

- Each time a batter has an opportunity to bat, we call it a plate
  appearance (PA).

- The PA ends with a binary outcome: the batter either makes an out
  (failure) and returns to the bench or the batter doesn’t (success) and
  can run around the bases, and potentially score a run (reach all 4
  bases).

- We are simplifying a bit, but there are five ways a batter can succeed
  (not make an out):

1.  <div>

    1.  **Base on balls (BB):** the pitcher fails to throw the ball
        through a predefined area considered to be hittable (the strike
        zone), so the batter is permitted to go to first base.

    2.  **Single:** the batter hits the ball and gets to first base.

    3.  **Double (2B):** the batter hits the ball and gets to second
        base.

    4.  **Triple (3B):** the batter hits the ball and gets to third
        base.

    5.  **Home Run (HR):** the batter hits the ball and goes all the way
        home and scores a run.

    </div>

- Historically, the batting average has been considered the most
  important offensive statistic. To define this average, we define a
  hit (H) and an at bat (AB). Singles, doubles, triples, and home runs
  are hits. The fifth way to be successful, a walk (BB), is not a hit.
  An AB is the number of times you either get a hit or make an out; BBs
  are excluded. The batting average is simply H/AB and is considered the
  main measure of a success rate.

- Note: The video states that if you hit AFTER someone who hits many
  home runs, you will score many runs, while the textbook states that if
  you hit BEFORE someone who hits many home runs, you will score many
  runs. The textbook wording is accurate.

### 1.2. Correlation

#### Correlation

### Key points

- <div>

  - Galton tried to predict sons’ heights based on fathers’ heights.

  - The mean and standard errors are insufficient for describing an
    important characteristic of the data: the trend that the taller the
    father, the taller the son.

  - The correlation coefficient is an informative summary of how two
    variables move together that can be used to predict one variable
    using the other.

  </div>

- The correlation coefficient is defined for a list of pairs as the sum
  of the product of the standardized values: for each observation i. The
  product term is positive when both the standardized x and y are
  positive or when they are both negative, and the product term is
  negative when the standardized x and y have different signs (one is
  positive and one is negative).

- The Greek letter is typically used to denote the correlation.

- The correlation coefficient essentially conveys how two variables move
  together.

- The correlation coefficient is always between -1 and 1.

- <div>

  - The correlation that we compute and use as a summary is a random
    variable.

  - When interpreting correlations, it is important to remember that
    correlations derived from samples are estimates containing
    uncertainty.

  - Because the sample correlation is an average of independent draws,
    the central limit theorem applies. 

  </div>

### 1.3. Stratification and Variance Explained

### Key points

- <div>

  - The general idea of conditional expectation is that we stratify a
    population into groups and compute summaries in each group.

  - A practical way to improve the estimates of the conditional
    expectations is to define strata of with similar values of x.

  - If there is perfect correlation, the regression line predicts an
    increase that is the same number of SDs for both variables. If there
    is 0 correlation, then we don’t use x at all for the prediction and
    simply predict the average . For values between 0 and 1, the
    prediction is somewhere in between. If the correlation is negative,
    we predict a reduction instead of an increase.

  </div>

## Bivariate Normal Distribution

### Key points

- <div>

  - When a pair of random variables are approximated by the bivariate
    normal distribution, scatterplots look like ovals. They can be thin
    (high correlation) or circle-shaped (no correlation).

  - When two variables follow a bivariate normal distribution, computing
    the regression line is equivalent to computing conditional
    expectations.

  - We can obtain a much more stable estimate of the conditional
    expectation by finding the regression line and using it to make
    predictions.

  </div>
