# Official Jidoteki API documentation

This repository contains information on using and accessing the Jidoteki™
API.

Jidoteki allows people to create custom virtual machines from scratch.
A web interface for the API is also available at: http://jidoteki.com

## Version

This API documentation is at version: `1.0.1`

## Docs

These pages can be found at: http://docs.jidoteki.com

## Goal

The goal of this project was to create simple HTML files for our API documentation. We also wanted to give everyone the ability to fork/copy/use the same formatting, and tweak for their own documentation.

## Open Source

The documentation and layout/formatting is released as Open Source Software, with the goal of enabling people to use this format for their own API documentation.

### Stripe API

We spent quite some time researching the best API documentation, and realized
Stripe was at the top of the list. We decided to adapt their documentation
methods for our own API documentation, and release it under an Open Source
license for others to use and enjoy.

We want to thank [Stripe](https://stripe.com/)™ for their fantastic work at creating such [wonderful
API documentation](https://stripe.com/docs/api/) pages. We hope everyone decides to use our code in order to
create easy/simple API documentation the way Stripe has.

## Editing

If you want to use this documentation for your own API, you'll need to edit:

* `api_<lang>.html`: Modify the `sectionsArray` and `languagesArray` to match your API
* `menu.html`: Contains the left menu and sub-menus. It's just plain HTML
* `section-*.html`: Create one page for each section found in the JS `sectionArray`

----

* `css/layout.css`: You shouldn't need to change anything in there
* `js/api.js`: You shouldn't need to change anything in there
* `jquery/` & `highlight/`: You also shouldn't need to modify those

## Advanced / Simplified Editing

I'm not sure if this method is considered advanced or simplified, but essentially you can modify the JavaScript and HTML files using CoffeScript and Jade respectively.

Those files are located in the `src/` directory.

### Template Usage

Make sure you have access to the following commands: `coffee`, `jade`. If you don't, just `npm install <those things you're missing>`.

* Compiling CoffeeScript files automatically: `coffee -o html -w -c src`
* Compiling Jade files automatically: `jade -P -o html src/*.jade && jade -P -o html/en src/en/*.jade`

### Adding another language

If you want to have documentation in French, Japanese, or something else, just duplicate the `src/en` directory. Also duplicate the `api_en.jade` file. Modify the `gengo` variable in the `api_yourlang.jade` file and add a language link in the `#language` list. Of course don't forget to modify the `src/yourlang` templates.

To update the Jade files for the new language, you can run: `jade -P -o html/en src/yourlang/*.jade`

## Testing / Issues

Viewing/testing these pages locally works well in Safari on Mac OS X, but
there's an issue with Chrome. You need to start Chrome like this:

```
$ /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-file-access-from-files &
```

The `--allow-file-access-from-files` argument will allow the JavaScript code to
load files on-the-fly. Chrome disabled this by default.

## Todo

* Auto-creation of the left menu (`menu.html` page).

## Bugs

I'm aware the JavaScript/HTML/CSS is not very well formatted and could use some work. If you notice any bugs or are able to fix some of the issues, please file an issue or contribute to this project.

## Contributing

Feel free to fork this repository, submit some changes, and send a pull-request.
We'll review and merge code that's suitable for us and everyone else.

## Acknowledgements

Our API documentation uses Open Source code from multiple sources.
See the NOTICE file for more details.

## License

This project is licensed under the MIT License.
See the LICENSE file for more details.