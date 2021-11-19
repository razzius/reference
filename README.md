### Remove one directory level of a path string

[`cut -d / -f 2-`](https://stackoverflow.com/a/47402740/1636613)

```
$ echo a/b/c | cut -d / -f 2-
b/c
```
