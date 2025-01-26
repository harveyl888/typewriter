# Typewriter Extension For Quarto

Shortcode to use Typewriterjs typewriter effect [https://github.com/tameemsafi/typewriterjs](https://github.com/tameemsafi/typewriterjs).

## Installing

```bash
quarto add harveyl888/typewriter
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

To use on a page just add the `{{< typewriter >}}` shortcode.  The extension takes parameters from the page yaml.  The following parameters are available:

  -  **strings** Required.  An array of strings to rotate through in the typewriter effect.
  -  **prefix** Optional.  The text to include before the typewriter effect.
  -  **loop** Optional boolean.  If true then constantly loop through the strings.  Default = false.
  -  **cursor** Optional.  String to set the cursor.  Default = "|".
  -  **delay** Optional.  The delay between each key when typing.  Can be set to a numerical value (milliseconds) or 'natural'.  Default is 'natural'.
  -  **deleteSpeed** Optional.  The delay between deleting each character.  Can be set to a numerical value (milliseconds) or 'natural'.  Default is 'natural'.
  -  **pauseFor** Optional.  The pause duration after a string is typed.  Default is 1500 milliseconds.

### Styling

The following classes are use to style the typewriter effect:

  -  **.typewriter** Class covering entire effect div.
  -  **.typewriter-prefix** Class used to style prefix text.
  -  **.typewriter-strings** Class used to style strings text.
  -  **.typewriter-cursor** Class used to style cursor.

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

