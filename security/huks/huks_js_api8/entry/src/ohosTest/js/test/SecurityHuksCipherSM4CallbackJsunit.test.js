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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { HuksCipherSM4 } from './utils/param/cipher/publicCipherParam';
import { HksTag } from './utils/param/publicParam';
import { arrayEqual, checkSoftware, stringToUint8Array } from './utils/param/publicFunc';
import { logger } from './utils/common/logger';
import * as huksCallback from './utils/param/huksCallback.js';

let IV = '0000000000000000';
let plainData;
let encryptedResult;
let handle;
let useSoftware = true;

const plainString48Bytes = 'Hks_SM4_Cipher_Test_000000000000000000000_string';
const plainData48Bytes = stringToUint8Array(plainString48Bytes);
const plainString240Bytes =
    'Hks_SM4_Cipher_Test_00000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000_string';
const plainData240Bytes = stringToUint8Array(plainString240Bytes);

let genHuksOptions = {
    properties: new Array(
        HuksCipherSM4.HuksKeyAlgSM4,
        HuksCipherSM4.HuksKeyPurpose
    ),
    inData: new Uint8Array(new Array()),
};

async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    await huksCallback.generateKey(srcKeyAlias, genHuksOptionsNONECBC)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test generateKey err information: ' + JSON.stringify(err));
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
            logger.log('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt) {
    const maxUpdateSize = 64;
    const inData = HuksOptions.inData;
    const lastInDataPosition = inData.length - 1;
    let inDataSegSize = maxUpdateSize;
    let inDataSegPosition = 0;
    let isFinished = false;
    let outData = [];
    while (inDataSegPosition <= lastInDataPosition) {
        if (inDataSegPosition + maxUpdateSize > lastInDataPosition) {
            isFinished = true;
            inDataSegSize = lastInDataPosition - inDataSegPosition + 1;
            break;
        }
        HuksOptions.inData = new Uint8Array(
            Array.from(inData).slice(inDataSegPosition, inDataSegPosition + inDataSegSize)
        );
        await huksCallback.update(handle, HuksOptions)
            .then((data) => {
                logger.log(`test update data ${JSON.stringify(data)}`);
                outData = outData.concat(Array.from(data.outData));
                expect(data.errorCode === 0).assertTrue();
            })
            .catch((err) => {
                logger.log('test update err information: ' + err);
                expect(null).assertFail();
            });
        if ((!isFinished) && (inDataSegPosition + maxUpdateSize > lastInDataPosition)) {
            logger.log(`update size invalid isFinished = ${isFinished}`);
            logger.log(`inDataSegPosition = ${inDataSegPosition}`);
            logger.log(`lastInDataPosition = ${lastInDataPosition}`);
            expect(null).assertFail();
            return;
        }
        inDataSegPosition += maxUpdateSize;
    }
    if (thirdInterfaceName == 'finish') {
        HuksOptions.inData = new Uint8Array(
            Array.from(inData).slice(inDataSegPosition, inDataSegPosition + inDataSegSize)
        );
        await huksCallback.finish(handle, HuksOptions)
            .then((data) => {
                logger.log(`test finish data: ${JSON.stringify(data)}`);
                outData = outData.concat(Array.from(data.outData));
                expect(data.errorCode === 0).assertTrue();
                if (isEncrypt) {
                    encryptedResult = outData;
                    logger.log(`encrypted data: ${encryptedResult}`);
                } else {
                    logger.log(`decrypted data: ${outData}`);
                    expect(arrayEqual(outData, plainData)).assertTrue();
                }
            })
            .catch((err) => {
                logger.log('test finish err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    } else if (thirdInterfaceName == 'abort') {
        await huksCallback.abort(handle, HuksOptions)
            .then((data) => {
                logger.log(`test abort data: ${JSON.stringify(data)}`);
                expect(data.errorCode === 0).assertTrue();
            })
            .catch((err) => {
                logger.log('test abort err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    }
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    await huksCallback.deleteKey(srcKeyAlias, genHuksOptionsNONECBC)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, thirdInterfaceName, isEncrypt) {
    if (isEncrypt) {
        plainData = HuksOptions.inData;
        await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
    }
    await publicInitFunc(srcKeyAlias, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInterfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInterfaceName == 'abort')) {
        await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions);
    }
}

export default function SecurityHuksCipherSM4CallbackJsunit() {
    describe('SecurityHuksCipherSM4CallbackJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        // HKS_SUPPORT_SM4_CBC_NOPADDING
        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00148
         * @tc.number Security_HUKS_Cipher_API8_SM4_00148
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00148
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData48Bytes,
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(encryptedResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_001240
         * @tc.number Security_HUKS_Cipher_API8_SM4_001240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_001240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_001240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData240Bytes,
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(encryptedResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00248
         * @tc.number Security_HUKS_Cipher_API8_SM4_00248
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00248
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias002';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData48Bytes),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_002240
         * @tc.number Security_HUKS_Cipher_API8_SM4_002240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_002240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_002240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECBCKeyAlias002';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData240Bytes),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        // HKS_SUPPORT_SM4_CBC_PKCS7
        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00348
         * @tc.number Security_HUKS_Cipher_API8_SM4_00348
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00348
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData48Bytes,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true
                );
                HuksOptions = {
                    properties: new Array(
                        HuksCipherSM4.HuksKeyAlgSM4,
                        HuksCipherSM4.HuksKeyPurposeDECRYPT,
                        HuksCipherSM4.HuksKeySM4Size128,
                        HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                        HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                    ),
                    inData: new Uint8Array(encryptedResult),
                };
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_003240
         * @tc.number Security_HUKS_Cipher_API8_SM4_003240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_003240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_003240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias003';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData240Bytes,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherSM4.HuksKeyAlgSM4,
                        HuksCipherSM4.HuksKeyPurposeDECRYPT,
                        HuksCipherSM4.HuksKeySM4Size128,
                        HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                        HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                    ),
                    inData: new Uint8Array(encryptedResult),
                };
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00448
         * @tc.number Security_HUKS_Cipher_API8_SM4_00448
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00448
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias004';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData48Bytes),
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_004240
         * @tc.number Security_HUKS_Cipher_API8_SM4_004240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_004240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_004240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODECBCKeyAlias004';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECBC);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData240Bytes),
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        // HKS_SUPPORT_SM4_CTR_NOPADDING
        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00548
         * @tc.number Security_HUKS_Cipher_API8_SM4_00548
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00548
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias005';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData48Bytes,
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(encryptedResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_005240
         * @tc.number Security_HUKS_Cipher_API8_SM4_005240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_005240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_005240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias005';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData240Bytes,
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(encryptedResult),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00648
         * @tc.number Security_HUKS_Cipher_API8_SM4_00648
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00648
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias006';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData48Bytes),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_006240
         * @tc.number Security_HUKS_Cipher_API8_SM4_006240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_006240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_006240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODECTRKeyAlias006';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODECTR);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECTR,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData240Bytes),
            };
            await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        // HKS_SUPPORT_SM4_ECB_NOPADDING
        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00748
         * @tc.number Security_HUKS_Cipher_API8_SM4_00748
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00748
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias007';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData48Bytes,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherSM4.HuksKeyAlgSM4,
                        HuksCipherSM4.HuksKeyPurposeDECRYPT,
                        HuksCipherSM4.HuksKeySM4Size128,
                        HuksCipherSM4.HuksKeySM4PADDINGNONE,
                        HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                    ),
                    inData: new Uint8Array(encryptedResult),
                };
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_007240
         * @tc.number Security_HUKS_Cipher_API8_SM4_007240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_007240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_007240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias007';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData240Bytes,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherSM4.HuksKeyAlgSM4,
                        HuksCipherSM4.HuksKeyPurposeDECRYPT,
                        HuksCipherSM4.HuksKeySM4Size128,
                        HuksCipherSM4.HuksKeySM4PADDINGNONE,
                        HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                    ),
                    inData: new Uint8Array(encryptedResult),
                };
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00848
         * @tc.number Security_HUKS_Cipher_API8_SM4_00848
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00848
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00848', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias008';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData48Bytes),
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_008240
         * @tc.number Security_HUKS_Cipher_API8_SM4_008240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_008240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_008240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGNONEMODEECBKeyAlias008';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGNONE);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData240Bytes),
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        // HKS_SUPPORT_SM4_ECB_PKCS7
        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_00948
         * @tc.number Security_HUKS_Cipher_API8_SM4_00948
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_00948
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_00948', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias009';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData48Bytes,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherSM4.HuksKeyAlgSM4,
                        HuksCipherSM4.HuksKeyPurposeDECRYPT,
                        HuksCipherSM4.HuksKeySM4Size128,
                        HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                        HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                    ),
                    inData: new Uint8Array(encryptedResult),
                };
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_009240
         * @tc.number Security_HUKS_Cipher_API8_SM4_009240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_009240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_009240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias009';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: plainData240Bytes,
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                HuksOptions = {
                    properties: new Array(
                        HuksCipherSM4.HuksKeyAlgSM4,
                        HuksCipherSM4.HuksKeyPurposeDECRYPT,
                        HuksCipherSM4.HuksKeySM4Size128,
                        HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                        HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                    ),
                    inData: new Uint8Array(encryptedResult),
                };
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_01048
         * @tc.number Security_HUKS_Cipher_API8_SM4_01048
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_01048
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_01048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias010';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData48Bytes),
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_SM4_010240
         * @tc.number Security_HUKS_Cipher_API8_SM4_010240
         * @tc.desc   Security_HUKS_Cipher_API8_SM4_010240
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_SM4_010240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherSM4Size128PADDINGPKCS7MODEECBKeyAlias010';
            genHuksOptions.properties.splice(2, 1, HuksCipherSM4.HuksKeySM4Size128);
            genHuksOptions.properties.splice(3, 1, HuksCipherSM4.HuksKeySM4BLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherSM4.HuksKeySM4PADDINGPKCS7);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGPKCS7,
                    HuksCipherSM4.HuksKeySM4BLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
                ),
                inData: new Uint8Array(plainData240Bytes),
            };
            if (useSoftware) {
                await publicCipherFunc(srcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });
    });
}
