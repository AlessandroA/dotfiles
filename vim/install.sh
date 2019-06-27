VIMPATH=$HOME
VIMDIR=$VIMPATH/.vim
VIMRC=$VIMPATH/.vimrc
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

set -e

# Backup files.
if [ -d "$VIMDIR" ]; then
    backup_name=$VIMDIR
    while [ -e "$backup_name" ]; do
        printf -v backup_name -- '%s.%02d.bak' "$VIMDIR" "$(( ++number ))"
    done
    mv $VIMDIR $backup_name
fi
if [ -f "$VIMRC" ]; then
    if [ -L "$VIMRC" ]; then
        rm $VIMRC
    else
        backup_name=$VIMRC
        while [ -e "$backup_name" ]; do
            printf -v backup_name -- '%s.%02d.bak' "$VRCIR" "$(( ++number ))"
        done
        mv $VRCIR $backup_name
    fi
fi

# Install vim-plug.
curl -fLo $VIMDIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the vimrc files
ln -s $SCRIPTPATH/vimrc $VIMRC

# Install/Update all plugins.
vim +PlugUpdate
