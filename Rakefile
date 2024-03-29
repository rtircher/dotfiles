FILES = %w|.emacs .gitconfig .zshrc .vimrc|
DIRS = %w|.emacs.d .zsh.d|
HOME = File.expand_path("~/")

desc "Cleans existing files and directories"
task :clean do
  FILES.each { |f| rm_f "#{HOME}/#{f}" }
  DIRS.each { |d| rm_rf "#{HOME}/#{d}" }
end

FILES.each { |f| file f }
DIRS.each { |d| directory d }
LINKS = (FILES + DIRS).collect do |entry|
  file "#{HOME}/#{entry}" => entry do |t|
    target = t.to_s
    source = File.join(File.dirname(__FILE__), entry)
    puts "Exec: ln -s #{source} #{target}"
    ln_s source, target
  end
end

desc "Setup global gitignore"
task :setup_gitignore do
  sh %Q|git config --global core.excludesfile .gitignore|
end

task :emacs_client_msg do
  puts
  puts 'Now link emacs to the app emacs client:'
  puts 'alias emacs="[location of Emacs.app]/Emacs.app/Contents/MacOS/bin/emacsclient -n"'
end

desc "Installs symlinks in the home directory for all config files"
task :install => LINKS

desc "Do all the work for a clean install"
task :default => [:install, :setup_gitignore, :emacs_client_msg]
