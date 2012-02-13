" ---------------
" OpenURL
" ---------------

if has('ruby')
ruby << EOF
  require 'open-uri'
  require 'openssl'

  def extract_url(url)
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]\{\};:'".,<>?«»“”‘’]))}

    url.match(re).to_s
  end

  def open_url
    line = VIM::Buffer.current.line

    if url = extract_url(line)
      if RUBY_PLATFORM.downcase =~ /(win|mingw)(32|64)/
        `start cmd /c chrome #{url}`
        VIM::message("Opened #{url}")
      else
        `open #{url}`
        VIM::message("Opened #{url}")
      end
    else
      VIM::message("No URL found on this line.")
    end

  end
  # Returns the contents of the <title> tag of a given page
  def fetch_title(url)
    if RUBY_VERSION < '1.9'
      open(url).read.match(/<title>(.*?)<\/title>?/i)[1]
    else
      open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read.match(/<title>(.*?)<\/title>?/i)[1]
    end
  end

  # Paste the title and url for the url on the clipboard in markdown format: [Title](url)
  # Note: Clobbers p register
  def paste_url_and_title
    clipboard = VIM::evaluate('@+')
    url = extract_url(clipboard)
    if url and url.strip != ""
      puts "Fetching title"
      title = fetch_title(url)
      VIM::command "let @p = '[#{title}](#{url})'"
      VIM::command 'normal! "pp'
    else
      VIM::message("Clipboard does not contain URL: '#{clipboard[1..10]}'...")
    end
  end
EOF

" Open a URL
if !exists("*OpenURL")
  function! OpenURL()
    :ruby open_url
  endfunction
endif

command! OpenUrl call OpenURL()
nnoremap <leader>o :call OpenURL()<CR>

" ---------------
" Paste link with Title
" ---------------

" Open a URL
if !exists("*PasteURLTitle")
  function! PasteURLTitle()
    :ruby paste_url_and_title
  endfunction
endif

command! PasteURLTitle call PasteURLTitle()
map <leader>pt :PasteURLTitle<CR>

endif " endif has('ruby')
