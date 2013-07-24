module: hello-world
synopsis: A simple program that uses the termbox module
author: Francesco Ceccon
copyright: See LICENSE file in this distribution.

define function center-height () => (y :: <integer>)
  let screen-h = tb-height();
  round((screen-h - 1) / 2.0)
end function center-height;

define function center-width (text :: <string>) => (x :: <integer>)
  let screen-w = tb-width();
  round((screen-w - size(text)) / 2.0)
end function center-width;

define function print-framed-text (x, y, text :: <string>)
  local method print-yellow (x, y, text)
    tb-print(x, y, text, fg: $TB-YELLOW);
  end method print-yellow;

  tb-print(x, y, text, style: $TB-UNDERLINE, fg: $TB-MAGENTA);
  let tl = y - 2;
  let bl = y + 2;
  let ll = x - 3;
  let rl = x + size(text) + 3;
  let hl = make(<string>, size: (rl - ll), fill: '-');
  for (i from 0 below (bl - tl))
    print-yellow(ll, tl + i, '|');
    print-yellow(rl, tl + i, '|');
  end for;
  print-yellow(ll, tl, hl);
  print-yellow(ll, bl, hl);
  print-yellow(ll, tl, '+');
  print-yellow(ll, bl, '+');
  print-yellow(rl, tl, '+');
  print-yellow(rl, bl, '+');
end function print-framed-text;

define function main (name :: <string>, arguments :: <vector>)
  tb-init();
  let text = "Hello, World";
  let y = center-height();
  let x = center-width(text);

  block (exit)
    while (#t)
      print-framed-text(x, y, text);
      tb-present();

      let (t, ev) = tb-poll-event();
      select (ev.event-type)
        $TB-EVENT-KEY
          => exit();
        $TB-EVENT-RESIZE
          => x := center-width(text);
             y := center-height();
             tb-clear();
      end select;
    end;
  end block;
  tb-shutdown();
  exit-application(0);
end function main;

main(application-name(), application-arguments());
