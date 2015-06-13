function ppgrep() {
	if [[ $1 == "" ]]; then
		PECO=peco
	else
		PECO="peco --query $1"
	fi
	ps aux | eval $PECO | awk '{ print $2 }'
}

function ppkill() {
	if [[ $1 =~ "^-" ]]; then
		QUERY=""            # options only
	else
		QUERY=$1            # with a query
		[[ $# > 0 ]] && shift
	fi
	ppgrep $QUERY | xargs kill $*
}

function exists { which $1 &> /dev/null }

if exists peco; then
	function peco_select_history() {
		local tac
		exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
		BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
		CURSOR=$#BUFFER         # move cursor
		zle -R -c               # refresh
	}

	zle -N peco_select_history
	bindkey '^R' peco_select_history

	function peco-src () {
		local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
		if [ -n "$selected_dir" ]; then
			BUFFER="cd ${selected_dir}"
			zle accept-line
		fi
		zle clear-screen
	}
	zle -N peco-src
	bindkey '^]' peco-src
fi

