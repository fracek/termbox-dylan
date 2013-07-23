module: termbox

define constant <uint8> = <c-unsigned-char>;
define constant <uint16> = <c-unsigned-short>;
define constant <uint32> = <c-unsigned-int>;
define constant <int32> = <c-signed-int>;

define C-struct <_tb-cell>
  slot cell-ch :: <uint32>;
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

define constant $TB-HIDE-CURSOR = -1;

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

define constant $TB-INPUT-ESC = 1;
define constant $TB-INPUT-ALT = 2;

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

define constant $TB-EVENT-KEY = 1;
define constant $TB-EVENT-RESIZE = 2;

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
