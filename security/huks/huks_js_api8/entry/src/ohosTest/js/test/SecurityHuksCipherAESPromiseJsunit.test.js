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
import huks from '@ohos.security.huks';
import { HuksCipherAES } from './utils/param/cipher/publicCipherParam';
import { HksTag } from './utils/param/publicParam';
import { checkSoftware, makeOptions, stringToUint8Array, uint8ArrayToString } from './utils/param/publicFunc';
import { logger } from './utils/common/logger';

let IV = '0000000000000000';
let AAD = '0000000000000000';
let NONCE = '000000000000';
let AEAD = '0000000000000000';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = 'Hks_AES_Cipher_Test_10101010101010101010101010101010101010101010101010110_string';
let srcData65Kb = stringToUint8Array(srcData65);
let updateResult = new Array();
let encryptedData;
var handle;

let baseHuksOptions = {};
let useSoftware = true;

let genHuksOptions = {
    properties: new Array(HuksCipherAES.HuksKeyAlgAES, HuksCipherAES.HuksKeyPurpose),
    inData: new Uint8Array(new Array()),
};

async function resetOptions() {
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

async function resetOptionsGCM() {
    baseHuksOptions = {
        properties: new Array(
            HuksCipherAES.HuksKeyAlgAES,
            HuksCipherAES.HuksKeyAESPADDINGNONE,
            HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
            HuksCipherAES.HuksKeyAESDIGESTNONE,
            { tag: HksTag.HKS_TAG_ASSOCIATED_DATA, value: stringToUint8Array(AAD) },
            { tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE) }
        ),
        inData: new Array(),
    };
}

async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    await huks.generateKey(srcKeyAlias, genHuksOptionsNONECBC)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicInitFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
            if (expectValue == 0) {
                handle = data.handle;
            }
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
        await publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    }
}

async function update(handle, HuksOptions) {
    await huks.update(handle, HuksOptions)
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
        await finish(HuksOptions, isEncrypt);
    } else if (thirdInterfaceName == 'abort') {
        await abort(HuksOptions);
    }
}

async function finish(HuksOptions, isEncrypt) {
    await huks.finish(handle, HuksOptions)
        .then((data) => {
            expect(data.errorCode == 0).assertTrue();
            logger.log(`test finish data: ${JSON.stringify(data)}`);
            let finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
            logger.log(`ajy test finishData: ${JSON.stringify(finishData)}`);
            logger.log(`ajy test encryptedData: ${JSON.stringify(encryptedData)}`);
            updateResult = updateResult.concat(Array.from(data.outData));
            expect(!isEncrypt).assertEqual(finishData === uint8ArrayToString(encryptedData))
        })
        .catch((err) => {
            logger.error('test finish err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function abort(HuksOptions) {
    await huks.abort(handle, HuksOptions)
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
    await huks.deleteKey(srcKeyAlias, genHuksOptionsNONECBC)
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
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInterfaceName == 'abort')) {
        await publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC);
    }
    return updateResult;
}

