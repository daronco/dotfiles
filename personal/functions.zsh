tw() {
    # livestreamer twitch.tv/$1 "${2:-best}" --ringbuffer-size 100M --hls-live-edge 12 -l ${3:-info}
    streamlink --twitch-disable-ads twitch.tv/$1 "${2:-best}"
}

discord () {
    disc=$(find ~/Downloads -type f -name Discord -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r | cut -d ' ' -s -f3 | head -1)
    exec $disc > /dev/null 2>&1 &
}

# tomp3 input.m4a
tomp3 () {
    ffmpeg -i ${1} -c:v copy -c:a libmp3lame -q:a 4 output.mp3
}
