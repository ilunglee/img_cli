# ImgCLI
A simple tool to extract EXIF data from jpg and jpeg and outputs to html or csv

## Installation
clone this repo and run..
```shell
gem install img_cli-0.1.0.gem
```
## Usage
In your terminal window run the followings.
#### DEFAULT
```shell
# extract info from current directory to csv
img_cli exif
open results.csv
```
#### OUTPUT FORMAT
```shell
# csv
img_cli exif --format=csv
# html
img_cli exif --format=html
open results.html
```
#### CHANGE OUTPUT FILE NAME
```shell
img_cli exif --filename=MY_FILE_NAME
open MY_FILE_NAME.csv
```

#### DIFFERENT DIRECTORY
```shell
# single directory
img_cli exif DIR_PWD
# multiple directories
img_cli exif DIR_PWD1 DIR_PWD2
```

## Contributing
- Clone this repo and go into img_cli-ruby top-level directory and run `bundle install`
- To run the specs run `rspec spec`.
- Submit a pull request for and explain what your changes are.
ps. You will usually want to write tests for your changes

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
