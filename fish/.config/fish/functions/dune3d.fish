function dune3d --description 'dune3d with desktop GL (NVIDIA GTK4 GLES workaround)'
    env GDK_DISABLE=gles-api /usr/bin/dune3d $argv
end
