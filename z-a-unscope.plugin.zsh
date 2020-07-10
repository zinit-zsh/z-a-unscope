# -*- mode: sh; sh-indentation: 4; sh-basic-offset: 4; -*-

# Copyright (c) 2020 Sebastian Gniazdowski
# License MIT

# Get $0 according to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -gA Zinit_Annex_Unscope
Zinit_Annex_Unscope[0]="$0" Zinit_Annex_Unscope[repo-dir]="${0:h}"

autoload -Uz ∧za-unscope-before-load-handler \
    ∧za-unscope-scope-cmd-help-handler \
    ∧za-unscope-scope-cmd \
    .za-scope-dynamic \
    .za-unscope-list-mappings

# An empty stub to fill the help handler fields
∧za-unscope-help-null-handler() { :; }

# The unscoping-support hook.
@zinit-register-annex "z-a-unscope" \
    hook:before-load-5 \
    ∧za-unscope-before-load-handler \
    ∧za-unscope-help-null-handler \
    "dynamic-unscope''" # New ices

# The subcommand `scope'.
@zinit-register-annex "z-a-unscope" \
    subcommand:scope \
    ∧za-unscope-scope-cmd \
    ∧za-unscope-scope-cmd-help-handler

# The hash that holds mappings of the unscoped plugin names to the
# scoped ones, and also the nick-names that map to the same, however
# are different in that they're not just stripped GitHub user name
# (i.e.: unscoped), but free in general names.

typeset -gA Zinit_Annex_Unscope_Mappings

Zinit_Annex_Unscope_Mappings=(
    # zdharma/null
    "1.   null"				"zdharma/null 0"

    # z-a-as-monitor
    "2.   as-monitor"			"zinit-zsh/z-a-as-monitor 0"
    "3.   monitor"			"zinit-zsh/z-a-as-monitor 0"
                                         
    # z-a-patch-dl                     
    "4.   patch-dl"			"zinit-zsh/z-a-patch-dl 0"
                                         
    # z-a-rust                         
    "5.   rust"				"zinit-zsh/z-a-rust 0"
                                         
    # z-a-bin-gem-node                 
    "6.   bin-gem-node"			"zinit-zsh/z-a-bin-gem-node 0"
    "7.   bgn"				"zinit-zsh/z-a-bin-gem-node 0"
                                
    # Prezto archive
    "8.   archive"			"PZTM::archive 1"
    "9.   arch"				"PZTM::archive 1"

    # Prezto directory
    "10.  directory"			"PZTM::directory 1"
    "11.  dir"				"PZTM::directory 1"

    # Prezto environment
    "12.  environment"			"PZTM::environment 1"
    "13.  env"				"PZTM::environment 1"

    # Prezto utility
    "14.  utility"			"PZTM::utility 1"
    "15.  util"				"PZTM::utility 1"

    # fast-syntax-highlighting  
    "16.  f-sy-h"		        "zdharma/fast-syntax-highlighting 0"
    "17.  fsh"				"zdharma/fast-syntax-highlighting 0"

    # history-search-multi-word
    "18.  hsmw"				"zdharma/history-search-multi-word 0"

    # ZUI
    "19.  zui"				"zdharma/zui 0"
    "20.  ZUI"				"zdharma/zui 0"

    # Zconvey
    "21.  zconv"			"zdharma/zconvey 0"

    # Zbrowse
    "22.  zbrowse"			"zdharma/zbrowse 0"

    # zsh-autosuggestions
    "23.  autosuggestions"		"zsh-users/zsh-autosuggestions 0"
    "24.  autosug"			"zsh-users/zsh-autosuggestions 0"

    # zsh-syntax-highlighting  
    "25.  z-sy-h"		        "zsh-users/zsh-syntax-highlighting 0"

)

# vim:ft=zsh:tw=80:sw=4:sts=4:noet
