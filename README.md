recursivefilecmd
==

Execute a command on files with a specific extension recursively in a directory tree.

<br>

# 1. Overview
## 1.1. Usage

```sh
./recursivefilecmd.sh <extension> <path> <command ..>
```

<br>

### 1.1.1. Arguments

- `extension`: The file extension to search for.
- `path`: The root directory to start searching for files.
- `command`: The command to execute on each file.

<br>

### 1.1.2. Examples

```sh
./recursivefilecmd.sh 'hcl' 'services/' nomad run -detach
```

```sh
./recursivefilecmd.sh 'yaml' 'config/' kubectl apply -f
```

<br>

## 1.2. Behaviour 

The file-name including its path are added to the end of the given command.

All files are executed in-sequence.

When `path` is a file which matches the extension, only it is executed.<br>
When the extension doesnt match, the directory is used instead, walking up up to 3 times, searching for files matching the extension.

<br>

# 2. Development
## 2.1. Features

Maybe i'll add some more features, here a few i can think of:

- [ ] Convert project to golang
- [ ] Add options for optional things
- [ ] Replace `extension`-filter with a regex-match
- [ ] Make recursive optional
- [ ] Parameterize passed-filepath (e.g. # for all & #1 for regex-group 1)
