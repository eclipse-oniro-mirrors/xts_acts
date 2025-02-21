/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";
import {
    createAsyKeyGenerator,
    createAsyKeyGeneratorBySpec,
    createAsyCipher,
    createAsySign,
    createAsyVerify,
    createAsyKeyAgreement,
} from "./publicAsymmetricCommon";

async function generateAsyKeyPair(rsaGenerator) {
    var pubKey;
    var priKey;
    return new Promise((resolve, reject) => {
        rsaGenerator
            .generateKeyPair()
            .then((rsaKeyPair) => {
                pubKey = rsaKeyPair.pubKey;
                let encodedPubKey = pubKey.getEncoded();
                console.log("encodedPubKey: " + encodedPubKey);
                priKey = rsaKeyPair.priKey;
                let encodedPriKey = priKey.getEncoded();
                console.log("encodedPriKey: " + encodedPriKey);
                resolve(rsaKeyPair);
            })
            .catch((err) => {
                console.error("[Promise]generateSymKey failed. error is " + err);
                reject(err);
            });
    });
}

async function convertAsyKey(rsaGenerator, pubKeyDataBlob, priKeyDataBlob) {
    return new Promise((resolve, reject) => {
        rsaGenerator
            .convertKey(pubKeyDataBlob, priKeyDataBlob)
            .then((convertKeyPair) => {
                console.log(
                    "[Promise]convertKey success. convertKeyPair is " + convertKeyPair
                );
                resolve(convertKeyPair);
            })
            .catch((err) => {
                console.error("[Promise]convertKey failed. error is " + err);
                reject(err);
            });
    });
}

async function initCipher(cipherGenerator, mode, key, params) {
    return new Promise((resolve, reject) => {
        cipherGenerator
            .init(mode, key, params)
            .then(() => {
                console.log("[Promise]cipherGenerator init success! mode is : " + mode);
                resolve("init success");
            })
            .catch((err) => {
                console.error(
                    "[Promise]cipherGenerator init failed. error is " +
                    err +
                    "mode is " +
                    mode
                );
                reject(err);
            });
    });
}

async function doFinalCipher(cipherGenerator, mode, dataBlob) {
    return new Promise((resolve, reject) => {
        cipherGenerator
            .doFinal(dataBlob)
            .then((finalData) => {
                console.log(
                    "[Promise]cipherGenerator doFinal success! mode is : " + mode
                );
                console.log(
                    "[Promise]cipherGenerator doFinal success! dataBlob is : " + dataBlob
                );
                resolve(finalData);
            })
            .catch((err) => {
                console.log(
                    "[Promise]cipherGenerator doFinal faailed dataBlob is : " + dataBlob
                );
                console.error(
                    "[Promise]cipherGenerator doFinal failed. error is " +
                    err +
                    "mode is " +
                    mode
                );
                reject(err);
            });
    });
}

async function initSign(signGenerator, priKey) {
    return new Promise((resolve, reject) => {
        signGenerator
            .init(priKey)
            .then(() => {
                console.log("[Promise]signGenerator init success!");
                resolve("init success");
            })
            .catch((err) => {
                console.error("[Promise]signGenerator init failed. error is " + err);
                reject(err);
            });
    });
}

async function updateSign(signGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        signGenerator
            .update(dataBlob)
            .then(() => {
                console.log("[Promise]signGenerator update success!");
                resolve("update success");
            })
            .catch((err) => {
                console.error("[Promise]signGenerator update failed. error is " + err);
                reject(err);
            });
    });
}

async function signForSign(signGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        signGenerator
            .sign(dataBlob)
            .then((signOutput) => {
                console.log("[Promise]signGenerator sign success!");
                resolve(signOutput);
            })
            .catch((err) => {
                console.error("[Promise]signGenerator sign failed. error is " + err);
                reject(err);
            });
    });
}

async function initVerify(verifyGenerator, pubKey) {
    return new Promise((resolve, reject) => {
        verifyGenerator
            .init(pubKey)
            .then(() => {
                console.log("[Promise]verifyGenerator init success!");
                resolve("init success");
            })
            .catch((err) => {
                console.error("[Promise]verifyGenerator init failed. error is " + err);
                reject(err);
            });
    });
}

async function updateVerify(verifyGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        verifyGenerator
            .update(dataBlob)
            .then(() => {
                console.log("[Promise]verifyGenerator update success!");
                resolve("update success");
            })
            .catch((err) => {
                console.error(
                    "[Promise]verifyGenerator update failed. error is " + err
                );
                reject(err);
            });
    });
}

