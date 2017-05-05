#!/bin/env bash
: <<'explain'

bin             # runnable binary file ($PATH)
code            # code, projects, things
docs            # documents, tutorials, references
etc             # misc, extra things
    conf        # any other configure file
    vm          # virtual machines file
media           # multimedia
    musics      # global music in system
    pictures    # pics
    videos      # video, pỏn
net             # things from internet
    downloads   # downloaded file from internet
    torrents    # torrent from internet, mostly temporary
    www         # website dirs
storage         # storage, contains links to external storage, fuse
    acd         # Amazon Cloud Drive
    data        # HDD
    gd          # Google Drive
tmp             # temporary files
weeb            # Weeboo things
    amv         # MAD, AMV, Anime Music Video
    anime       # anime
        movie   # OVA, Movie
        series  # TV series
    anisong     # Song from anime, j-pop
    manga       # manga

explain

mkdir -p ~/{bin,code,docs,etc/{conf,vm},media/{musics,pictures,videos},net/{downloads,torrents,www},storage/{acd,data,gd},weeb/{amv,anime/{movie,series},anisong,manga},tmp}
