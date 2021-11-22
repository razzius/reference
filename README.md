### Remove one directory level of path string in shell script

[`cut -d / -f 2-`](https://stackoverflow.com/a/47402740/1636613)

```fish
$ echo a/b/c | cut -d / -f 2-
b/c
```

### Remove first word delimited by spaces in shell script

[`cut -d ' ' -f 2-`](https://stackoverflow.com/a/7814456/1636613)

```fish
$ head -1 README.md | cut -d ' ' -f 2-
Remove one directory level of path string in shell script
```

### Match regex string in fish

[`string match -r`](https://fishshell.com/docs/current/cmds/string-match.html#match-regex-examples)

```fish
$ if string match -rq 'vim?' $EDITOR
   echo vi or vim
end
vi or vim
```

### Slice string in fish

[echo $var[1..3]](https://fishshell.com/docs/current/language.html#index-range-expansion)

Called "index range expansion". Works on whole lines.

Since [fish 3.2](https://github.com/fish-shell/fish-shell/blob/master/CHANGELOG.rst#fish-320-released-march-1-2021) the end index is optional.

```fish
$ echo (seq 3)[2..]
2 3
```

To slice within a line, use `string split ' '` first.

```
$ echo (echo a b c | string split ' ')[2..]
b c
```

### Move a directory into the current directory, overwriting a local directory of the same name

[`rsync --archive --delete <source> <destination>`](https://stackoverflow.com/a/53349667/1636613)

The issue arises in the following directory structure:

```
$ tree
.
├── dir-a
│   └── dir-b
│       └── some_file
└── dir-b
    └── useless_file

3 directories, 2 files

# mv errors instead of overwriting dir-b
$ mv dir-a/dir-b/ .
mv: rename dir-a/dir-b/ to ./dir-b/: Directory not empty

# explicitly passing ./dir-b just puts the files in ./dir-b, creating a nested dir-b:
$ mv dir-a/dir-b/ ./dir-b
$ tree
.
├── dir-a
└── dir-b
    ├── dir-b
    │   └── some_file
    └── useless_file

3 directories, 2 files
```

### Vim search for whole word

[`/\<word\>`](https://stackoverflow.com/a/3845287/1636613) (though starting with \< is usually enough)

This is so that for example `eat` isn't found in `create`.

### Vim `command` that runs multiple commands

Tell the first that it can be followed with another using `-bar`:

```viml
command! -bar Terminal terminal
```

Then create a command that uses `|` to run multiple commands:

```viml
command! FullscreenTerminal Terminal|:only
```

[Source](https://unix.stackexchange.com/a/144575/124123)

### `tree` do not show summary

[`tree --noreport`](https://manpages.ubuntu.com/manpages/trusty/man1/tree.1.html)

```fish
$ tree --noreport
.
└── dir
    └── some_file
```

### `funcsave` to current directory

`funcsave -d .` (from `man funcsave`)

```fish
$ function commit
      git-add-commit (echo (cat README.md | grep '###' | tail -1 | string split ' ')[2..])
  end
$ funcsave -d . commit
$ git stat
## main...origin/main
?? commit.fish
```

### Github website submit comment and close issue

⌘ shift enter

### How to make fish script executable

Start with `#!/usr/bin/env fish`

### Check if argument is executable in fish

[`type -q zoxide`](https://stackoverflow.com/questions/42831558/check-if-a-program-exists-from-a-fish-script)

(Using [zoxide](https://github.com/ajeetdsouza/zoxide) as an example)

### How to make `less` always run with `-R` flag

[export LESS="-R"](https://stackoverflow.com/a/17227192/1636613)

### How to parse and access named arguments with fish

```fish
$ function arg_test
    argparse d/directory= -- $argv
    echo $_flag_directory
  end
$ arg_test -d 3
3
```

[See n/name=](https://fishshell.com/docs/current/cmds/argparse.html#example-option-specs).

> `n/name=` means that both `-n` and `--name` are valid. It requires a value and can be used at most once. If the flag is seen then `_flag_n` and `_flag_name` will be set with the single mandatory value associated with the flag.


### How to show git diff inline, by words

`git diff --color-words`
### Decimal to hex in shell

[`printf %x <number>`](https://stackoverflow.com/a/378839/1636613)

```
$ printf %x 10
a
```

### Delete a range of lines in vim ex

[`:6,13d`](https://stackoverflow.com/a/21689505/1636613)