async function verifyForVerify(verifyGenerator, dataBlob, signDataBlob) {
    return new Promise((resolve, reject) => {
        verifyGenerator
            .verify(dataBlob, signDataBlob)
            .then((verifyOutput) => {
                console.log("[Promise]signGenerator sign success!");
                resolve(verifyOutput);
            })
            .catch((err) => {
                console.error("[Promise]signGenerator sign failed. error is " + err);
                reject(err);
            });
    });
}

async function generateAsySecret(generator, priKey, pubKey) {
    return new Promise((resolve, reject) => {
        generator
            .generateSecret(priKey, pubKey)
            .then((output) => {
                console.log("[Promise]generateSecret success!");
                resolve(output);
            })
            .catch((err) => {
                console.error("[Promise]generateSecret failed. error is " + err);
                reject(err);
            });
    });
}

async function encryptAndDecryptNormalProcess(asyAlgoName, cipherAlgoName) {
    var globalCipherText;
    var globalRsaKeyPair;
    var globalText = "This is a cipher test";
    var input = { data: stringTouInt8Array(globalText) };
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
        var cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
        var cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);

        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                globalRsaKeyPair = rsaKeyPair;
                return initCipher(
                    cipherGeneratorEncrypt,
                    encryptMode,
                    globalRsaKeyPair.pubKey,
                    null
                );
            })
            .then((initCipherOut) => {
                console.log(
                    "[promise] encryptAndDecryptNormalProcess encryptMode initCipherOut:" +
                    initCipherOut
                );
                return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
            })
            .then((finalOutput) => {
                globalCipherText = finalOutput;
                return initCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    globalRsaKeyPair.priKey,
                    null
                );
            })
            .then((initCipherOut) => {
                console.log(
                    "[promise] encryptAndDecryptNormalProcess decryptMode initCipherOut:" +
                    initCipherOut
                );
                return doFinalCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    globalCipherText
                );
            })
            .then((finalOutput) => {
                let decryptData = uInt8ArrayToString(finalOutput.data);
                if (decryptData == globalText) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error(
                    "[promise] encryptAndDecryptNormalProcess catch err:" + err
                );
                reject(err);
            });
    });
}

async function signAndVerifyNormalProcess(asyAlgoName, signVerifyAlgoName) {
    var globalRsaKeyPair;
    var globalSignBlob;
    var globalText = "This is a sign test";
    var input = { data: stringTouInt8Array(globalText) };

    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
        var signGenerator = createAsySign(signVerifyAlgoName);
        var verifyGenerator = createAsyVerify(signVerifyAlgoName);
        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                globalRsaKeyPair = rsaKeyPair;
                let encodedPubKey = rsaKeyPair.pubKey.getEncoded();
                let encodedPriKey = rsaKeyPair.priKey.getEncoded();
                convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initSignOut) => {
                console.log(
                    "[promise] signAndVerifyNormalProcess initSignOut:" + initSignOut
                );
                return updateSign(signGenerator, input);
            })
            .then((updateSignOut) => {
                console.log(
                    "[promise] signAndVerifyNormalProcess updateSignOut:" + updateSignOut
                );
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                globalSignBlob = finalOutput;
                console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data));
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initVerifyOut) => {
                console.log(
                    "[promise] signAndVerifyNormalProcess updateSignOut:" + initVerifyOut
                );
                return updateVerify(verifyGenerator, input);
            })
            .then((updateVerifyOut) => {
                console.log(
                    "[promise] signAndVerifyNormalProcess updateVerifyOut:" +
                    updateVerifyOut
                );
                let result = verifyForVerify(verifyGenerator, input, globalSignBlob);
                resolve(result);
            })
            .catch((err) => {
                console.error("[promise] signAndVerifyNormalProcess catch err:" + err);
                reject(err);
            });
    });
}

async function keyAgreementProcess(ECDHAlgoName) {
    var globalKeyPair;

    return new Promise((resolve, reject) => {
        var eccGenerator = createAsyKeyGenerator("ECC521");
        var globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
        if (globalECDHData.code != null) {
            reject(globalECDHData);
        }
        generateAsyKeyPair(eccGenerator)
            .then((keyPair) => {
                globalKeyPair = keyPair;
                return generateAsySecret(
                    globalECDHData,
                    globalKeyPair.priKey,
                    globalKeyPair.pubKey
                );
            })
            .then((result) => {
                console.warn("result data is " + uInt8ArrayToShowStr(result.data));
                if (result != null) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error("[promise] keyAgreementProcess catch err.code:" + err);
                reject(err);
            });
    });
}

