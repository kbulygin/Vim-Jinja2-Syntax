" Figure out which type of hilighting to use for html.
fun! s:SelectHTML(ft)
  let n = 1
  while n < 50 && n <= line("$")
    " check for jinja
    if getline(n) =~ '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      execute 'set ft='.a:ft
      return
    endif
    let n = n + 1
  endwhile
endfun
autocmd BufNewFile,BufRead *.html,*.htm,*.nunjucks,*.nunjs,*.njk  call s:SelectHTML('jinja.html')
autocmd BufNewFile,BufRead *.xml  call s:SelectHTML('jinja.xml')
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.tera  set ft=jinja
