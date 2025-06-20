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
import cryptoFramework from "@ohos.security.cryptoFramework";
import {
    stringTouInt8Array,
    uInt8ArrayToShowStr,
    uInt8ArrayToString,
    genGcmParamsSpec,
    genIvParamsSpec,
    genCcmParamsSpec,
} from "../common/publicDoString";

import { createSymKeyGenerator, createSymCipher, } from "./publicSymmetricCommon";

function createGlobalParams(symAlgoName, paramType) {
    let params;
    try {
        if (paramType == "genIvParamsSpec") {
            if (symAlgoName.includes("AES")) {
                params = genIvParamsSpec(16);
            } else if (symAlgoName.includes("3DES")) {
                params = genIvParamsSpec(8);
            } else {
                throw "[error]invalid symAlgoName!";
            }
        } else if (paramType == "genGcmParamsSpec") {
            params = genGcmParamsSpec();
        } else if (paramType == "genCcmParamsSpec") {
            params = genCcmParamsSpec();
        } else if (paramType == "null") {
            params = null;
        } else {
            throw "[error]invalid paramType!";
        }
        return params;
    } catch (err) {
        throw  err;
    }
}

async function generateSymKey(symKeyGenerator) {
    return new Promise((resolve, reject) => {
        symKeyGenerator.generateSymKey((err, symKey) => {
            if (err) {
                console.error("[Callback]generateSymKey failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback]generateSymKey success. symKey is " + symKey);
                console.warn("[Callback]key algName:" + symKey.algName);
                console.warn("[Callback]key format:" + symKey.format);
                var encodeKey = symKey.getEncoded();
                console.warn(
                    "[Callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data)
                );
                resolve(symKey);
            }
        });
    });
}

