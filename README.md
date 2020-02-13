# sandwich

# Installation

Just execute
```
./install.sh
```
to build the image (sandwich:eng-spa).

# Language setup
By default English (eng) and Spanish (spa) packages are installed.
If you need another one you must add the corresponding package (tesseract-ocr-<lang>) to the `Dockerfile`
and then rebuild the image (using a descriptive :tag).

# Usage
The `pdfsandwich` binary will run in the container will be called through `./sandwich.sh`.
The command line usage is almost the same as the [original](http://www.tobias-elze.de/pdfsandwich/) except for the input and output parameters.
They should now be specified in the environment variables `$INPUT` and `$OUTPUT$.
If they are not specified, the input file will be assumed the standard input (stdin) and the output would be the file `./output.pdf`.

# Example
The example below should convert a two-column pdf written in Spanish into a readable pdf.
```
INPUT=in.pdf OUTPUT=out.pdf ./sandwich.sh -layout double -lang spa
```
