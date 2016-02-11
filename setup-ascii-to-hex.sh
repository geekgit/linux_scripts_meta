#!/bin/bash
git clone https://github.com/geekgit/AsciiToHex
cd AsciiToHex
chmod +x gen-csharp-code.sh
./gen-csharp-code.sh > ascii-to-hex.cs
mono-csc /define:RELEASE /optimize /out:ascii-to-hex ascii-to-hex.cs
sudo chmod a+rx-w ascii-to-hex
sudo mv ascii-to-hex /usr/local/bin
cd ..
rm -rf AsciiToHex
