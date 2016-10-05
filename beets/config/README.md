Install

```
sudo pip install beets
sudo pip install requests # for FetchArt plugin and others
sudo aptitude install imagemagick # for FetchArt#compare_threshold
```

Useful beet's commands
======================


Import a new album:

```bash
beet import /path/to/album
```

For albums I own:

```bash
beet modify owned=true artist:'Dave Matthews'
beet ls owned:true
```

For new albums I should listen to:

```bash
beet modify mycat=new
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

If files were moved to another place, re-import them all:

```bash
# will remove paths that don't exist anymore
beet update
# -W so tags aren't written, -A to not autotag
beet import . -W -A
```

Setting albums as soundtracks:

```bash
beet modify albumtype=soundtrack album:"Final Fantasy Tactics"
# if it was a compilation before
beet modify albumtype=soundtrack comp=0 album:"Final Fantasy Tactics"
```

List ID3 and manually set it on files:

```bash
mp3info XCOM\ -\ Enemy\ Unknown\ Soundtrack/1.mp3
mp3info -a XCOM -l "Enemy Unknown Soundtrack" XCOM\ -\ Enemy\ Unknown\ Soundtrack/*.mp3
```


Categories
==========

Names:

* new
* ...

To list:

```bash
beet ls mycat:new
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
