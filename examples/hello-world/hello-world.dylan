module: hello-world
synopsis: 
author: 
copyright: 

define function main (name :: <string>, arguments :: <vector>)
  tb-init();
  block (exit)
    while (#t)
      let (t, ev) = tb-poll-event();
      select (ev.event-type)
        $TB-EVENT-KEY => exit();
        $TB-EVENT-RESIZE => ;
      end select;
    end;
  end block;
  tb-shutdown();
  exit-application(0);
end function main;

main(application-name(), application-arguments());