export default function SecurityHuksCipherAESPromiseJsunit() {
    describe('SecurityHuksCipherAESPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_101
         * @tc.number Security_HUKS_Cipher_API8_AES_101
         * @tc.desc   Security_HUKS_Cipher_API8_AES_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_102
         * @tc.number Security_HUKS_Cipher_API8_AES_102
         * @tc.desc   Security_HUKS_Cipher_API8_AES_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias102';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_103
         * @tc.number Security_HUKS_Cipher_API8_AES_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias103';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_104
         * @tc.number Security_HUKS_Cipher_API8_AES_104
         * @tc.desc   Security_HUKS_Cipher_API8_AES_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias104';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_101
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_101
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData63Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_102
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_102
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias102';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData63Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_101
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_101
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData63Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_102
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_102
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias102';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData63Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize192);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize192);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_101
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_101
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODECBCKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData63Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_102
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_102
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODECBCKeyAlias102';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData63Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_104
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_104
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECBC_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias102';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODECBC_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODECBC_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODECBC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODECBC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGPKCS7MODECBCKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECTR_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECTR_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECTR_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODECTR_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODECTRKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODECTR);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEECB_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEECB_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEECB_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEECB_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEECBKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGPKCS7MODEECB_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize128PADDINGPKCS7MODEECBKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_104
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_104
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECBC_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECBCKeyAlias102';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODECBC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODECBCKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODECTR_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODECTRKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESSize192);
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEECB_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEECBKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGPKCS7MODEECB_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize192PADDINGPKCS7MODEECBKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_104
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_104
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECBC_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODECBCKeyAlias104';
            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODECBC_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODECBC_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODECBC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODECBC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGPKCS7MODECBCKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESPADDINGPKCS7);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGPKCS7,
                HuksCipherAES.HuksKeyAESBLOCKMODE
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECTR_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECTR_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECTR_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODECTR_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODECTRKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESBLOCKMODECTR);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherAES.HuksKeyPurposeDECRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODECTR
            );
            HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEECB_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEECB_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEECB_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEECB_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODEECBKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
                HuksCipherAES.HuksKeyAESBLOCKMODEECB
            );
            let HuksOptions = makeOptions(baseHuksOptions, 4, first, srcData65Kb);
            HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEECB
                );
                HuksOptions = makeOptions(baseHuksOptions, 4, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyAESSize256);
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGPKCS7MODEECB_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherAESSize256PADDINGPKCS7MODEECBKeyAlias103';
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
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_101
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_101
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM()
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEGCM);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptionsGCM();
                let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize128, {
                    tag: HksTag.HKS_TAG_AE_TAG,
                    value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
                });
                HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_102
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_102
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM()
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias102';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData63Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM()
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEGCM);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptionsGCM();
                let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize128, {
                    tag: HksTag.HKS_TAG_AE_TAG,
                    value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
                });
                HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_104
         * @tc.number Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_104
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size128PADDINGNONEMODEGCM_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM()
            const srcKeyAlias = 'testCipherAESSize128PADDINGNONEMODEGCMKeyAlias104';
            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize128, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size192PADDINGNONEMODEGCM_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            resetOptionsGCM()
            const srcKeyAlias = 'testCipherAESSize192PADDINGNONEMODEGCMKeyAlias103';

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize192, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptionsGCM();
                let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize192, {
                    tag: HksTag.HKS_TAG_AE_TAG,
                    value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
                });
                HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_103
         * @tc.number Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_103
         * @tc.desc   Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_AES_Size256PADDINGNONEMODEGCM_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                    {
                        tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE)
                    }
                ),
                inData: new Array(),
            };
            const srcKeyAlias = 'testCipherAESSize256PADDINGNONEMODEGCMKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize256);
            genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODEGCM);
            genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);

            let first = new Array(HuksCipherAES.HuksKeyPurposeENCRYPT, HuksCipherAES.HuksKeyAESSize256, {
                tag: HksTag.HKS_TAG_AE_TAG,
                value: stringToUint8Array(AEAD),
            });
            let HuksOptions = makeOptions(baseHuksOptions, 6, first, srcData65Kb);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptionsGCM();
                let second = new Array(HuksCipherAES.HuksKeyPurposeDECRYPT, HuksCipherAES.HuksKeyAESSize256, {
                    tag: HksTag.HKS_TAG_AE_TAG,
                    value: new Uint8Array(updateResult.splice(updateResult.length - 16, updateResult.length)),
                });
                HuksOptions = makeOptions(baseHuksOptions, 6, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1006
         * @tc.number Security_HUKS_errorCode_API8_1006
         * @tc.desc   Security_HUKS_errorCode_API8_1006
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_006';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESPADDINGNONE
                ),
                inData: srcData63Kb,
            };
            let HuksOptions2 = {
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
                inData: srcData63Kb,
            };
            await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
            await publicInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
            await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1009
         * @tc.number Security_HUKS_errorCode_API8_1009
         * @tc.desc   Security_HUKS_errorCode_API8_1009
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_009';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE
                ),
                inData: srcData63Kb,
            };
            let HuksOptions2 = {
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
                inData: srcData63Kb,
            };
            await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
            await publicInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
            await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1020
         * @tc.number Security_HUKS_errorCode_API8_1020
         * @tc.desc   Security_HUKS_errorCode_API8_1020
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_020';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyPurpose,
                ),
            };
            let HuksOptions2 = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    {
                        tag: HksTag.HKS_TAG_ASSOCIATED_DATA, value: stringToUint8Array(AAD)
                    },
                    {
                        tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD)
                    }
                ),
            };
            encryptedData = stringToUint8Array("123456");
            HuksOptions2.inData = encryptedData;
            await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
            await publicInitFunc(srcKeyAliasFirst, HuksOptions2, 0);
            await publicFinishAbortFunc(HuksOptions2, "finish", true);
            HuksOptions2.properties.splice(2, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
            HuksOptions2.properties.splice(6, 1, {
                tag: HksTag.HKS_TAG_AE_TAG, value: new Uint8Array(updateResult.slice(updateResult.length - 16))
            });
            HuksOptions2.inData = new Uint8Array(updateResult.slice(0, updateResult.length - 16));
            await publicInitFunc(srcKeyAliasFirst, HuksOptions2, -30);
            await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1021
         * @tc.number Security_HUKS_errorCode_API8_1021
         * @tc.desc   Security_HUKS_errorCode_API8_1021
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_020';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyPurpose,
                ),
            };
            let HuksOptions2 = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyAESSize128,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    {
                        tag: HksTag.HKS_TAG_NONCE, value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: HksTag.HKS_TAG_AE_TAG, value: stringToUint8Array(AEAD)
                    }
                )
            };
            await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
            encryptedData = stringToUint8Array("123456");
            HuksOptions2.inData = encryptedData;
            await publicInitFunc(srcKeyAliasFirst, HuksOptions2, 0);
            updateResult = new Array();
            await publicFinishAbortFunc(HuksOptions2, "finish", true);
            HuksOptions2.properties.splice(2, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
            HuksOptions2.properties.splice(6, 1, {
                tag: HksTag.HKS_TAG_AE_TAG, value: new Uint8Array(updateResult.slice(updateResult.length - 16))
            });
            HuksOptions2.inData = new Uint8Array(updateResult.slice(0, updateResult.length - 16));
            await publicInitFunc(srcKeyAliasFirst, HuksOptions2, 0);
            updateResult = new Array();
            await publicFinishAbortFunc(HuksOptions2, "finish", false);
            await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1);
            done();
        });

    });
}