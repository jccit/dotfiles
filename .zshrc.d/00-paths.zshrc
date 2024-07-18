export PATH=/usr/local/bin/:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:./node_modules/.bin

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=/opt/homebrew/bin:$PATH
fi