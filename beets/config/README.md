Useful beet's commands
======================

For albums I own:

```bash
beet modify owned=true artist:'Dave Matthews'
```

Import a new album:

```bash
beet import /path/to/album
```

Change album name:

```bash
beet modify -a the gorge album='The Gorge'
```

List location of files:

```bash
beet ls -p kenny
```

Show "hidden" options when importing:

```bash
# -t for timid
beet import -t /path/to/file
```

To do once in a while
=====================

Search for missing tracks and fix them if they are actually inconsistency in the library:

```bash
# full
beet miss

# summary
beet miss -c

# check the folders and reimport if there's something wrong
# it's usually good to find the album on musicbrainz and import them by id
```
