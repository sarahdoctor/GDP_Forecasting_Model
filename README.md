# GDP_Forecasting_Model
Forecasting India's GDP rate for the years 2022-23 and 2023-24 using an ARIMA model

Dataset: India’s annual GDP Growth rate from 1961 to 2021 was collected from the Reserve Bank of India database. It was then converted to time-series data.

- Autocorrelation Function (ACF) and Partial ACF (PACF) were examined and the series appeared to be stationary. Further, this can be verified using the Augmented Dickey-Fuller test.
- The Chow Test was used to test whether the data has a structural break in 1965 or 1979 - both.
- An MA1 model was found to provide the lowest AIC. According to this forecast, the GDP growth rate was found to be 5.7% for both years, showing steady growth.
- The model was statistically validated using the Ljung-Box test. The results were found to be reliable with a highly significant p-value at 5% level of significance.
