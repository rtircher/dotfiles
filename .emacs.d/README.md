# My emacs tricks
C-x C-i: shows the functions defined in buffer
--> doesn't work for now

C-x +: Set windows to be of equal size

C-x C-+: increase buffer font size
C-x C--: decrease buffer font size

C-x f: shows recently open files
--> doesn't work right now
C-x C-f M-f: wide find file (search filename in subdirs)

### Help
C-h k: shows functions called by key binding
C-h f: shows function help
C-h v: shows value of an emacs config variable
C-h m: shows all the key bindgins active in the buffer

### Mark
C-<space>: set region start (end is the point)
C-g: cancel region
### Mark ring
C-u C-<space>: Invoke mark ring

### Handy navigation trick to vuew other area of buffer and come back
- Set mark
- navigate to wherever you want
- use mark ring to come back at last the set mark

C-x j: kills entire line
C-k: kills end of line from point

### Auto indent
M-\
--> doesn't work for now

C-x m: starts eshell
-> doesn't work right now

### Manually open up mode
M-x <the function mode name>

### Eval code in buffer
M-x eval-buffer

Good way to tryout new config is to use the \*scratch\* buffer and M-x eval-buffer

## cua-mode
Mx- cua-mode: starts cua mode
C-x <enter>: start rectangle text selection
<enter>: stops rectangle text selection
<type stuff before or after rectangle for multiple line edit>
M-n: allows adding number increments on those multiple lines based on where the point is set
C-w: kills entire block
Mx- cua-mode: starts cua mode

## Ruby mode
### Within a ruby buffer these are the specific key bindings
C-c C-s: starts a irb like buffer (with all the emacs nuggets - completion, copy/paste...)
  - M-p: go up in history
  - M-n: go down in history
  - C-c C-r: sends selected region in the irb ruby buffer
### to start this irb outside of ruby-mode use
M-x inf-ruby


## Version control mode
### Shows up in version controlled files
C-x v = does diff against head
c-u C-x v = does diff against any revision
C-x v u Discard any changes since last check-in
C-x v ~ Checkout any revision of the current file


## Magit
### Git mode
C-x g pulls up git status command interface
  P push
  F pull
  s stage file at point
  u unstage file at point
  S stage all changes
  U unstage all changes
  <tab> shows diff of uncommited changes for the file at point
  c opens commit buffer 
    C-c C-c will commit all commited changes
    C-c C-a allows to ammend commit
  C-h b shows relevant bindings

## elpa (Emacs Lisp Packages Archive)
M-x package-list-packages loads the package list available for emacs
  i mark for installation
  x performs installation of marked packages
