function mkv2mp4 --description 'Convert mkv to mp4 (x264/aac)'
    argparse 'c/crf=' 'p/preset=' -- $argv
    or return 1

    set -q _flag_crf; or set -l _flag_crf 23
    set -q _flag_preset; or set -l _flag_preset medium

    if test (count $argv) -eq 0
        echo "usage: mkv2mp4 input.mkv [-c crf] [-p preset]"
        return 1
    end

    set -l input $argv[1]
    set -l output (string replace -r '\.mkv$' '.mp4' $input)

    ffmpeg -i $input -c:v libx264 -crf $_flag_crf -preset $_flag_preset -c:a aac $output
end
