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