async function keyAgreementGetAlgNameProcess(ECDHAlgoName) {
    var globalRsaKeyPair;

    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(ECDHAlgoName);
        var globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                globalRsaKeyPair = rsaKeyPair;
                return generateAsySecret(
                    globalECDHData,
                    globalRsaKeyPair.priKey,
                    globalRsaKeyPair.pubKey
                );
            })
            .then((result) => {
                console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
                console.log("[Promise]: globalECDHData.algName 1: " + ECDHAlgoName);
                console.log(
                    "[Promise]: globalECDHData.algName 2: " + globalECDHData.algName
                );
                resolve();
            })
            .catch((err) => {
                console.error("[promise] keyAgreementProcess catch err:" + err);
                reject(err);
            });
    });
}

async function keyAgreementBySpecProcess(asyKeySpec, ECDHAlgoName) {
    var globalKeyPair;

    return new Promise((resolve, reject) => {
        let specGenerator = createAsyKeyGeneratorBySpec(asyKeySpec);
        let globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
        let keyPairPromise = specGenerator.generateKeyPair();
        keyPairPromise
            .then((keyPair) => {
                globalKeyPair = keyPair;
                return generateAsySecret(
                    globalECDHData,
                    globalKeyPair.priKey,
                    globalKeyPair.pubKey
                );
            })
            .then((result) => {
                if (result.data != null) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error(
                    "[promise] keyAgreementBySpecProcess catch err:" + err.code
                );
                reject(err);
            });
    });
}

async function encryptAndDecryptBySpecProcess(asyKeyPairSpec, cipherAlgoName) {
    var globalCipherText;
    var globalText = "This is a cipher test";
    var input = { data: stringTouInt8Array(globalText) };
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

    return new Promise((resolve, reject) => {
        let cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
        let cipherGeneratorDncrypt = createAsyCipher(cipherAlgoName);
        initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
            .then((initCipherOut) => {
                console.log(
                    "[promise] encryptAndDecryptBySpecProcess encryptMode initCipherOut:" +
                    initCipherOut
                );
                return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
            })
            .then((finalOutput) => {
                globalCipherText = finalOutput;
                return initCipher(
                    cipherGeneratorDncrypt,
                    decryptMode,
                    asyKeyPairSpec.priKey,
                    null
                );
            })
            .then((initCipherOut) => {
                console.log(
                    "[promise] encryptAndDecryptBySpecProcess decryptMode initCipherOut:" +
                    initCipherOut
                );
                return doFinalCipher(
                    cipherGeneratorDncrypt,
                    decryptMode,
                    globalCipherText
                );
            })
            .then((finalOutput) => {
                let decryptData = uInt8ArrayToString(finalOutput.data);
                if (decryptData == globalText) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error(
                    "[promise] encryptAndDecryptBySpecProcess catch err:" + err
                );
                reject(err);
            });
    });
}

async function encryptInitSetAndGetSpecProcess(asyKeyPairSpec, cipherAlgoName) {
    var globalCipherText;
    var globalText = "This is a cipher test";
    var input = { data: stringTouInt8Array(globalText) };
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
    var pSource = new Uint8Array([1, 2, 3, 4]);
    return new Promise((resolve, reject) => {
        var cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
        let cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);
        initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
            .then((initCipherOut) => {
                console.log(
                    "[promise] encryptInitSetAndGetSpecProcess encryptMode initCipherOut:" +
                    initCipherOut
                );
                cipherGeneratorEncrypt.setCipherSpec(
                    cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
                    pSource
                );
                cipherGeneratorEncrypt.getCipherSpec(
                    cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
                );
                return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
            })
            .then((finalOutput) => {
                globalCipherText = finalOutput;
                return initCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    asyKeyPairSpec.priKey,
                    null
                );
            })
            .then((initCipherOut) => {
                console.log(
                    "[promise] encryptInitSetAndGetSpecProcess decryptMode initCipherOut:" +
                    initCipherOut
                );
                cipherGeneratorDecrypt.setCipherSpec(
                    cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
                    pSource
                );
                cipherGeneratorDecrypt.getCipherSpec(
                    cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
                );
                return doFinalCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    globalCipherText
                );
            })
            .then((finalOutput) => {
                let decryptData = uInt8ArrayToString(finalOutput.data);
                if (decryptData == globalText) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error(
                    "[promise] encryptInitSetAndGetSpecProcess catch err:" + err
                );
                reject(err);
            });
    });
}

