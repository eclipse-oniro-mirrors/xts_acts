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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherAES } from './utils/param/cipher/publicCipherParam';
import { HksTag } from './utils/param/publicParam';
import { stringToUint8Array, uint8ArrayToString, checkSoftware } from './utils/param/publicFunc';
import { Data64b } from './utils/data.json';

let IV = '0000000000000000';
let AAD = '0000000000000000';
let NONCE = '00000000000';
let AEAD = '0000000000000000';
let useSoftware = true;

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = 'Hks_AES_Cipher_Test_000000000000000000000000000000000000000_string';
let srcData65Kb = stringToUint8Array(srcData65);
let srcData64Kb = stringToUint8Array(Data64b)
let updateResult = new Array();
let finishData = new Array();
let encryptedData = new Array();
let handle;

let genHuksOptions = {
    properties: new Array(HuksCipherAES.HuksKeyAlgAES, HuksCipherAES.HuksKeyPurpose),
    inData: new Uint8Array(new Array()),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
    console.info(`enter promise generateKeyItem`);
    try {
        await huks.generateKeyItem(srcKeyAlies, genHuksOptionsNONECBC)
            .then((data) => {
                console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
    console.info(`enter promise doInit`);
    try {
        await huks.initSession(srcKeyAlies, HuksOptions)
            .then((data) => {
                console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                handle = data.handle;
            })
            .catch(error => {
                console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await update(handle, HuksOptions);
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt, 0);
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await update(handle, HuksOptions);
        }
        HuksOptions.inData = huksOptionsInData;
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
        } else {
            HuksOptions.inData = new Uint8Array(new Array());
        }
        await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    }
}

async function update(handle, HuksOptions) {
    console.info(`enter promise doUpdate`);
    try {
        await huks.updateSession(handle, HuksOptions)
            .then((data) => {
                console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                if (updateResult.length !== 0) {
                    console.log(`test update outDatalength ${updateResult.length}`);
                    updateResult = updateResult.concat(Array.from(data.outData));
                } else {
                    console.log(`test update outDatalength ${updateResult.length}`);
                    updateResult = Array.from(data.outData);
                }
            })
            .catch(error => {
                console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
    if (thirdInderfaceName == 'finish') {
        await finish(HuksOptions, isEncrypt);
    } else if (thirdInderfaceName == 'abort') {
        await abort(HuksOptions);
    }
}

async function finish(HuksOptions, isEncrypt) {
    console.info(`enter promise doFinish`);
    try {
        await huks.finishSession(handle, HuksOptions)
            .then((data) => {
                console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                if (encryptedData.length > 64) {
                    finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
                    updateResult = updateResult.concat(Array.from(data.outData));
                } else {
                    console.info(`updateResult: updateResult success, data = ${JSON.stringify(updateResult)}`);
                    finishData = uint8ArrayToString(updateResult);
                }
            })
            .catch(error => {
                console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function abort(HuksOptions) {
    console.info(`enter promise doAbort`);
    try {
        await huks.abortSession(handle, HuksOptions)
            .then((data) => {
                console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
    console.info(`enter promise deleteKeyItem`);
    try {
        await huks.deleteKeyItem(srcKeyAlies, genHuksOptionsNONECBC)
            .then((data) => {
                console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicCipherFunc(srcKeyAlies, genHuksOptionsNONECBC, HuksOptions, thirdInderfaceName, isEncrypt) {
    try {
        updateResult = new Array();
        if (isEncrypt) {
            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC);
            encryptedData = HuksOptions.inData;
        }
        await publicInitFunc(srcKeyAlies, HuksOptions);
        await publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt);
        if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC);
        }
    } catch (e) {
        expect(null).assertFail();
    }
}

export default function SecurityHuksCipherAESPromiseJsunit() {
    describe('SecurityHuksCipherAESPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        it('Security_HUKS_Cipher_API9_AES_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData63Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('Security_HUKS_Cipher_API9_AES_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        it('Security_HUKS_Cipher_API9_AES_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('Security_HUKS_Cipher_API9_AES_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        it('testCipherAESSize128PADDINGPKCS7MODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGPKCS7MODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData65Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize128PADDINGNONEMODECTR103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECTRKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODECTR,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODECTR,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize128PADDINGPKCS7MODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherAES.HuksKeyAlgAES,
                        HuksCipherAES.HuksKeyPurposeDECRYPT,
                        HuksCipherAES.HuksKeyAESSize128,
                        HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                        HuksCipherAES.HuksKeyAESDIGESTNONE,
                        {
                            tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                        }
                    ),
                    inData: new Uint8Array(updateResult),
                };
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        it('testCipherAESSize192PADDINGNONEMODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize192PADDINGPKCS7MODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize192PADDINGPKCS7MODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData65Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize192PADDINGNONEMODECTR103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODECTRKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODECTR,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODECTR,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize192PADDINGNONEMODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize192PADDINGNONEMODEECBKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherAES.HuksKeyAlgAES,
                        HuksCipherAES.HuksKeyPurposeDECRYPT,
                        HuksCipherAES.HuksKeyAESSize192,
                        HuksCipherAES.HuksKeyAESPADDINGNONE,
                        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                        HuksCipherAES.HuksKeyAESDIGESTNONE,
                        {
                            tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                        }
                    ),
                    inData: new Uint8Array(updateResult),
                };
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        it('testCipherAESSize192PADDINGPKCS7MODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize192PADDINGPKCS7MODEECBKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize192,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherAES.HuksKeyAlgAES,
                        HuksCipherAES.HuksKeyPurposeDECRYPT,
                        HuksCipherAES.HuksKeyAESSize192,
                        HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                        HuksCipherAES.HuksKeyAESDIGESTNONE,
                        {
                            tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                        }
                    ),
                    inData: new Uint8Array(updateResult),
                };
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        it('testCipherAESSize256PADDINGNONEMODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData63Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize256PADDINGPKCS7MODECBC103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize256PADDINGPKCS7MODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData65Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize256PADDINGNONEMODECTR103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODECTRKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODECTR,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODECTR,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('testCipherAESSize256PADDINGNONEMODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize256PADDINGNONEMODEECBKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherAES.HuksKeyAlgAES,
                        HuksCipherAES.HuksKeyPurposeDECRYPT,
                        HuksCipherAES.HuksKeyAESSize256,
                        HuksCipherAES.HuksKeyAESPADDINGNONE,
                        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                        HuksCipherAES.HuksKeyAESDIGESTNONE,
                        {
                            tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                        }
                    ),
                    inData: new Uint8Array(updateResult),
                };
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        it('testCipherAESSize256PADDINGPKCS7MODEECB103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherAESSize256PADDINGPKCS7MODEECBKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherAES.HuksKeyAlgAES,
                        HuksCipherAES.HuksKeyPurposeDECRYPT,
                        HuksCipherAES.HuksKeyAESSize256,
                        HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                        HuksCipherAES.HuksKeyAESBLOCKMODEECB,
                        HuksCipherAES.HuksKeyAESDIGESTNONE,
                        {
                            tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                        }
                    ),
                    inData: new Uint8Array(updateResult),
                };
                await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.number SUB_Security_HUKS_isPwdSet_0010
         * @tc.name Test generate key when password tag is true and password is not set;
         * @tc.desc HuksOptions with AlgName AES
         * @tc.desc Test generate key with Promise. Test fail
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_isPwdSet_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'SUB_Security_HUKS_isPwdSet_0010';
            let huksProperties = new Array();
            let index = 0;
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                value: huks.HuksKeyAlg.HUKS_ALG_AES
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PADDING,
                value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
                value: huks.HuksCipherMode.HUKS_MODE_CBC
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET,
                value: true
            };
            let huksOptions = {
                properties: huksProperties
            };
            expect(12000016).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET);
            expect(4).assertEqual(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_ALWAYS_VALID);
            expect(536871228).assertEqual(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL);
            let enum1 = huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE;
            let enum2 = huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE;
            let enum3 = huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE;
            try {
                await huks.generateKeyItem(srcKeyAlies, huksOptions);
                console.error("SUB_Security_HUKS_isPwdSet_0010: fail");
                expect(null).assertFail();
            } catch (err) {
                expect(err.code).assertEqual(12000016);
                console.log("SUB_Security_HUKS_isPwdSet_0010: success");
            }
            done();
        });

        /**
         * @tc.number SUB_Security_HUKS_isPwdSet_0020
         * @tc.name Test generate key when password tag is false and password is not set;
         * @tc.desc HuksOptions with AlgName AES
         * @tc.desc Test generate key, encrypt with Promise. Test success
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_isPwdSet_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'SUB_Security_HUKS_isPwdSet_0020';
            let huksProperties = new Array();
            let index = 0;
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                value: huks.HuksKeyAlg.HUKS_ALG_AES
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PADDING,
                value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
                value: huks.HuksCipherMode.HUKS_MODE_CBC
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET,
                value: false
            };
            let huksOptions = {
                properties: huksProperties
            };
            let cipherHuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData63Kb,
            };
            await publicCipherFunc(srcKeyAlies, huksOptions, cipherHuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.number SUB_Security_HUKS_hasKeyItem_0010
         * @tc.name test has key by alias, Promise style, test success;
         * @tc.desc HuksOptions with AlgName AES
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_hasKeyItem_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'SUB_Security_HUKS_hasKeyItem_0010';
            let huksProperties = new Array();
            let index = 0;
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                value: huks.HuksKeyAlg.HUKS_ALG_AES
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PADDING,
                value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
                value: huks.HuksCipherMode.HUKS_MODE_CBC
            };
            let huksOptions = {
                properties: huksProperties
            };
            try {
                await publicGenerateKeyFunc(srcKeyAlias, huksOptions);
                let res = await huks.hasKeyItem(srcKeyAlias, huksOptions);
                expect(res).assertTrue();
                await publicDeleteKeyFunc(srcKeyAlias, huksOptions);
                res = await huks.hasKeyItem(srcKeyAlias, huksOptions);
                expect(!res).assertTrue();
            } catch (err) {
                console.error(srcKeyAlias + `: fail, code: ${err.code}, msg: ${err.message}`);
                expect(null).assertFail();
            }
            console.log(srcKeyAlias + ": success");
            done();
        });

        /**
         * @tc.number SUB_Security_HUKS_ECE_0010
         * @tc.name generate key when pin is not set, key level down from A to D;
         * @tc.desc HuksOptions with AlgName AES
         * @tc.desc Test generate key, encrypt with Promise. Test success
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_ECE_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'SUB_Security_HUKS_ECE_0010';
            let huksProperties = new Array();
            let index = 0;
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                value: huks.HuksKeyAlg.HUKS_ALG_AES
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PADDING,
                value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
                value: huks.HuksCipherMode.HUKS_MODE_CBC
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET,
                value: false
            };
            let huksOptions = {
                properties: huksProperties
            };
            let cipherHuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData63Kb,
            };
            await publicCipherFunc(srcKeyAlies, huksOptions, cipherHuksOptions, 'abort', true);
            cipherHuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, huksOptions, cipherHuksOptions, 'abort', true);
            done();
        });


    });
}

export { publicCipherFunc, IV, updateResult };