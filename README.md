### INFORMATION ###
This is just a set of admin and simplification scripts I will be using, mostly attached to **hotkeys**. Feel free to copy them, if you like. Some of them will be attached to gems I've made. I will include a Gemfile, so they can be installed, but the Gemfile will be attached to ALL the scripts in here.

If you take any of these, you will most likely want to use hotkeys or cronjobs with scripts I put in here.

Will update this, from time to time, as I add new scripts.

### USAGE ###
# volumectl.rb #
ruby [path/to/]volumectl.rb [volume, type, display]
  ex: ruby ~/scripts/volumectl.rb 50 <- changes volume to 50%
  ex: ruby ~/scripts/volumectl.rb 20 up <- raises volume by 20%
  ex: ruby ~/scripts/volumectl.rb 10 down true <- lowers volume
        by 10% and then prints the volumes for all channels

### INSTALLATION ###
Clone the repo or download each individual script you want.
```
git clone https://github.com/KleineEdelweiss/admin-scripts.git
```

Install the gems (while in the directory).
```
bundle install
```

# The above operation requires bundler #
```
sudo gem install bundler
```