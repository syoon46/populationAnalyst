# Effect of contraceptive usage around the world

User interactive website which shows the effect of contraceptive usage on GDP, growth rate, and fertility rate.

Originally proposed for Fall 2017 **STAT385** University of Illinois at Urbana-Champaign

## Data Process

First, I collected 5 dataset from different sources in order to combine its data.

For each dataset, I selected only 2010's data and necessary variables.

Each dataset contained **key** variable of **ISO3** country code that I merged all of dataset using that variable and finalized one dataset with multiple variables.

I displayed chloropleth map using `rworldmap` R library.

### Sample of final dataset

![](https://i.imgur.com/3UAh5jN.png)

## Output

Users are able to control percentage of contraceptive usage and select different continents to display.

![Example](https://i.imgur.com/YEOzIvs.png)

[Link to Website](https://dannypark95.shinyapps.io/populationAnalyst/)


## Source

* United Nation - Department of Ecnomic and Social Affairs [Website](http://www.un.org/en/development/desa/population/publications/dataset/contraception/wcu2017.shtml)

* The World Bank [Website](http://www.worldbank.org/)
 
* Continent code / Country Code [Website](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)

## Authors

* **Sunghyun Yoon** - *Initial work* - [Website](https://github.com/syoon46)

## License

This project is licensed under the MIT License

## Acknowledgments

* **James Balamuta** - *Course Instructor* - [Website](stat385.thecoatlessprofessor.com)

