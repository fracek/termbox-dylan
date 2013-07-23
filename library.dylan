module: dylan-user

define library termbox
  use common-dylan;
  use c-ffi;
  use io;

  export termbox;
end library;

define module termbox
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use c-ffi;

  export <_tb-cell>,
    <tb-cell>,
    cell-ch,
    cell-ch-setter,
    cell-fg,
    cell-fg-setter,
    cell-bg,
    cell-bg-setter,
    <_tb-event>,
    <tb-event>,
    event-type,
    event-type-setter,
    event-mod,
    event-mod-setter,
    event-key,
    event-key-setter,
    event-ch,
    event-ch-setter,
    event-w,
    event-w-setter,
    event-h,
    event-h-setter;

  export $TB-HIDE-CURSOR,
    $TB-INPUT-ESC,
    $TB-INPUT-ALT,
    $TB-EVENT-KEY,
    $TB-EVENT-RESIZE;

  export tb-init,
    tb-shutdown,
    tb-width,
    tb-height,
    tb-clear,
    tb-present,
    tb-set-cursor,
    tb-put-cell,
    tb-change-cell,
    tb-blit,
    tb-select-input-mode,
    tb-set-clear-attributes,
    tb-peek-event,
    tb-poll-event;
end module;
