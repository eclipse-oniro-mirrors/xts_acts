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
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { HuksCipherAES } from './utils/param/cipher/publicCipherParam';
import { HksTag } from './utils/param/publicParam';
import { checkSoftware, makeOptions, stringToUint8Array, uint8ArrayToString } from './utils/param/publicFunc';
import { logger } from './utils/common/logger';
import * as huksCallback from './utils/param/huksCallback.js';

let IV = '0000000000000000';
let AAD = '0000000000000000';
let NONCE = '000000000000';
let AEAD = '0000000000000000';

let defaultData = '0';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = 'Hks_AES_Cipher_Test_10101010101010101010101010101010101010101010101010110_string';
let srcData65Kb = stringToUint8Array(srcData65);
let updateResult = new Array();
let encryptedData;
var handle;
let useSoftware;
let baseHuksOptions = {};

let genHuksOptions = {
    properties: new Array(HuksCipherAES.HuksKeyAlgAES, HuksCipherAES.HuksKeyPurpose),
    inData: new Uint8Array(defaultData),
};

function resetOptions() {
    baseHuksOptions = {
        properties: new Array(
            HuksCipherAES.HuksKeyAlgAES,
            HuksCipherAES.HuksKeyAESSize128,
            HuksCipherAES.HuksKeyAESDIGESTNONE,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Array(),
    };
}

function resetOptionsGCM() {
    baseHuksOptions = {
        properties: new Array(
            HuksCipherAES.HuksKeyAlgAES,
            HuksCipherAES.HuksKeyAESPADDINGNONE,
            HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
            HuksCipherAES.HuksKeyAESDIGESTNONE,
            {
                tag: HksTag.HKS_TAG_ASSOCIATED_DATA,
                value: stringToUint8Array(AAD),
            },
            { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) }
        ),
        inData: new Array(),
    };
}

async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    await huksCallback.generateKey(srcKeyAlias, genHuksOptionsNONECBC)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicInitFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data: ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await updateFunc(handle, HuksOptions);
        }
        HuksOptions.inData = huksOptionsInData;
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
        } else {
            HuksOptions.inData = new Uint8Array(new Array());
        }
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    }
}

async function updateFunc(handle, HuksOptions) {
    await huksCallback.update(handle, HuksOptions)
        .then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            if (updateResult.length !== 0) {
                updateResult = updateResult.concat(Array.from(data.outData));
            } else {
                updateResult = Array.from(data.outData);
            }
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test update err information: ' + err);
            expect(null).assertFail();
        });
}

async function publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt) {
    if (thirdInterfaceName == 'finish') {
        await finishFunc(HuksOptions, isEncrypt);
    } else if (thirdInterfaceName == 'abort') {
        await abortFunc(HuksOptions);
    }
}

async function finishFunc(HuksOptions, isEncrypt) {
    await huksCallback.finish(handle, HuksOptions)
        .then((data) => {
            logger.log(`test finish data: ${JSON.stringify(data)}`);
            let finishData;
            finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
            updateResult = updateResult.concat(Array.from(data.outData));
            if (isEncrypt) {
                if (finishData === uint8ArrayToString(encryptedData)) {
                    expect(null).assertFail();
                } else {
                    expect(data.errorCode == 0).assertTrue();
                }
            }
            if (!isEncrypt) {
                if (finishData === uint8ArrayToString(encryptedData)) {
                    expect(data.errorCode == 0).assertTrue();
                } else {
                    expect(null).assertFail();
                }
            }
        })
        .catch((err) => {
            logger.error('test finish err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function abortFunc(HuksOptions) {
    await huksCallback.abort(handle, HuksOptions)
        .then((data) => {
            logger.log(`test abort data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test abort err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    await huksCallback.deleteKey(srcKeyAlias, genHuksOptionsNONECBC)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicCipherFunc(srcKeyAlias, genHuksOptionsNONECBC, HuksOptions, thirdInterfaceName, isEncrypt) {
    updateResult = new Array();
    if (isEncrypt) {
        await publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC);
        encryptedData = HuksOptions.inData;
    }
    await publicInitFunc(srcKeyAlias, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInterfaceName == 'abort')) {
        await publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC);
    }
    return updateResult;
}

export default function SecurityHuksCipherAESCallbackJsunit() {
    describe('SecurityHuksCipherAESCallbackJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        });
        beforeEach(function () {
            resetOptions();
            logger.info('test beforeEach called');
        });
        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_001
         * @tc.number Security_HUKS_Cipher_API8_AES_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias001';
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
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: srcData63Kb,
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_002
         * @tc.number Security_HUKS_Cipher_API8_AES_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_003
         * @tc.number Security_HUKS_Cipher_API8_AES_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias003';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: srcData63Kb,
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_004
         * @tc.number Security_HUKS_Cipher_API8_AES_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });


        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_001
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_002
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias002';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_001
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODEECBKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);

            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_002
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODEECBKeyAlias002';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);

            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_001
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGPKCS7MODEECBKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_002
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGPKCS7MODEECBKeyAlias002';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, new Uint8Array(updateResult));
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODECBCKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODECBCKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECTRKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODECTR);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECTRKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEECBKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEECBKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODEECBKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODEECBKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGPKCS7MODEECBKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );

            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGPKCS7MODEECBKeyAlias004';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_001
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEGCM);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            resetOptionsGCM();
            let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
            });
            HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_002
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias002';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });

            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias001';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            resetOptionsGCM();
            let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
            });
            HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias002';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_001
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias001';

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });

            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            resetOptionsGCM();
            let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
            });
            HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_002
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias002';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias001';

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });

            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            resetOptionsGCM();
            let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
            });
            HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias002';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_001
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_001
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEGCM);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });

            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            resetOptionsGCM();
            let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
            });
            HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_002
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_002
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias002';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_003
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_003
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEGCM);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });

            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            resetOptionsGCM();
            let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
            });
            HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_004
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_004
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM();
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias002';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });
    });
}

export { publicCipherFunc, IV, updateResult };

