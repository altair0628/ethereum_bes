cd ~/bes


echo "1/2.Downloading go-ethereum...."
git clone -b release/1.8 https://github.com/ethereum/go-ethereum.git

cd go-ethereum/
git checkout -b v1.8.17


sed -i "" 's/CalcDifficulty(chain.Config(), time, parent)/big.NewInt(1)/g' ~/bes/go-ethereum/consensus/ethash/consensus.go


echo "2/2.Compile go-ethereum...."
make geth


~/bes/go-ethereum/build/bin/geth version


