# CastorEDCApi

## Features

This is an R package for exporting your data from Castor Electronic Data Capture (EDC) to R.
It makes use of the Python wrapper under the hood (https://github.com/reiniervlinschoten/castoredc_api).

## Installation

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

## Example

You can export your data from Castor EDC with two lines of code.

```r
library(CastorEDCApi)

dataframes <- export_data('MYCLIENTID', 'MYCLIENTSECRET', 'MYSTUDYID', 'data.castoredc.com')
```

## Data Formatting
Date fields are returned as strings (dd-mm-yyyy)  
Datetime fields are returned as strings (dd-mm-yyyy hh-mm)  
Numeric fields are all returned as floats.

## Missing Data
Missing data is mostly handled through pandas (NaN).

User-defined missing data is handled through its definitions in Castor.  
For numeric and text-like variables, these values are -95, -96, -97, -98 and -99.  
For datetime data, missing data values are with the years 2995, 2996, 2997, 2998, and 2999.  

## Prerequisites

1. See [DESCRIPTION](DESCRIPTION)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/reiniervlinschoten/castoredc_api-R/tags). 

## Authors

* **R.C.A. van Linschoten** - *Initial Development* - [Reinier van Linschoten](https://github.com/reiniervlinschoten)

See also the list of [contributors](https://github.com/reiniervlinschoten/castoredc_api-R/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Franciscus Gasthuis & Vlietland for making time available for development  
* Castor EDC for support and code review

