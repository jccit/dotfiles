# Edit files inside .zshrc.d, it's much neater

for file in ~/.zshrc.d/*.zshrc;
do
	source $file
done

if [[ "$OSTYPE" == "darwin"* ]]; then
	for file in ~/.zshrc.d/mac/*.zshrc;
	do
		source $file
	done
else
        for file in ~/.zshrc.d/linux/*.zshrc;
        do
                source $file
        done
fi
