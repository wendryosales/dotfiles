#!/usr/bin/env bash

# Spotify Player Path
spotify_player_path="$HOME/.cargo/bin/spotify_player"

# Icons
icon_play="%{T2}%{F#00FF00}%{F-}%{T-}"
icon_pause="%{T2}%{F#FF0000}%{F-}%{T-}"
icon_stop="%{T2}%{F#FF0000}%{F-}%{T-}"
icon_prev="%{T1}%{F#00FFFF}玲%{F-}%{T-}"
icon_next="%{T1}%{F#00FFFF}怜%{F-}%{T-}"
icon_spotify="%{F#1DB954}%{F-}"

# Get Spotify Status
status=$($spotify_player_path get key playback 2> /dev/null)
is_playing=$(echo "$status" | jq -r '.is_playing')

# Set Icons based on Status
if [[ "$is_playing" == "true" ]]; then
    icon="$icon_pause"
else
    icon="$icon_play"
fi

# Get Artist and Title
artist=$(echo "$status" | jq -r '.item.artists[0].name')
title=$(echo "$status" | jq -r '.item.name')

# Truncate Title if necessary
limit_total=15
artist_len=${#artist}
title_len=${#title}

if ((artist_len + title_len > limit_total)); then
    title_len=$((limit_total - artist_len - 3))
    title="${title::title_len}..."
fi

# Combine Output
output="%{A1:$spotify_player_path playback previous:}$icon_prev%{A}  %{A1:$spotify_player_path playback play-pause:}$icon%{A}  %{A1:$spotify_player_path playback next:}$icon_next%{A}  %{A1:$HOME/.config/i3/scripts/i3_music:}$icon_spotify%{A}  $artist - $title"

# Output
echo "%{A1:$spotify_player_path playback play-pause:}$output%{A}"
