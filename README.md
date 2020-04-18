# AppleScripts for Templates and other things

Please use, share, and improve.

@mmynsted

[License](./LICENSE.md)

## Templates for GUI applications: `templateHelper`

The idea is to use AppleScript to simplify getting user input for placeholder
variables for templates.

The `templateHelper.applescript` uses Objective-C mostly for the associative
arrays. AppleScript records are difficult to work with, especially if one wants
control over the construction of keys. Using the Objective-C dictionary
entities solves these issues. Because the script is using Objective-C it needs
to be built into a script bundle, `scptb`.  The `install-templateHelper` shell
script builds the bundle into the user's `Script Libraries` folder. It makes
the `Script Libraries` folder if it does not already exist.  It might make
sense to simply read the file and do this manually. 