async function convertSymKey(symKeyGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        symKeyGenerator.convertKey(dataBlob, (err, symKey) => {
            if (err) {
                console.error("[Callback]convertKey failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback]convertKey success. symKey is " + symKey);
                resolve(symKey);
            }
        });
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

async function updateCipher(cipherGenerator, mode, plainText) {
    return new Promise((resolve, reject) => {
        cipherGenerator.update(plainText, (err, updateData) => {
            if (err) {
                console.error(
                    "[Callback]cipherGenerator update failed. error is " +
                    err +
                    "mode is " +
                    mode
                );
                reject(err);
            } else {
                console.log(
                    "[Callback]cipherGenerator update success! mode is : " + mode
                );
                resolve(updateData);
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

async function encryptAndDecryptNormalProcess(
        symAlgoName,
        cipherAlgoName,
        paramType
) {
    var updateOutputdata;
    var globalCipherText;
    var globalKey;
    var globalText = "aaa this is test! this is test! bbb";
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

    return new Promise((resolve, reject) => {
        var symKeyGenerator = createSymKeyGenerator(symAlgoName);
        expect(symKeyGenerator != null).assertTrue();
        var cipherGenerator = createSymCipher(cipherAlgoName);
        expect(cipherGenerator != null).assertTrue();
        var globalParams = createGlobalParams(symAlgoName, paramType);

        generateSymKey(symKeyGenerator)
            .then((CallbackKey) => {
                expect(CallbackKey != null).assertTrue();
                globalKey = CallbackKey;
                return initCipher(
                    cipherGenerator,
                    encryptMode,
                    CallbackKey,
                    globalParams
                );
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                let plainText = { data: stringTouInt8Array(globalText) };
                return updateCipher(cipherGenerator, encryptMode, plainText);
            })
            .then((updateOutput) => {
                console.warn(
                    "[Callback]encrypt update out hex:" +
                    uInt8ArrayToShowStr(updateOutput.data)
                );
                globalCipherText = updateOutput;
                expect(globalCipherText != null).assertTrue();
                return doFinalCipher(cipherGenerator, encryptMode, null);
            })
            .then((finalOutput) => {
                if (finalOutput == null) {
                } else {
                    if (
                        paramType == "genGcmParamsSpec" ||
                        paramType == "genCcmParamsSpec"
                    ) {
                        console.warn(
                            "[Callback]encrypt authTag(finalOutput) hex: " +
                            uInt8ArrayToShowStr(finalOutput.data)
                        );
                        globalParams.authTag = finalOutput;
                    } else {
                        console.warn(
                            "[Callback]encrypt authTag(finalOutput) hex: " +
                            uInt8ArrayToShowStr(finalOutput.data)
                        );
                        globalCipherText = Array.from(globalCipherText.data);
                        finalOutput = Array.from(finalOutput.data);
                        globalCipherText = globalCipherText.concat(finalOutput);
                        globalCipherText = new Uint8Array(globalCipherText);
                        globalCipherText = { data: globalCipherText };
                    }
                }
                return initCipher(
                    cipherGenerator,
                    decryptMode,
                    globalKey,
                    globalParams
                );
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                return updateCipher(cipherGenerator, decryptMode, globalCipherText);
            })
            .then((updateOutput) => {
                updateOutputdata = uInt8ArrayToString(updateOutput.data);
                console.warn(
                    "[Callback]decrypt update out: " +
                    uInt8ArrayToString(updateOutput.data)
                );
                return doFinalCipher(cipherGenerator, decryptMode, null);
            })
            .then((finalOutput) => {
                if (finalOutput == null) {
                    console.error("[Callback]decrypt doFinal out is null");
                } else {
                    console.log(
                        "[Callback]decrypt doFinal out hex: " +
                        uInt8ArrayToString(finalOutput.data)
                    );
                    console.log(
                        "[Callback]Decrypt plaintext data: " +
                        updateOutputdata +
                        uInt8ArrayToString(finalOutput.data)
                    );
                    expect(
                        updateOutputdata + uInt8ArrayToString(finalOutput.data) ==
                        globalText
                    ).assertTrue();
                }
                resolve();
            })
            .catch((err) => {
                console.error("[Callback] encryptProcess catch err:" + err);
                reject(err);
            });
    });
}

async function convertKeyEncryptAndDecryptProcess(
        symAlgoName,
        cipherAlgoName,
        paramType
) {
    var updateOutputdata;
    var globalCipherText;
    var globalKey;
    var globalText = "aaa this is test! this is test! bbb";
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

    return new Promise((resolve, reject) => {
        var symKeyGenerator = createSymKeyGenerator(symAlgoName);
        expect(symKeyGenerator != null).assertTrue();
        var cipherGenerator = createSymCipher(cipherAlgoName);
        expect(cipherGenerator != null).assertTrue();
        var globalParams = createGlobalParams(symAlgoName, paramType);

        generateSymKey(symKeyGenerator)
            .then((CallbackKey) => {
                expect(CallbackKey != null).assertTrue();
                globalKey = CallbackKey;
                let encodeKey = CallbackKey.getEncoded();
                return convertSymKey(symKeyGenerator, encodeKey);
            })
            .then((convertKey) => {
                expect(convertKey != null).assertTrue();
                return initCipher(
                    cipherGenerator,
                    encryptMode,
                    convertKey,
                    globalParams
                );
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                let plainText = { data: stringTouInt8Array(globalText) };
                return updateCipher(cipherGenerator, encryptMode, plainText);
            })
            .then((updateOutput) => {
                console.warn(
                    "[Callback]encrypt update out hex:" +
                    uInt8ArrayToShowStr(updateOutput.data)
                );
                globalCipherText = updateOutput;
                expect(globalCipherText != null).assertTrue();
                return doFinalCipher(cipherGenerator, encryptMode, null);
            })
            .then((finalOutput) => {
                if (finalOutput == null) {
                } else {
                    if (
                        paramType == "genGcmParamsSpec" ||
                        paramType == "genCcmParamsSpec"
                    ) {
                        console.warn(
                            "[Callback]encrypt authTag(finalOutput) hex: " +
                            uInt8ArrayToShowStr(finalOutput.data)
                        );
                        globalParams.authTag = finalOutput;
                    } else {
                        console.warn(
                            "[Callback]encrypt authTag(finalOutput) hex: " +
                            uInt8ArrayToShowStr(finalOutput.data)
                        );
                        globalCipherText = Array.from(globalCipherText.data);
                        finalOutput = Array.from(finalOutput.data);
                        globalCipherText = globalCipherText.concat(finalOutput);
                        globalCipherText = new Uint8Array(globalCipherText);
                        globalCipherText = { data: globalCipherText };
                    }
                }
                return initCipher(
                    cipherGenerator,
                    decryptMode,
                    globalKey,
                    globalParams
                );
            })
            .then((initData) => {
                expect(initData === "init success").assertTrue();
                return updateCipher(cipherGenerator, decryptMode, globalCipherText);
            })
            .then((updateOutput) => {
                updateOutputdata = uInt8ArrayToString(updateOutput.data);
                console.warn(
                    "[Callback]decrypt update out: " +
                    uInt8ArrayToString(updateOutput.data)
                );
                return doFinalCipher(cipherGenerator, decryptMode, null);
            })
            .then((finalOutput) => {
                if (finalOutput == null) {
                    console.error("[Callback]decrypt doFinal out is null");
                } else {
                    console.log(
                        "[promise]decrypt doFinal out hex: " +
                        uInt8ArrayToString(finalOutput.data)
                    );
                    console.log(
                        "[promise]Decrypt plaintext data: " +
                        updateOutputdata +
                        uInt8ArrayToString(finalOutput.data)
                    );
                    expect(
                        updateOutputdata + uInt8ArrayToString(finalOutput.data) ==
                        globalText
                    ).assertTrue();
                }
                resolve();
            })
            .catch((err) => {
                console.error("[Callback] encryptProcess catch err:" + err);
                reject(err);
            });
    });
}

async function encryptAndDecryptNormalSM4Process(symKeyPair, cipherAlgoName) {
    var updateOutputdata;
    var globalCipherText;
    var globalText = "abcdefghabcdefghabcdefghabcdefgh";
    var encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
    var decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
    return new Promise((resolve, reject) => {
        var cipherGenerator = createSymCipher(cipherAlgoName);
        initCipher(cipherGenerator, encryptMode, symKeyPair, null)
            .then((initData) => {
                console.log("initData: " + initData);
                let plainText = { data: stringTouInt8Array(globalText) };
                return updateCipher(cipherGenerator, encryptMode, plainText);
            })
            .then((updateOutput) => {
                console.log(
                    "[Callback] encrypt update out hex:" +
                    uInt8ArrayToShowStr(updateOutput.data)
                );
                globalCipherText = updateOutput;
                return doFinalCipher(cipherGenerator, encryptMode, null);
            })
            .then((finalOutput) => {
                if (finalOutput == null) {
                } else {
                    globalCipherText = Array.from(globalCipherText.data);
                    finalOutput = Array.from(finalOutput.data);
                    globalCipherText = globalCipherText.concat(finalOutput);
                    globalCipherText = new Uint8Array(globalCipherText);
                    globalCipherText = { data: globalCipherText };
                }
                return initCipher(cipherGenerator, decryptMode, symKeyPair, null);
            })
            .then((initData) => {
                console.log("initData: " + initData);
                return updateCipher(cipherGenerator, decryptMode, globalCipherText);
            })
            .then((updateOutput) => {
                updateOutputdata = uInt8ArrayToString(updateOutput.data);
                console.log(
                    "[Callback] decrypt update out: " +
                    uInt8ArrayToString(updateOutput.data)
                );
                return doFinalCipher(cipherGenerator, decryptMode, null);
            })
            .then((finalOutput) => {
                console.log("finalOutput: " + finalOutput);
                if (updateOutputdata == globalText) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error("[Callback] encryptProcess catch err:" + err);
                reject(err);
            });
    });
}

export { encryptAndDecryptNormalProcess, convertKeyEncryptAndDecryptProcess, encryptAndDecryptNormalSM4Process, };
