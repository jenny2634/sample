const fs = require('fs')
const API = artifacts.require('./API.sol')//additopngame불러옴
module.exports = function (deployer) {
    deployer.deploy(API)//배포함
        .then(() => {//then 비동기 처리할때 콜백처리
            if (API._json) {
                fs.writeFile(//nodejs에서 제공되는 기능 
                    'deployedABI', JSON.stringify(API._json.abi),
                    (err) => {
                        if (err) throw err;
                        console.log(' 파일에 ABI 입력 성공 ');
                    }
                );
                fs.writeFile(
                    'deployedAddress', API.address,
                    (err) => {
                        if (err) throw err;
                        console.log(' 파일에 주소 입력 성공 ');
                    }
                );
            }
        });
}