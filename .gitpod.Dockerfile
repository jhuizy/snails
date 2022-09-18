FROM gitpod/workspace-postgres
USER gitpod

# Install Redis.
RUN sudo apt-get update \
    && sudo apt-get install -y redis-server \
    && sudo rm -rf /var/lib/apt/lists/*

RUN _ruby_version=ruby-2.7.3 \
    && printf "rvm_gems_path=/home/gitpod/.rvm\n" > ~/.rvmrc \
    && bash -lc "rvm reinstall ruby-${_ruby_version} && rvm use ruby-${_ruby_version} --default && gem install rails" \
    && printf "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc \
    && printf '{ rvm use $(rvm current); } >/dev/null 2>&1\n' >> "$HOME/.bashrc.d/70-ruby"
