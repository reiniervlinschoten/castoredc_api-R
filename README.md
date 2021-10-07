# CastorEDCApi

## Features

This is an R package for exporting your data from Castor Electronic Data Capture (EDC) to R.  
It makes use of the Python wrapper under the hood (https://github.com/reiniervlinschoten/castoredc_api).

## Installation & Usage

<!---

You can install the released version of CastorEDCApi from [CRAN](https://CRAN.R-project.org) with:

```r
install.packages("CastorEDCApi")
```
-->

You can install the development version from [GitHub](https://github.com/) with:

```r
# install.packages("devtools")
devtools::install_github("reiniervlinschoten/castoredc_api-R")
```

Then you can export your data from Castor EDC with three lines of code.  
First create and start the necessary Python environment.  
If this already exists, this will start and update the Python environment.  
Then you can download your study data for analysis.  
For downloading you need your client-ID and client-secret (don't share these!), study-ID and url to the server.
* client-ID and client-secret: Account -> Settings -> Castor EDC API
* study-ID: Study -> Settings -> Castor Study ID
* url: *region*.castoredc.com
   
```r
library(CastorEDCApi)

# Create/Start Python environment, do this whenever you start a new R session
configure_python()

# Exports data
dataframes <- export_data('MYCLIENTID', 'MYCLIENTSECRET', 'MYSTUDYID', 'data.castoredc.com')
```

During the same R session, you can reexport your data by just running the below code.

```r
# Exports data
dataframes <- export_data('MYCLIENTID', 'MYCLIENTSECRET', 'MYSTUDYID', 'data.castoredc.com')
```

### Python Environment
If an error occurs, this can be because your Python environment is not setup correctly. 
First try setting up your Python environment:

```r
library(CastorEDCApi)

# Create/Start Python environment, do this whenever you start a new R session
configure_python()
```

If that doesn't work, copy the error with the output from the below functions and open an issue detailing your error.

```r
reticulate::py_discover_config()
reticulate::conda_list()
```

## Data Formatting
Date fields are returned as strings (dd-mm-yyyy)  
Datetime fields are returned as strings (dd-mm-yyyy hh-mm)  
Numeric fields are all returned as floats.

## Missing Data
Missing data is mostly handled through standard NA.

User-defined missing data is handled through its definitions in Castor.  
For numeric and text-like variables, these values are -95, -96, -97, -98 and -99.  
For datetime data, missing data values are with the years 2995, 2996, 2997, 2998, and 2999.  

## Prerequisites

1. See [DESCRIPTION](DESCRIPTION)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](https://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/reiniervlinschoten/castoredc_api-R/tags). 

## Authors

* **R.C.A. van Linschoten** - *Initial Development* - [Reinier van Linschoten](https://github.com/reiniervlinschoten)

See also the list of [contributors](https://github.com/reiniervlinschoten/castoredc_api-R/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Franciscus Gasthuis & Vlietland for making time available for development  
* Castor EDC for support and code review

