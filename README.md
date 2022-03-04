MARK COMPLETE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

This plugin offers completions for mark.vim patterns, either matches for all
of them or (through separate mappings) for a particular mark highlight group
only.

SEE ALSO                                                                     \*
- Check out the CompleteHelper.vim plugin page ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) for a full
  list of insert mode completions powered by it.

USAGE
------------------------------------------------------------------------------

    CTRL-X #                Find matches for any mark pattern.
    CTRL-X g#               Like above, but instead of offering matches as
                            completion candidates, find common substrings and turn
                            all matches into a Bash-like Brace Expression.

    CTRL-X 1#               Find matches for the mark pattern belonging to
    CTRL-X g1#              highlight group 1.
    CTRL-X 2#, ...

    CTRL-R #                Insert first match for any mark pattern into the
                            command-line.

    CTRL-R 1#               Insert first match for the mark pattern belonging to
    CTRL-R 2#, ...          highlight group 1 into the command-line.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-MarkComplete
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim MarkComplete*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the mark.vim plugin ([vimscript #2666](http://www.vim.org/scripts/script.php?script_id=2666)), version 3.2.1 or higher.
- Requires the PatternComplete.vim plugin ([vimscript #4248](http://www.vim.org/scripts/script.php?script_id=4248)), version 1.20 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

The number of mark.vim highlight groups depends on the configured palette.
This plugin defines numbered completions for the first 9 groups; if you need
more:

    let g:MarkComplete_MaxMarkMappingNum = 9

The scope of buffers that will be scanned for completion candidates are
controlled by the PatternComplete.vim configuration (or the 'complete'
option): b:PatternComplete\_complete g:PatternComplete\_complete .

If you want to use different mappings, map your keys to the
&lt;Plug&gt;(MarkComplete) mapping targets _before_ sourcing the script (e.g.
in your vimrc):

    imap <C-x>&  <Plug>(MarkCompleteAll)
    cmap <C-r>&  <Plug>(MarkCompleteAll)

    imap <C-x>1& <Plug>(MarkComplete1)
    cmap <C-r>1& <Plug>(MarkComplete1)
    [...]

If you don't want the mappings that return all matches as a single Bash-like
Brace Expression, you can disable them all at once via:

    let g:MarkComplete_EnableBraceMappings = 0

Alternatively, you can tweak or disable them all individually, too:

    imap <C-x>g&  <Plug>(MarkCompleteAllAsBrace)
    imap <C-x>g1& <Plug>(MarkComplete1AsBrace)
    [...]

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-MarkComplete/issues or email (address below).

HISTORY
------------------------------------------------------------------------------

##### GOAL
First published version.

##### 0.01    04-Mar-2022
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
