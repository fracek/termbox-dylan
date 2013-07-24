module: termbox
synopsis: Bindings for the termbox library
author: Francesco Ceccon
copyright: See LICENSE file in this distribution.

define constant <uint8> = <c-unsigned-char>;
define constant <uint16> = <c-unsigned-short>;
define constant <uint32> = <c-unsigned-int>;
define constant <int32> = <c-signed-int>;

define constant $TB-KEY-F1 = 65535;
define constant $TB-KEY-F2 = 65534;
define constant $TB-KEY-F3 = 65533;
define constant $TB-KEY-F4 = 65532;
define constant $TB-KEY-F5 = 65531;
define constant $TB-KEY-F6 = 65530;
define constant $TB-KEY-F7 = 65529;
define constant $TB-KEY-F8 = 65528;
define constant $TB-KEY-F9 = 65527;
define constant $TB-KEY-F10 = 65526;
define constant $TB-KEY-F11 = 65525;
define constant $TB-KEY-F12 = 65524;

define constant $TB-KEY-INSERT = 65523;
define constant $TB-KEY-DELETE = 65522;
define constant $TB-KEY-HOME = 65521;
define constant $TB-KEY-END = 65520;
define constant $TB-KEY-PGUP = 65519;
define constant $TB-KEY-PGDN = 65518;

define constant $TB-KEY-ARROW-UP = 65517;
define constant $TB-KEY-ARROW-DOWN = 65516;
define constant $TB-KEY-ARROW-LEFT = 65515;
define constant $TB-KEY-ARROW-RIGHT = 65514;

define constant $TB-KEY-CTRL-TILDE = 0;
define constant $TB-KEY-CTRL-2 = 0;
define constant $TB-KEY-CTRL-A = 1;
define constant $TB-KEY-CTRL-B = 2;
define constant $TB-KEY-CTRL-C = 3;
define constant $TB-KEY-CTRL-D = 4;
define constant $TB-KEY-CTRL-E = 5;
define constant $TB-KEY-CTRL-F = 6;
define constant $TB-KEY-CTRL-G = 7;
define constant $TB-KEY-BACKSPACE = 8;
define constant $TB-KEY-CTRL-H = 8;
define constant $TB-KEY-TAB = 9;
define constant $TB-KEY-CTRL-I = 9;
define constant $TB-KEY-CTRL-J = 10;
define constant $TB-KEY-CTRL-K = 11;
define constant $TB-KEY-CTRL-L = 12;
define constant $TB-KEY-ENTER = 13;
define constant $TB-KEY-CTRL-M = 13;
define constant $TB-KEY-CTRL-N = 14;
define constant $TB-KEY-CTRL-O = 15;
define constant $TB-KEY-CTRL-P = 16;
define constant $TB-KEY-CTRL-Q = 17;
define constant $TB-KEY-CTRL-R = 18;
define constant $TB-KEY-CTRL-S = 19;
define constant $TB-KEY-CTRL-T = 20;
define constant $TB-KEY-CTRL-U = 21;
define constant $TB-KEY-CTRL-V = 22;
define constant $TB-KEY-CTRL-W = 23;
define constant $TB-KEY-CTRL-X = 24;
define constant $TB-KEY-CTRL-Y = 25;
define constant $TB-KEY-CTRL-Z = 26;
define constant $TB-KEY-ESC = 27;
define constant $TB-KEY-CTRL-LSQ-BRACKET = 27;
define constant $TB-KEY-CTRL-3 = 27;
define constant $TB-KEY-CTRL-4 = 28;
define constant $TB-KEY-CTRL-BACKSLASH = 28;
define constant $TB-KEY-CTRL-5 = 29;
define constant $TB-KEY-CTRL-RSQ-BRACKET = 29;
define constant $TB-KEY-CTRL-6 = 30;
define constant $TB-KEY-CTRL-7 = 31;
define constant $TB-KEY-CTRL-SLASH = 31;
define constant $TB-KEY-CTRL-UNDERSCORE = 31;
define constant $TB-KEY-SPACE = 32;
define constant $TB-KEY-BACKSPACE2 = 127;
define constant $TB-KEY-CTRL-8 = 127;

define constant $TB-MOD-ALT = 1;

define constant $TB-BLACK = #x00;
define constant $TB-RED = #x01;
define constant $TB-GREEN = #x02;
define constant $TB-YELLOW = #x03;
define constant $TB-BLUE = #x04;
define constant $TB-MAGENTA = #x05;
define constant $TB-CYAN = #x06;
define constant $TB-WHITE = #x07;
define constant $TB-DEFAULT = #x0F;

define constant $TB-NORMAL = #x00;
define constant $TB-BOLD = #x10;
define constant $TB-UNDERLINE = #x20;
define constant $TB-BOLD-UNDERLINE = #x30;

define constant $TB-EUNSUPPORTED-TERMINAL = -1;
define constant $TB-EFAILED-TO-OPEN-TTY = -2;
define constant $TB-EPIPE-TRAP-ERROR = -3;

define constant $TB-HIDE-CURSOR = -1;

define constant $TB-INPUT-ESC = 1;
define constant $TB-INPUT-ALT = 2;

define constant $TB-EVENT-KEY = 1;
define constant $TB-EVENT-RESIZE = 2;

