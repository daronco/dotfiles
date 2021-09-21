tw() {
    # livestreamer twitch.tv/$1 "${2:-best}" --ringbuffer-size 100M --hls-live-edge 12 -l ${3:-info}
    streamlink --twitch-disable-ads twitch.tv/$1 "${2:-best}"
}
