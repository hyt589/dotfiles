function JSON#parse(string)
python3 << EOF
import vim
import json

try:
  json_str = vim.eval("a:string")
  json_data = json.loads(json_str)
except Exception as e:
  print(e)
EOF
  return py3eval("json_data")
endfunction

function! JSON#stringify(object)
python3 << EOF
import vim
import json

try:
  obj = vim.eval("a:object")
  json_str = json.dumps(obj, indent=2, sort_keys=True)
except Exception as e:
  print(e)
EOF
  return py3eval("json_str")
endfunction

function! s:throw(string) abort
  let v:errmsg = 'error: '.a:string
  throw v:errmsg
endfunction

function! JSON#formatCurrentBuffer() abort
python3 << EOF
import vim
import json
try:
  buf            = vim.current.buffer
  json_content   = '\n'.join(buf[:])
  content        = json.loads(json_content)
  sorted_content = json.dumps(content, indent = 2, sort_keys = True)
  buf[:]         = sorted_content.split('\n')
except Exception as e:
  print(e)
EOF
endfunction

function JSON#format(json) abort
python3 << EOF
import vim
import json
try:
  json_str      = vim.eval("a:json")
  json_data     = json.loads(json_str)
  json_formated = json.dumps(json_data, indent = 2, sort_keys = False)
except Exception as e:
  print(e)
EOF
  return py3eval("json_formated")
endfunction

function JSON#init() abort
  
endfunction
