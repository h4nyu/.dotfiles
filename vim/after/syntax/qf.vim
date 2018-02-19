" pytest syntax
highlight FAILED ctermfg=RED cterm=bold ctermbg=None
highlight PASSED ctermfg=GREEN cterm=bold ctermbg=None
highlight SKIPPED ctermfg=YELLOW cterm=bold ctermbg=None
highlight HEADLINE ctermfg=WHITE cterm=bold ctermbg=None

syntax match FAILED "\mFAILED"
syntax match FAILED "\m=\+\sFAILURES\s=\+"
syntax match FAILED "\m=\+\sERRORS\s=\+"
syntax match FAILED "\m_\+\(\s[a-zA-z\/\.]\+\)*\s_\+"
syntax match FAILED "\m=\+\s\d\sfailed\,\s\d*\spassed\sin\s\d*\.\d*\sseconds\s=\+"
syntax match FAILED "\m=\+\s\d\serror\sin\s\d*\.\d*\sseconds\s=\+"
syntax match FAILED "\m!\+\(\s[a-zA-z\/\.\:0-9]*\)*!\+"

syntax match PASSED "\mPASSED"
syntax match PASSED "\m=*\s\d*\spassed\sin\s\d*\.\d*\sseconds\s=*"

syntax match SKIPPED "\mSKIPPED"
syntax match SKIPPED "\m=*\s\d*\spassed\,\s\d*\sskipped\sin\s\d*\.\d*\sseconds\s=*"

syntax match HEADLINE "\m=*\stest session starts\s*=*"
syntax match HEADLINE "\m=\+\sslowest\s\d*\stest\sdurations\s=\+"
syntax match HEADLINE "\mcollecting\s\.\.\.\(\s[a-zA-z\/\.0-9]\+\)*"
