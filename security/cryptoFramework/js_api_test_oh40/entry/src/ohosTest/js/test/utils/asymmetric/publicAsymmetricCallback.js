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

import { expect } from "@ohos/hypium";
import * as asyCommon from "../common/publicDoSpec";
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";
import {
    createAsyKeyGenerator,
    createAsyKeyGeneratorBySpec,
    createAsyCipher,
    createAsySign,
    createAsyVerify,
} from "./publicAsymmetricCommon";

async function generateAsyKeyPair(rsaGenerator) {
    var pubKey;
    var priKey;
    return new Promise((resolve, reject) => {
        rsaGenerator.generateKeyPair((err, rsaKeyPair) => {
            if (err) {
                console.error("[Callback]generateSymKey failed. error is " + err);
                reject(err);
            } else {
                pubKey = rsaKeyPair.pubKey;
                let encodedPubKey = pubKey.getEncoded();
                console.log("[Callback]: pubKey.getAlgorithm= " + pubKey.algName);
                console.log("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
                console.log("[Callback]: pubKey.getFormat= " + pubKey.format);
                priKey = rsaKeyPair.priKey;
                let encodedPriKey = priKey.getEncoded();
                console.log("[Callback]: priKey.getAlgorithm= " + priKey.algName);
                console.log("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
                console.log("[Callback]: priKey.getFormat= " + priKey.format);
                resolve(rsaKeyPair);
            }
        });
    });
}

async function convertAsyKey(rsaGenerator, pubKeyDataBlob, priKeyDataBlob) {
    return new Promise((resolve, reject) => {
        rsaGenerator.convertKey(
            pubKeyDataBlob,
            priKeyDataBlob,
            (err, convertKeyPair) => {
                if (err) {
                    console.error("[Callback]convertKey failed. error is " + err);
                    reject(err);
                } else {
                    console.log(
                        "[Callback]convertKey success. convertKeyPair is " + convertKeyPair
                    );
                    resolve(convertKeyPair);
                }
            }
        );
    });
}

async function initCipher(cipherGenerator, mode, key, params) {
    return new Promise((resolve, reject) => {
        cipherGenerator.init(mode, key, params, (err) => {
            if (err) {
                console.error(
                    "[Callback]cipherGenerator init failed. error is " +
                    err +
                    "mode is " +
                    mode
                );
                reject(err);
            } else {
                console.log(
                    "[Callback]cipherGenerator init success! mode is : " + mode
                );
                resolve("init success");
            }
        });
    });
}

async function doFinalCipher(cipherGenerator, mode, dataBlob) {
    return new Promise((resolve, reject) => {
        cipherGenerator.doFinal(dataBlob, (err, finalData) => {
            if (err) {
                console.error(
                    "[Callback]cipherGenerator doFinal failed. error is " +
                    err +
                    "mode is " +
                    mode
                );
                reject(err);
            } else {
                console.log(
                    "[Callback]cipherGenerator doFinal success! mode is : " + mode
                );
                resolve(finalData);
            }
        });
    });
}

async function initSign(signGenerator, priKey) {
    return new Promise((resolve, reject) => {
        signGenerator.init(priKey, (err) => {
            if (err) {
                console.error("[Callback]signGenerator init failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback]signGenerator init success!");
                resolve("init success");
            }
        });
    });
}

async function updateSign(signGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        signGenerator.update(dataBlob, (err) => {
            if (err) {
                console.error("[Callback]signGenerator update failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback]signGenerator update success!");
                resolve("update success");
            }
        });
    });
}

async function signForSign(signGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        signGenerator.sign(dataBlob, (err, signOutput) => {
            if (err) {
                console.error("[Callback]signGenerator sign failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback]signGenerator sign success!");
                resolve(signOutput);
            }
        });
    });
}

async function initVerify(verifyGenerator, pubKey) {
    return new Promise((resolve, reject) => {
        verifyGenerator.init(pubKey, (err) => {
            if (err) {
                console.error("[Callback]verifyGenerator init failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback]verifyGenerator init success!");
                resolve("init success");
            }
        });
    });
}

async function updateVerify(verifyGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        verifyGenerator.update(dataBlob, (err) => {
            if (err) {
                console.error(
                    "[Callback]verifyGenerator update failed. error is " + err
                );
                reject(err);
            } else {
                console.log("[Callback]verifyGenerator update success!");
                resolve("update success");
            }
        });
    });
}