async function signAndVerifyBySpecProcess(asyKeySpec, signVerifyAlgoName) {
    var globalRsaKeyPair;
    var globalSignBlob;
    var globalText = "This is a sign test";
    var input = { data: stringTouInt8Array(globalText) };
    return new Promise((resolve, reject) => {
        let specGenerator = createAsyKeyGeneratorBySpec(asyKeySpec);
        let signGenerator = createAsySign(signVerifyAlgoName);
        let verifyGenerator = createAsyVerify(signVerifyAlgoName);
        let keyPairPromise = specGenerator.generateKeyPair();
        keyPairPromise
            .then((keyPair) => {
                globalRsaKeyPair = keyPair;
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initSignOut) => {
                console.log(
                    "[promise] signAndVerifyBySpecProcess initSignOut:" + initSignOut
                );
                return updateSign(signGenerator, input);
            })
            .then((updateSignOut) => {
                console.log(
                    "[promise] signAndVerifyBySpecProcess updateSignOut:" + updateSignOut
                );
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                globalSignBlob = finalOutput;
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initVerifyOut) => {
                console.log(
                    "[promise] signAndVerifyBySpecProcess initVerifyOut:" + initVerifyOut
                );
                return updateVerify(verifyGenerator, input);
            })
            .then((updateVerifyOut) => {
                console.log(
                    "[promise] signAndVerifyBySpecProcess updateVerifyOut:" +
                    updateVerifyOut
                );
                resolve(verifyForVerify(verifyGenerator, input, globalSignBlob));
            })
            .catch((err) => {
                console.error("[promise] signAndVerifyBySpecProcess catch err:" + err);
                reject(err);
            });
    });
}

async function signAndVerifySetAndGetSpecProcess(
        asyKeySpec,
        signVerifyAlgoName,
        itemType,
        itemValue
) {
    var globalRsaKeyPair;
    var globalSignBlob;
    var globalText = "This is a sign test";
    var input = { data: stringTouInt8Array(globalText) };
    return new Promise((resolve, reject) => {
        let specGenerator = createAsyKeyGeneratorBySpec(asyKeySpec);
        let signGenerator = createAsySign(signVerifyAlgoName);
        let verifyGenerator = createAsyVerify(signVerifyAlgoName);
        let keyPairPromise = specGenerator.generateKeyPair();
        keyPairPromise
            .then((keyPair) => {
                globalRsaKeyPair = keyPair;
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initSignOut) => {
                console.log(
                    "[promise] signAndVerifySetAndGetSpecProcess initSignOut:" +
                    initSignOut
                );
                signGenerator.setSignSpec(itemType, itemValue);
                verifyGenerator.setVerifySpec(itemType, itemValue);
                return updateSign(signGenerator, input);
            })
            .then((updateSignOut) => {
                console.log(
                    "[promise] signAndVerifySetAndGetSpecProcess updateSignOut:" +
                    updateSignOut
                );
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                globalSignBlob = finalOutput;
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initVerifyOut) => {
                console.log(
                    "[promise] signAndVerifySetAndGetSpecProcess initVerifyOut:" +
                    initVerifyOut
                );
                return updateVerify(verifyGenerator, input);
            })
            .then((updateVerifyOut) => {
                console.log(
                    "[promise] signAndVerifySetAndGetSpecProcess updateVerifyOut:" +
                    updateVerifyOut
                );
                return verifyForVerify(verifyGenerator, input, globalSignBlob);
            })
            .then((finalStatus) => {
                console.log(
                    "[promise] signAndVerifySetAndGetSpecProcess finalStatus:" +
                    finalStatus
                );
                let signSpec = signGenerator.getSignSpec(itemType);
                let verifySpec = verifyGenerator.getVerifySpec(itemType);
                if (verifySpec == itemValue && signSpec == itemValue) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error(
                    "[promise] signAndVerifySetAndGetSpecProcess catch err:" + err
                );
                reject(err);
            });
    });
}

