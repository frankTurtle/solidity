require('@babel/register');
({
    ignore: /node_modules/
});
require('@babel/polyfill');

const HDWalletProvider = require('@truffle/hdwallet-provider');

let mnemonic = 'grace seek surge trip film birth range provide hockey climb surge tooth'; 
let testAccounts = [
"0xad643c003333f8fef652fd461169f978d9edc620493dab98cf6f0f19dc554266",
"0xe031d213f4352a35280d2938e6440fbf86ddc5be35998e04223387be7f1b2984",
"0x61ec322a3ca96838a9ab4d6fbda26a3e16722409429ef7fbd61bb37611f9b0a6",
"0x55c52b1ea648cb772e427913adb3463afa502e4a9a759c3669381011b73d10c7",
"0xefb4bafef2febca69dcc0d0369fe39e7f816e27ad20c71c6c11676c1eb7d60f3",
"0x444521e61d42a2ac259dd5bab1d7d3425350f7becbbad5a28f12bb585f0ae534",
"0xc9c5caa381edb131e9c630bcd59a4ee522c8d7d9728f15401bad42e3b3c2ae04",
"0xbf6b6ac97e52f6ed33eb1ba9968144647b9432f4259d71616be914e74aa2afc9",
"0x903921e0554f565e3e823614a2db9b42aed809a04ef704ecbcd7e7d1cc80226c",
"0xc07f7fda97715551acb5b7f973fd7bcf82e39b9ec2cad2c2494fdac107dbd6fe"
]; 
let devUri = 'https://rpc-mumbai.matic.today';

module.exports = {
    testAccounts,
    mnemonic,
    networks: {
        development: {
            uri: devUri,
            provider: () => new HDWalletProvider(
                mnemonic,
                devUri, // provider url
                0, // address index
                10, // number of addresses
                true, // share nonce
                `m/44'/60'/0'/0/` // wallet HD path
            ),
            gas: 2000000,
            network_id: 80001,
            confirmations: 1,
            timeoutBlocks: 100,
            skipDryRun: true
        }
    },
    compilers: {
        solc: {
            version: '^0.5.11'
        }
    }
};

