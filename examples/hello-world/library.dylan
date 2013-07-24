module: dylan-user

define library hello-world
  use common-dylan;
  use io;
  use termbox;
end library;

define module hello-world
  use common-dylan;
  use format-out;
  use termbox;
end module;
