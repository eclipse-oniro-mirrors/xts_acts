/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";
import {
    createAsyKeyGenerator,
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
                console.log("[Promise]: pubKey.getAlgorithm= " + pubKey.algName);
                console.log("[Promise]: pubKey.getEncoded= " + encodedPubKey.data);
                console.log("[Promise]: pubKey.getFormat= " + pubKey.format);
                priKey = rsaKeyPair.priKey;
                let encodedPriKey = priKey.getEncoded();
                console.log("[Promise]: priKey.getAlgorithm= " + priKey.algName);
                console.log("[Promise]: priKey.getEncoded= " + encodedPriKey.data);
                console.log("[Promise]: priKey.getFormat= " + priKey.format);
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
                resolve(finalData);
            })
            .catch((err) => {
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
        expect(rsaGenerator != null).assertTrue();
        var cipherGeneratorEncrypt = createAsyCipher(cipherAlgoName);
        expect(cipherGeneratorEncrypt != null).assertTrue();
        var cipherGeneratorDecrypt = createAsyCipher(cipherAlgoName);
        expect(cipherGeneratorDecrypt != null).assertTrue();

        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                expect(rsaKeyPair != null).assertTrue();
                globalRsaKeyPair = rsaKeyPair;
                return initCipher(
                    cipherGeneratorEncrypt,
                    encryptMode,
                    globalRsaKeyPair.pubKey,
                    null
                );
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
            })
            .then((finalOutput) => {
                expect(finalOutput != null).assertTrue();
                globalCipherText = finalOutput;
                console.log(
                    "cipherOutput: " + uInt8ArrayToShowStr(globalCipherText.data)
                );
                return initCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    globalRsaKeyPair.priKey,
                    null
                );
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                return doFinalCipher(
                    cipherGeneratorDecrypt,
                    decryptMode,
                    globalCipherText
                );
            })
            .then((finalOutput) => {
                if (finalOutput == null) {
                    console.error("[promise]decrypt doFinal out is null");
                } else {
                    console.log(
                        "[promise]decrypt doFinal out hex: " +
                        uInt8ArrayToShowStr(finalOutput.data)
                    );
                }
                let decryptData = uInt8ArrayToString(finalOutput.data);
                expect(decryptData == globalText).assertTrue();
                resolve();
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
        expect(rsaGenerator != null).assertTrue();
        var signGenerator = createAsySign(signVerifyAlgoName);
        expect(signGenerator != null).assertTrue();
        var verifyGenerator = createAsyVerify(signVerifyAlgoName);
        expect(verifyGenerator != null).assertTrue();

        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                expect(rsaKeyPair != null).assertTrue();
                globalRsaKeyPair = rsaKeyPair;
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                return updateSign(signGenerator, input);
            })
            .then((updateData) => {
                expect(updateData === "update success").assertTrue();
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                expect(finalOutput != null).assertTrue();
                globalSignBlob = finalOutput;
                console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data));
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                return updateVerify(verifyGenerator, input);
            })
            .then((updateData) => {
                expect(updateData === "update success").assertTrue();
                return verifyForVerify(verifyGenerator, input, globalSignBlob);
            })
            .then((finalStatus) => {
                expect(finalStatus).assertTrue();
                resolve();
            })
            .catch((err) => {
                console.error("[promise] signAndVerifyNormalProcess catch err:" + err);
                reject(err);
            });
    });
}

