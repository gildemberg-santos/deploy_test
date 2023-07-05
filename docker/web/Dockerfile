# Latest Ubuntu LTS
FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y rbenv

# RUN echo "rbenv install --list"
# RUN rbenv install 3.0.6
# RUN gem install bundler
# RUN bundle install
# CMD ["bundle", "exec", "rails", "server"]




# RUN apt-get -y install curl git wget libpq-dev node libpq-dev vim

# # Install mpapis
# RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
# RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby

# Need to add RVM to the path
# ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# RUN /bin/bash -l -c 'source /etc/profile.d/rvm.sh'
# RUN /bin/bash -l -c "rvm install 2.1.2"
# RUN /bin/bash -l -c "rvm use 2.1.2"
# RUN /bin/bash -l -c "gem install rails -v 4.2.2"

# Copy # Heroku installer to opt and run it
#COPY ./docker_config/install-ubuntu.sh /opt/install-ubuntu.sh
#WORKDIR /opt
#RUN sh install-ubuntu.sh

# Heroku installer
# RUN /bin/bash -l -c 'echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list'
# RUN \wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
# RUN apt-get -y update
# RUN apt-get install -y heroku-toolbelt

# Change back to project root and run bundle
#WORKDIR /var/www/html
#RUN /bin/bash -l -c "bundle install"

# make bundler a default gem
# RUN echo bundler >> /usr/local/rvm/gemsets/global.gems
# # source rvm in every shell
# RUN sed -i '3i . /etc/profile.d/rvm.sh\n' ~/.profile
# # setup some default flags from rvm (auto install, auto gemset create, quiet curl)
# RUN echo "rvm_install_on_use_flag=1\nrvm_gemset_create_on_use_flag=1\nrvm_quiet_curl_flag=1" > ~/.rvmrc

# Copy over the site vhosts
# COPY ./docker_settings/apache_web.conf /etc/apache2/sites-available/000-asite.com.conf
# RUN ln -s /etc/apache2/sites-available/000-asite.com.conf /etc/apache2/sites-enabled/000-asite.com.conf
# RUN rm /etc/apache2/sites-enabled/000-default.conf

# # Link ssl
# RUN ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf

# # Enable modules
# RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
# RUN ln -s /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/ssl.load
# RUN ln -s /etc/apache2/mods-available/ssl.conf /etc/apache2/mods-enabled/ssl.conf
# RUN ln -s /etc/apache2/mods-available/socache_shmcb.load /etc/apache2/mods-enabled/socache_shmcb.load

# # Create some directories so Apache doesn't fallover
# RUN mkdir /var/www/html/public

# # Restart apache to load changes
# RUN service apache2 restart

# # We need to make some directories writable by apache before docker mounts it
# RUN chown -R www-data:www-data /var/www/html

# # Donwload composer. Install to /usr/bin
# WORKDIR /opt/composer
# RUN curl -sS https://getcomposer.org/installer | php
# RUN cp composer.phar /usr/bin/composer

# # make the work directory the web root dir
# WORKDIR /var/www/html
#

# interactive shell by default so rvm is sourced automatically
#ENTRYPOINT /bin/bash -l

CMD ["/bin/bash -l"]
