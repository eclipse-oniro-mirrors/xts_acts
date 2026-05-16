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
import { stringTouInt8Array, uInt8ArrayToShowStr, } from "../common/publicDoString";

async function generateSymKey(symKeyGenerator) {
    return new Promise((resolve, reject) => {
        symKeyGenerator.generateSymKey((err, symKey) => {
            if (err) {
                console.error("[Callback] generateSymKey failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback] generateSymKey success. symKey is " + symKey);
                console.log("[Callback] key algName:" + symKey.algName);
                console.log("[Callback] key format:" + symKey.format);
                var encodeKey = symKey.getEncoded();
                console.log(
                    "[Callback] key getEncoded hex: " +
                    uInt8ArrayToShowStr(encodeKey.data)
                );
                resolve(symKey);
            }
        });
    });
}

async function initMac(macGenerator, symKey) {
    return new Promise((resolve, reject) => {
        macGenerator.init(symKey, (err) => {
            if (err) {
                console.error("[Callback] macGenerator init failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback] macGenerator init success!");
                resolve("init success");
            }
        });
    });
}

async function updateMac(macGenerator, dataBlob) {
    return new Promise((resolve, reject) => {
        macGenerator.update(dataBlob, (err) => {
            if (err) {
                console.error("[Callback] macGenerator update failed. error is " + err);
                reject(err);
            } else {
                console.log("[Callback] macGenerator update success!");
                resolve("update success");
            }
        });
    });
}

async function doFinalMac(macGenerator) {
    return new Promise((resolve, reject) => {
        macGenerator.doFinal((err, output) => {
            if (err) {
                console.error(
                    "[Callback] macGenerator doFinal failed. error is " + err
                );
                reject(err);
            } else {
                console.log(
                    "[Callback] macGenerator doFinal success! output is: " + output
                );
                resolve(output);
            }
        });
    });
}

async function testHMACDigestCallback(HMACAlgoName, keyAlgoName) {
    let globalHMAC;
    let globalText = "my test data";
    let globalsymKeyGenerator;
    let ginBlob = {
        data: stringTouInt8Array(globalText),
    };

    return new Promise((resolve, reject) => {
        globalHMAC = cryptoFramework.createMac(HMACAlgoName);
        console.log("[Callback] mac= " + globalHMAC);
        console.log("[Callback] HMAC algName is: " + globalHMAC.algName);
        globalsymKeyGenerator = cryptoFramework.createSymKeyGenerator(keyAlgoName);
        console.log(
            "[Callback] symKeyGenerator algName:" + globalsymKeyGenerator.algName
        );

        generateSymKey(globalsymKeyGenerator)
            .then((symKey) => {
                return initMac(globalHMAC, symKey);
            })
            .then((initData) => {
                console.log("[Callback] init success: " + initData);
                return updateMac(globalHMAC, ginBlob);
            })
            .then((updateData) => {
                console.log("[Callback] update success: " + updateData);
                return doFinalMac(globalHMAC);
            })
            .then((macOutput) => {
                console.log("[Callback] HMAC result:" + macOutput.data);
                let macLen = globalHMAC.getMacLength();
                console.log("[Callback] MAC len:" + macLen);
                if (macOutput != null && macLen != 0 && macLen != null) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
            .catch((err) => {
                console.error("[Callback] testHMACDigestCallback catch error: " + err);
                reject(err);
            });
    });
}

export { testHMACDigestCallback };