async function signAndVerifyNormalProcessDataException(asyAlgoName, signVerifyAlgoName, dataType) {
    var globalRsaKeyPair;
    var globalSignBlob;
    var globalText = "This is a sign test";
    var input;
    if (dataType == "null") {
        input = null;
    } else {
        input = { data: stringTouInt8Array(globalText) };
    }
    ;

    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
        var signGenerator = createAsySign(signVerifyAlgoName);
        var verifyGenerator = createAsyVerify(signVerifyAlgoName);
        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                globalRsaKeyPair = rsaKeyPair;
                return initSign(signGenerator, globalRsaKeyPair.priKey);
            })
            .then((initData) => {
                return updateSign(signGenerator, input);
            })
            .then((updateData) => {
                return signForSign(signGenerator, input);
            })
            .then((finalOutput) => {
                globalSignBlob = finalOutput;
                console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data));
                return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
            })
            .then((initData) => {
                return updateVerify(verifyGenerator, input);
            })
            .then((updateData) => {
                return verifyForVerify(verifyGenerator, input, globalSignBlob);
            })
            .then((finalStatus) => {
                if (dataType == "null") {
                    reject();
                } else {
                    resolve();
                }
            })
            .catch((err) => {
                console.error("[promise] signAndVerifyNormalProcess catch err code:" + err.code);
                if (dataType == "null") {
                    resolve(err.code);
                } else {
                    reject(err);
                }
            });
    });
}

async function convertKeyEncryptAndDecryptProcess(asyAlgoName) {
    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
        expect(rsaGenerator != null).assertTrue();

        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                expect(rsaKeyPair != null).assertTrue();
                let encodedPubKey = rsaKeyPair.pubKey.getEncoded();
                let encodedPriKey = rsaKeyPair.priKey.getEncoded();
                return convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
            })
            .then((convertKeyPair) => {
                expect(convertKeyPair != null).assertTrue();
                let encodedConvertPubKey = convertKeyPair.pubKey.getEncoded();
                console.warn(
                    "[Promise]: pubKey.getAlgorithm= " + convertKeyPair.pubKey.algName
                );
                console.warn(
                    "[Promise]: pubKey.getEncoded= " + encodedConvertPubKey.data
                );
                console.warn(
                    "[Promise]: pubKey.getFormat= " + convertKeyPair.pubKey.format
                );
                let encodedConvertPriKey = convertKeyPair.priKey.getEncoded();
                console.warn(
                    "[Promise]: priKey.getAlgorithm= " + convertKeyPair.priKey.algName
                );
                console.warn(
                    "[Promise]: priKey.getEncoded= " + encodedConvertPriKey.data
                );
                console.warn(
                    "[Promise]: priKey.getFormat= " + convertKeyPair.priKey.format
                );
                resolve();
            })
            .catch((err) => {
                console.error(
                    "[promise] convertKeyEncryptAndDecryptProcess catch err:" + err
                );
                reject(err);
            });
    });
}

async function keyAgreementProcess(ECDHAlgoName) {
    var globalRsaKeyPair;

    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(ECDHAlgoName);
        expect(rsaGenerator != null).assertTrue();
        var globalECDHData = createAsyKeyAgreement(ECDHAlgoName);
        expect(globalECDHData != null).assertTrue();

        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                expect(rsaKeyPair != null).assertTrue();
                globalRsaKeyPair = rsaKeyPair;
                return generateAsySecret(globalECDHData, globalRsaKeyPair.priKey, globalRsaKeyPair.pubKey);
            })
            .then((result) => {
                console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
                expect(result != null).assertTrue();
                resolve();
            })
            .catch((err) => {
                console.error("[promise] keyAgreementProcess catch err:" + err);
                reject(err);
            });
    });
}

async function AsyPriKeyClearProcess(asyAlgoName) {
    return new Promise((resolve, reject) => {
        var rsaGenerator = createAsyKeyGenerator(asyAlgoName);
        expect(rsaGenerator != null).assertTrue();

        generateAsyKeyPair(rsaGenerator)
            .then((rsaKeyPair) => {
                expect(rsaKeyPair != null).assertTrue();
                let result = rsaKeyPair.priKey.clearMem();
                console.log("result is: " + result);
                expect(result == undefined).assertTrue();
                resolve();
            })
            .catch((err) => {
                console.error("[promise] AsyPriKeyClearProcess catch err:" + err);
                reject(err);
            });
    });
}

export {
    encryptAndDecryptNormalProcess,
    signAndVerifyNormalProcess,
    convertKeyEncryptAndDecryptProcess,
    keyAgreementProcess,
    AsyPriKeyClearProcess,
    signAndVerifyNormalProcessDataException
};