async function updateAbnormalParameterProcess(
        asyKeySpec,
        signVerifyAlgoName,
        updateType
) {
    let globalText = "This is a sign test";
    let input = { data: stringTouInt8Array(globalText) };
    try {
        let specGenerator = createAsyKeyGeneratorBySpec(asyKeySpec);
        let signGenerator = createAsySign(signVerifyAlgoName);
        let keyPair = await specGenerator.generateKeyPair();
        switch (updateType) {
            case 1:
                await initSign(signGenerator, keyPair.priKey);
                await updateSign(signGenerator, null);
                break;
            case 2:
                await initSign(signGenerator, keyPair.priKey);
                await updateSign(signGenerator, '');
                break;
            case 3:
                await initSign(signGenerator, keyPair.priKey);
                await updateSign(signGenerator, 222);
                break;
            default:
                await updateSign(signGenerator, input);
                break;
        }
    } catch (err) {
        console.error("[Promise] updateAbnormalParameterProcess catch err: " + err);
        throw err;
    }
}

async function verifyUpdateAbnormalParameterProcess(
        asyKeySpec,
        signVerifyAlgoName,
        updateType
) {
    let globalText = "This is a sign test";
    let input = { data: stringTouInt8Array(globalText) };
    try {
        let specGenerator = createAsyKeyGeneratorBySpec(asyKeySpec);
        let signGenerator = createAsySign(signVerifyAlgoName);
        let verifyGenerator = createAsyVerify(signVerifyAlgoName);
        let keyPair = await specGenerator.generateKeyPair();
        await initSign(signGenerator, keyPair.priKey);
        await updateSign(signGenerator, input);
        await signForSign(signGenerator, input);
        switch (updateType) {
            case 1:
                await initVerify(verifyGenerator, keyPair.pubKey);
                await updateVerify(verifyGenerator, null);
                break;
            case 2:
                await initVerify(verifyGenerator, keyPair.pubKey);
                await updateVerify(verifyGenerator, '');
                break;
            case 3:
                await initVerify(verifyGenerator, keyPair.pubKey);
                await updateVerify(verifyGenerator, 222);
                break;
            default:
                await updateVerify(verifyGenerator, input);
                break;
        }
    } catch (err) {
        console.error("[Promise] verifyUpdateAbnormalParameterProcess catch err: " + err);
        throw err;
    }
}

async function generateSpecKeyPair(asyKeySpec) {
    return new Promise((resolve, reject) => {
        asyKeySpec
            .generateKeyPair()
            .then((asyKeyPair) => {
                console.info("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
                resolve(asyKeyPair);
            })
            .catch((err) => {
                console.error(
                    "[Promise] generateSpecAsyKeyPair failed. error is " + err
                );
                reject(err);
            });
    });
}

async function keyGenerationBySpecProcess(asyKeySpec) {
    var pubkey;
    var prikey;
    return new Promise((resolve, reject) => {
        var specGenerator = cryptoFramework.createAsyKeyGeneratorBySpec(asyKeySpec);
        generateSpecKeyPair(specGenerator)
            .then((keypair) => {
                let pubEncoded = keypair.pubKey.getEncoded();
                let priEncoded = keypair.priKey.getEncoded();
                pubkey = keypair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                );
                prikey = keypair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                );
                console.log("keyGenerationBySpecProcess keypair.pubKey " + pubkey);
                console.log("keyGenerationBySpecProcess keypair.priKey " + prikey);
                let rsaGenerator = createAsyKeyGenerator("DSA2048");
                return convertAsyKey(rsaGenerator, pubEncoded, priEncoded);
            })
            .then((conKeyPair) => {
                let conPrikey = conKeyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                );
                let conPubkey = conKeyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                );
                if (pubkey == conPubkey && prikey == conPrikey) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error("[promise] keyGenerationBySpecProcess catch err:" + err);
                reject(err);
            });
    });
}

export {
    encryptAndDecryptNormalProcess,
    signAndVerifyNormalProcess,
    keyAgreementProcess,
    keyAgreementGetAlgNameProcess,
    encryptAndDecryptBySpecProcess,
    keyAgreementBySpecProcess,
    encryptInitSetAndGetSpecProcess,
    signAndVerifyBySpecProcess,
    signAndVerifySetAndGetSpecProcess,
    updateAbnormalParameterProcess,
    verifyUpdateAbnormalParameterProcess,
    keyGenerationBySpecProcess
};