async function verifyForVerify(verifyGenerator, dataBlob, signDataBlob) {
    return new Promise((resolve, reject) => {
        verifyGenerator.verify(dataBlob, signDataBlob, (err, verifyOutput) => {
            if (err) {
                console.error("[Callback]signGenerator sign failed. error is " + err);
                reject(err);
            } else {
                console.error(
                    "[Callback]signGenerator sign success is  " + verifyOutput
                );
                resolve(verifyOutput);
            }
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
                    "[Callback] encryptAndDecryptNormalProcess encryptMode initOut:" +
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
                    "[Callback] encryptAndDecryptNormalProcess decryptMode initOut:" +
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
                }
                resolve(false);
            })
            .catch((err) => {
                console.error(
                    "[Callback] encryptAndDecryptNormalProcess catch err:" + err
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
                    "[Callback] signAndVerifyNormalProcess initSignOut:" + initSignOut
                );
                return updateSign(signGenerator, input);
            })
            .then((updateSignOut) => {
                console.log(
                    "[Callback] signAndVerifyNormalProcess updateSignOut:" + updateSignOut
                );
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                globalSignBlob = finalOutput;
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initVerifyOut) => {
                console.log(
                    "[Callback] signAndVerifyNormalProcess initVerifyOut:" + initVerifyOut
                );
                return updateVerify(verifyGenerator, input);
            })
            .then((updateVerifyOut) => {
                console.log(
                    "[Callback] signAndVerifyNormalProcess updateVerifyOut:" +
                    updateVerifyOut
                );
                return verifyForVerify(verifyGenerator, input, globalSignBlob);
            })
            .then((verifyOutput) => {
                resolve(verifyOutput);
            })
            .catch((err) => {
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
                signGenerator.setSignSpec(itemType, itemValue);
                verifyGenerator.setVerifySpec(itemType, itemValue);
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initSignOut) => {
                console.log(
                    "[Callback] signAndVerifySetAndGetSpecProcess initSignOut:" +
                    initSignOut
                );
                return updateSign(signGenerator, input);
            })
            .then((updateSignOut) => {
                console.log(
                    "[Callback] signAndVerifySetAndGetSpecProcess updateSignOut:" +
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
                    "[Callback] signAndVerifySetAndGetSpecProcess initVerifyOut:" +
                    initVerifyOut
                );
                return updateVerify(verifyGenerator, input);
            })
            .then((updateVerifyOut) => {
                console.log(
                    "[Callback] signAndVerifySetAndGetSpecProcess updateVerifyOut:" +
                    updateVerifyOut
                );
                return verifyForVerify(verifyGenerator, input, globalSignBlob);
            })
            .then((verifyOutput) => {
                let signSpec = signGenerator.getSignSpec(itemType);
                let verifySpec = verifyGenerator.getVerifySpec(itemType);
                if (signSpec != itemValue || verifySpec != itemValue) {
                    resolve(false);
                }
                resolve(verifyOutput);
            })
            .catch((err) => {
                console.error(
                    "[Callback] signAndVerifySetAndGetSpecProcess catch err:" + err
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
                    "[Callback] encryptAndDecryptBySpecProcess encryptMode initCipherOut:" +
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
                    "[Callback] encryptAndDecryptBySpecProcess decryptMode initCipherOut:" +
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
                    "[Callback] encryptAndDecryptBySpecProcess catch err:" + err
                );
                reject(err);
            });
    });
}

async function signAbnormalParameterProcess(
        asyKeySpec,
        signVerifyAlgoName,
        signType
) {
    let globalText = "This is a sign test";
    let input = { data: stringTouInt8Array(globalText) };
    try {
        let specGenerator = createAsyKeyGeneratorBySpec(asyKeySpec);
        let signGenerator = createAsySign(signVerifyAlgoName);
        let keyPair = await specGenerator.generateKeyPair();
        switch (signType) {
            case 1:
                await initSign(signGenerator, keyPair.priKey);
                await updateSign(signGenerator, input);
                await signForSign(signGenerator, "");
                break;
            case 2:
                await initSign(signGenerator, keyPair.priKey);
                await updateSign(signGenerator, input);
                await signForSign(signGenerator, 111);
                break;
            default:
                await signForSign(signGenerator, input);
                break;
        }
    } catch (err) {
        console.error("[Callback] signAbnormalParameterProcess catch err: " + err);
        throw err;
    }
}

