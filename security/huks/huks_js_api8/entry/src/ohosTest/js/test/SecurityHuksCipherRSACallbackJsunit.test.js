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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '@ohos/hypium';
import { HuksCipherRSA } from './utils/param/cipher/publicCipherParam';
import { checkSoftware, makeOptions, stringToUint8Array } from './utils/param/publicFunc';
import { publicCipherFunc } from './utils/param/cipher/publicCipherCallback';

let defaultData = '0';
let gInData64 = 'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData96 = 'RSA_96_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' + 'tttttttttttttttttttttttttttttttt';
let gInData128 = 'RSA_128_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData256 =
    'RSA_256_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData384 =
    'RSA_384_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData512 =
    'RSA_512_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let updateResult = new Array();

let gInData64Array = stringToUint8Array(gInData64);
let gInData96Array = stringToUint8Array(gInData96);
let gInData128Array = stringToUint8Array(gInData128);
let gInData256Array = stringToUint8Array(gInData256);
let gInData384Array = stringToUint8Array(gInData384);
let gInData512Array = stringToUint8Array(gInData512);

let baseHuksOptions = {};

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(
            HuksCipherRSA.HuksKeyAlgRSA,
            HuksCipherRSA.HuksKeyRSASize512,
            HuksCipherRSA.HuksKeyRSABLOCKMODEECB
        ),
        inData: new Array(),
    };
}

let genHuksOptions = {
    properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize512),
    inData: new Uint8Array(defaultData),
};

let useSoftware = true

let genHuksOptions4096 = {
    properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurpose,
        HuksCipherRSA.HuksKeyRSASize4096
    ),
    inData: new Uint8Array(new Array()),
};


export default function SecurityHuksCipherRSACallbackJsunit() {
    describe('SecurityHuksCipherRSACallbackJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        });
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   security_HUKS_Cipher_API8_RSA_001
         * @tc.number security_HUKS_Cipher_API8_RSA_001
         * @tc.desc   security_HUKS_Cipher_API8_RSA_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('security_HUKS_Cipher_API8_RSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions4096.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions4096.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions4096.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions4096, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions4096, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   security_HUKS_Cipher_API8_RSA_002
         * @tc.number security_HUKS_Cipher_API8_RSA_002
         * @tc.desc   security_HUKS_Cipher_API8_RSA_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('security_HUKS_Cipher_API8_RSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions4096, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias003';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias003';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions4096, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions4096, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   security_HUKS_Cipher_API8_RSA_004
         * @tc.number security_HUKS_Cipher_API8_RSA_004
         * @tc.desc   security_HUKS_Cipher_API8_RSA_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('security_HUKS_Cipher_API8_RSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias004';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias004';
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions4096, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_001
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_001
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData64Array);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            }
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_002
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_002
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData64Array);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias001';

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData64Array);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            }
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_004
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_004
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData64Array);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_001
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_001
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData96Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            }
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_002
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_002
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData96Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData96Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            }
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_004
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_004
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData96Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_001
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_001
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData128Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            }
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_002
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_002
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData128Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData128Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            }
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_004
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_004
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData128Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_001
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_001
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData256Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_002
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_002
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData256Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData256Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_004
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_004
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData256Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_001
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_001
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData384Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_002
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_002
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData384Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData384Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_004
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_004
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData384Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_001
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_001
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData512Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_002
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_002
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData512Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult =
                    await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_003
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_003
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias001';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData512Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_004
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_004
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias001';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData512Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult =
                await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });
    });
}
