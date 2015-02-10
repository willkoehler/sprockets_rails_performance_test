ie6warning is in /public because Rails no longer has an option for generating non-digest
versions of the assets. The only way ie6warning can find the image assets is to put
everything together in /public

See https://github.com/rails/sprockets-rails/issues/49