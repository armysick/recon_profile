# ------Instructions---------
# Install (and configure) subfinder, assetfinder, and httprobe
# go get -v github.com/projectdiscovery/subfinder/cmd/subfinder && go get -v github.com/tomnomnom/httprobe && go get -v github.com/tomnomnom/assetfinder
# cat firefox.sh >> ~/.bashrc 
# source ~/.bashrc 
# Usage - subf_ff target.tld
#         asset_ff target.tld

subf_ff () {
subfinder -d $1 -silent -t 100 | httprobe -c 50 | sort -u | while read line; do firefox $line; sleep 10; done
}

asset_ff () {
assetfinder -subs-only $1 | httprobe -c 50 | sort -u | while read line; do firefox $line; sleep 10; done
}
