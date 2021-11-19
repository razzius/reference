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

[`string match -r`]

```fish
$ if string match -rq 'vim?' $EDITOR
   echo vi or vim
end
vi or vim
```