define constant $TB-EOF = -1;

define C-struct <_tb-cell>
  slot cell-ch :: <c-char>;
  slot cell-fg :: <uint16>;
  slot cell-bg :: <uint16>;
  pointer-type-name: <tb-cell>;
end;

define C-struct <_tb-event>
  slot event-type :: <uint8>;
  slot event-mod :: <uint8>;
  slot event-key :: <uint16>;
  slot event-ch :: <uint32>;
  slot event-w :: <int32>;
  slot event-h :: <int32>;
  pointer-type-name: <tb-event>;
end;

define C-function tb-init
  result res :: <c-int>;
  c-name: "tb_init";
end;

define C-function tb-shutdown
  c-name: "tb_shutdown";
end;

define C-function tb-width
  result res :: <c-unsigned-int>;
  c-name: "tb_width";
end;

define C-function tb-height
  result res :: <c-unsigned-int>;
  c-name: "tb_height";
end;

define C-function tb-clear
  c-name: "tb_clear";
end;

define C-function tb-present
  c-name: "tb_present";
end;

define C-function tb-set-cursor
  input parameter cx_ :: <c-int>;
  input parameter cy_ :: <c-int>;
  c-name: "tb_set_cursor";
end;

define C-function tb-put-cell
  input parameter x_ :: <c-unsigned-int>;
  input parameter y_ :: <c-unsigned-int>;
  input parameter cell_ :: <tb-cell>;
  c-name: "tb_put_cell";
end;

define C-function tb-change-cell
  input parameter x_ :: <c-unsigned-int>;
  input parameter y_ :: <c-unsigned-int>;
  input parameter ch_ :: <uint32>;
  input parameter fg_ :: <uint16>;
  input parameter bg_ :: <uint16>;
  c-name: "tb_change_cell";
end;

define C-function tb-blit
  input parameter x_ :: <c-unsigned-int>;
  input parameter y_ :: <c-unsigned-int>;
  input parameter w_ :: <c-unsigned-int>;
  input parameter h_ :: <c-unsigned-int>;
  input parameter cells_ :: <tb-cell>;
  c-name: "tb_blit";
end;

define C-function tb-select-input-mode
  input parameter mode_ :: <c-int>;
  result res :: <c-int>;
  c-name: "tb_select_input_mode";
end;

define C-function tb-set-clear-attributes
  input parameter fg_ :: <uint16>;
  input parameter bg_ :: <uint16>;
  c-name: "tb_set_clear_attributes";
end;

define C-function %tb-peek-event
  input output parameter event_ :: <tb-event>;
  input parameter timeout_ :: <c-unsigned-int>;
  result res :: <c-int>;
  c-name: "tb_peek_event";
end;

define C-function %tb-poll-event
  input parameter event_ :: <tb-event>;
  result res :: <c-int>;
  c-name: "tb_poll_event";
end;

/* utf-8 - unicode functions */
define C-function utf8-char-length
  input parameter c_ :: <C-signed-char>;
  result res :: <C-signed-int>;
  c-name: "utf8_char_length";
end;

define C-function utf8-char-to-unicode
  input parameter out_ :: <uint32>;
  input parameter c_ :: <c-string>;
  result res :: <C-signed-int>;
  c-name: "utf8_char_to_unicode";
end;

define C-function utf8-unicode-to-char
  input parameter out_ :: <c-string>;
  input parameter c_ :: <uint32>;
  result res :: <C-signed-int>;
  c-name: "utf8_unicode_to_char";
end;

/* Dylan functions */
define constant <tb-color> = one-of($TB-DEFAULT, $TB-BLACK, $TB-RED, $TB-GREEN,
                                    $TB-YELLOW, $TB-BLUE, $TB-MAGENTA, $TB-CYAN, $TB-WHITE);
define constant <tb-style> = one-of($TB-NORMAL, $TB-BOLD, $TB-UNDERLINE, $TB-BOLD-UNDERLINE);

define function tb-peek-event
    (timeout :: <integer>)
 => (event-type, event :: <tb-event>)
  let e = make(<tb-event>);
  let t = %tb-peek-event(e, timeout);
  values(t, e)
end function tb-peek-event;

define function tb-poll-event
    ()
 => (event-type, event :: <tb-event>)
  let e = make(<tb-event>);
  let t = %tb-poll-event(e);
  values(t, e)
end function tb-poll-event;

define method tb-print
    (x :: <integer>,
     y :: <integer>,
     str :: <string>,
     #key style :: <tb-style> = $TB-NORMAL,
          fg :: <tb-color> = $TB-DEFAULT,
          bg :: <tb-color> = $TB-DEFAULT)
  let f = logior(fg, style);
  for (ch in str, i from 0)
    tb-change-cell(x + i, y, as(<integer>, ch), f, bg);
  end for;
end method tb-print;

define method tb-print
    (x :: <integer>,
     y :: <integer>,
     ch :: <character>,
     #key style :: <tb-style> = $TB-NORMAL,
          fg :: <tb-color> = $TB-DEFAULT,
          bg :: <tb-color> = $TB-DEFAULT)
  let f = logior(fg, style);
  tb-change-cell(x, y, as(<integer>, ch), f, bg);
end method tb-print;
