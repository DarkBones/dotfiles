# TODO: CLEAN UP

ddump() {
    # local filename=${1:-snapshot}
    # local filepath=~/Developer/papershift/db_snapshots/$filename.dump
    #
    # if [ -f $filepath ]; then
    #     echo "$filepath exists. Overwrite? (y/n): \c"
    #     read confirm
    #     if [[ $confirm != [yY] ]]; then
    #         echo "Aborting."
    #         return 1
    #     fi
    # fi

    # PGPASSWORD="password" pg_dump -U postgres -h 127.0.0.1 -d postgres -F c -b -v -f $filepath
    ~/.dotfiles/zsh/.zsh/scripts/ddump.sh $1
}

drestore() {
    # local filename=${1:-snapshot}
    # local filepath=~/Developer/papershift/db_snapshots/$filename.dump
    #
    # if [ ! -f $filepath ]; then
    #     echo "$filepath does not exist. Aborting."
    #     return 1
    # fi
    #
    # ~/.dotfiles/zsh/.zsh/scripts/drestore.sh $filename
    ~/.dotfiles/zsh/.zsh/scripts/drestore.sh $1
}

alias web-pry="docker-compose exec web bundle exec pry-remote -w"
alias sidekiq-pry="docker-compose exec sidekiq_all bundle exec pry-remote -w"
alias bundle-install="docker-compose exec web bundle install && docker-compose exec sidekiq_all bundle install && docker-compose exec sidekiq_assignments bundle install"