async function encryptSetAndGetSpecInitProcess(asyKeyPairSpec, cipherAlgoName) {
    var globalCipherText;
    var globalText = "This is a cipher test";
    var input = { data: stringTouInt8Array(globalText) };
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
    var pSource = new Uint8Array([1, 2, 3, 4]);

    return new Promise((resolve, reject) => {
        let cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
        let cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);

        cipherGeneratorEncrypt.setCipherSpec(
            cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
            pSource
        );
        let retP = cipherGeneratorEncrypt.getCipherSpec(
            cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
        );
        if (retP.toString() != pSource.toString()) {
            console.log("error init pSource" + retP);
        } else {
            console.log("pSource changed ==" + retP);
        }
        initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
            .then((initCipherOut) => {
                console.log(
                    "[Callback] encryptSetAndGetSpecInitProcess encryptMode initCipherOut:" +
                    initCipherOut
                );
                return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
            })
            .then((finalOutput) => {
                globalCipherText = finalOutput;
                cipherGeneratorDecrypt.setCipherSpec(
                    cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
                    pSource
                );
                cipherGeneratorDecrypt.getCipherSpec(
                    cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
                );
                return initCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    asyKeyPairSpec.priKey,
                    null
                );
            })
            .then((initCipherOut) => {
                console.log(
                    "[Callback] encryptSetAndGetSpecInitProcess decryptMode initCipherOut:" +
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
        console.log(
            "[callback]: verifyGenerator.algName : " + verifyGenerator.algName
        );
        let keyPairPromise = specGenerator.generateKeyPair();
        keyPairPromise
            .then((keyPair) => {
                globalRsaKeyPair = keyPair;
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initSignOut) => {
                console.log(
                    "[Callback] signAndVerifyBySpecProcess initSignOut:" + initSignOut
                );
                return updateSign(signGenerator, input);
            })
            .then((updateSignOut) => {
                console.log(
                    "[Callback] signAndVerifyBySpecProcess updateSignOut:" + updateSignOut
                );
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                globalSignBlob = finalOutput;
                console.log(
                    "[callback] signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data)
                );
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initVerifyOut) => {
                console.log(
                    "[Callback] signAndVerifyBySpecProcess initVerifyOut:" + initVerifyOut
                );
                return updateVerify(verifyGenerator, input);
            })
            .then((updateVerifyOut) => {
                console.log(
                    "[Callback] signAndVerifyBySpecProcess updateVerifyOut:" +
                    updateVerifyOut
                );
                let result = verifyForVerify(verifyGenerator, input, globalSignBlob);
                console.log("[callback] verifyForVerify result: " + result);
                resolve(result);
            })
            .catch((err) => {
                reject(err);
            });
    });
}

async function keyGenerationBySpecProcess(asyAlgoName) {
    var sk;
    var pk;
    let generatorBySpec;
    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
        expect(rsaGenerator != null).assertTrue();
        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                let encodedPubKey = rsaKeyPair.pubKey.getEncoded();
                let encodedPriKey = rsaKeyPair.priKey.getEncoded();
                return convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
            })
            .then((convertKeyPair) => {
                let dsap = convertKeyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_P_BN
                );
                let dsaq = convertKeyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_Q_BN
                );
                let dsag = convertKeyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_G_BN
                );
                sk = convertKeyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                );
                pk = convertKeyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                );
                console.log("keyGenerationBySpecProcess sk " + sk);
                console.log("keyGenerationBySpecProcess pk " + pk);
                let commKeySpec = asyCommon.genDsaKeyPairSpec(dsap, dsaq, dsag, sk, pk);
                generatorBySpec = createAsyKeyGeneratorBySpec(commKeySpec);
                return generateAsyKeyPair(generatorBySpec);
            })
            .then((specKeyPair) => {
                let skSpec = specKeyPair.priKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                );
                let pkSpec = specKeyPair.pubKey.getAsyKeySpec(
                    cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                );
                console.log("keyGenerationBySpecProcess skSpec " + skSpec);
                console.log("keyGenerationBySpecProcess pkSpec " + pkSpec);
                if (sk == skSpec && pk == pkSpec) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                reject(err);
            });
    });
}

async function verifyAbnormalParameterProcess(
        asyKeySpec,
        signVerifyAlgoName,
        verifyType
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
        let signBlob = await signForSign(signGenerator, input);
        switch (verifyType) {
            case 1:
                await initVerify(verifyGenerator, keyPair.pubKey);
                await updateVerify(verifyGenerator, input);
                return await verifyForVerify(verifyGenerator, null, signBlob);
            case 2:
                await initVerify(verifyGenerator, keyPair.pubKey);
                await updateVerify(verifyGenerator, input);
                return await verifyForVerify(verifyGenerator, '', signBlob);
            case 3:
                await initVerify(verifyGenerator, keyPair.pubKey);
                await updateVerify(verifyGenerator, input);
                return await verifyForVerify(verifyGenerator, input, null);
            default:
                return await verifyForVerify(verifyGenerator, input, signBlob);
        }
    } catch (err) {
        console.error("[Callback] verifyUpdateAbnormalParameterProcess catch err: " + err);
        throw err;
    }
}

export {
    encryptAndDecryptNormalProcess,
    signAndVerifyNormalProcess,
    encryptSetAndGetSpecInitProcess,
    encryptAndDecryptBySpecProcess,
    signAndVerifyBySpecProcess,
    keyGenerationBySpecProcess,
    signAndVerifySetAndGetSpecProcess,
    signAbnormalParameterProcess,
    verifyAbnormalParameterProcess
};
