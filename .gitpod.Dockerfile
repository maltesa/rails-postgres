FROM gitpod/workspace-postgres:2023-03-06-18-43-51
USER gitpod

RUN _ruby_version=ruby-3.1.2 \
    && printf "rvm_gems_path=/home/gitpod/.rvm\n" > ~/.rvmrc \
    && bash -lc "rvm reinstall ruby-${_ruby_version} && rvm use ruby-${_ruby_version} --default && gem install rails" \
    && printf "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc \
    && printf '{ rvm use $(rvm current); } >/dev/null 2>&1\n' >> "$HOME/.bashrc.d/70-ruby"
