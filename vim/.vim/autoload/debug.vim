function debug#ToggleBreakPoint() abort
  call vimspector#ToggleBreakpoint()
endfunction

function debug#ToggleConditionalBreakPoint() abort
  let l:expression = input("condition: ")
  call vimspector#ToggleBreakpoint({'condition' : l:expression})
endfunction

function debug#Launch() abort
  call vimspector#Launch()
endfunction

function debug#Stop() abort
  call vimspector#Stop()
  call vimspector#Reset()
endfunction

function debug#StepOver() abort
  call vimspector#StepOver()
endfunction

function debug#StepInto() abort
  call vimspector#StepInto()
endfunction

function debug#StepOut() abort
  call vimspector#StepOut()
endfunction

function debug#RunToCursor() abort
  call vimspector#RunToCursor()
endfunction

function debug#Continue() abort
  call vimspector#Continue()
endfunction

function debug#CreateConfiguration(config_name) abort
  let l:config = {}
  if filereadable(getcwd() . "/.vimspector.json")
    let l:lines        = readfile(getcwd() . "/.vimspector.json")
    if len(l:lines) == 0
      execute '!rm -f ' . getcwd() . '/.vimspector.json'
      call debug#CreateConfiguration(a:config_name)
      return
    endif
    let l:file_content = join(l:lines)
    let l:config       = JSON#parse(l:file_content)
  endif
  if !has_key(l:config, 'configurations')
    let l:config['configurations'] = {}
  endif
  if has_key(l:config['configurations'], a:config_name)
    echoerr "Configuration '" . a:config_name . "' already exists!"
    return
  endif
  let l:debug_config = {
    \ "adapter"       : "vscode-cpptools",
    \ "configuration" : {
    \     "type"            : "cppdbg",
    \     "request"         : "launch",
    \     "program"         : "",
    \     "args"            : [],
    \     "cwd"             : "${workspaceRoot}",
    \     "environment"     : "",
    \     "externalConsole" : "boolean",
    \     "stopAtEntry"     : "boolean",
    \     "MIMode"          : "gdb",
    \     "logging"         : {
    \         "engineLogging" : "boolean"
    \     }
    \   }
    \ }
  let l:config['configurations'][a:config_name] = l:debug_config
  call writefile(split(JSON#stringify(l:config), "\n", 1), getcwd() . "/.vimspector.json", "b")
endfunction

function debug#Init() abort
  
endfunction
