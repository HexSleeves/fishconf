function brew_export --description 'Export Brewfile of homebrew packages'
    # brew is a pain... it dumps to a forced Brewfile, and is not consistently
    # sorted, making version controling your Brewfile tricky. #FixedIt
    set -l brewfile "/tmp/Brewfile.tmp"
    brew bundle dump --force --file="$brewfile"
    grep '^tap\ ' "$brewfile" | sort >"$brewfile".2
    grep '^brew\ ' "$brewfile" | sort >>"$brewfile".2
    grep '^cask\ ' "$brewfile" | sort >>"$brewfile".2
    grep '^mas\ ' "$brewfile" | sort >>"$brewfile".2
    cat "$brewfile".2
    command rm "$brewfile" "$brewfile".2
end
