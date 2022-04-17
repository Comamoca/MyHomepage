watchmedo shell-command --recursive --patterns '*.nim' --command 'nim js ${watch_src_path}' ./.
