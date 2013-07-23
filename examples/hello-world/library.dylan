module: dylan-user

define library hello-world
  use common-dylan;
  use io;
  use termbox;
end library;

define module hello-world
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use termbox;
end module;
