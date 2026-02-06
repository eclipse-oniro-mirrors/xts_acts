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
import {
    publicCipher,
    publicCipherFunc,
    publicDeleteKeyFunc,
    publicExportKeyFunc,
    publicFinishAbortFunc,
    publicGenerateKeyFunc,
    publicImportKeyFunc,
    publicInitFunc,
    publicUpdateFunc,
    resetValue
} from './utils/param/cipher/publicCipherPromise';
import { HksKeyDigest, HksTag } from './utils/param/publicParam';

let defaultData = '0';
let gInData5 = 'RSA_5';
let gInData14 = 'RSA_14_ttttttt';
let gInData32 = 'RSA_32_ttttttttttttttttttttttttt';
let gInData64 = 'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData12 = 'RSA_12_ttttt';
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

let gInData5Array = stringToUint8Array(gInData5);
let gInData14Array = stringToUint8Array(gInData14);
let gInData32Array = stringToUint8Array(gInData32);
let gInData64Array = stringToUint8Array(gInData64);
let gInData12Array = stringToUint8Array(gInData12);
let gInData96Array = stringToUint8Array(gInData96);
let gInData128Array = stringToUint8Array(gInData128);
let gInData256Array = stringToUint8Array(gInData256);
let gInData384Array = stringToUint8Array(gInData384);
let gInData512Array = stringToUint8Array(gInData512);

let HuksOptions;
let useSoftware = true;

let genHuksOptions = {
    properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize4096),
    inData: new Uint8Array(defaultData),
};
let updateResult = new Array();
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

export default function SecurityHuksCipherRSAPromiseJsunit() {
    describe('SecurityHuksCipherRSAPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetValue();
            genHuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurpose,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: stringToUint8Array('0'),
            };
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData32Array,
            };
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            genHuksOptions = {
                properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize4096),
                inData: new Uint8Array(defaultData),
            };
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            HuksOptions = {
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
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
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
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            genHuksOptions = {
                properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize4096),
                inData: new Uint8Array(defaultData),
            };
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            HuksOptions = {
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
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias103';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias103';
            genHuksOptions = {
                properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize4096),
                inData: new Uint8Array(defaultData),
            };
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            HuksOptions = {
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
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
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
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias104';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias104';
            genHuksOptions = {
                properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize4096),
                inData: new Uint8Array(defaultData),
            };
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
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
            await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1015
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1015
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1015
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1015';
            HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
            await publicInitFunc(newSrcKeyAlias, HuksOptions, -13);
            await publicUpdateFunc(HuksOptions, -13);
            await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1016
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1016
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
            await publicUpdateFunc(HuksOptions, -13);
            await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1017
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1017
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1017
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
            await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1018
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1018
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1018
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
            await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1019
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1019
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1019
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1019';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1019';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let inputInData = HuksOptions.inData;
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                HuksOptions.inData = inputInData;
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -21);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1020
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1020
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1020
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1020';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1020';
            let inputInData = HuksOptions.inData;
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                HuksOptions.inData = inputInData;
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1021
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1021
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1021
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1021';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1021';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1022
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1022
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1022
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1022';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1022';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1023
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1023
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1023
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1023';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1023';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1024
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1024
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1024
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1024';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1024';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1025
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1025
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1025
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1025';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1025';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1026
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1026
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1026
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1026';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1026';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1027
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1027
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1027
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1027';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1027';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1028
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1028
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1028
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1028';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1028';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1029
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1029
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1029
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1029';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1029';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1030
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1030
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1030
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1030';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1030';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1031
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1031
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1031
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1031';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1031';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1032
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1032
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1032
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1032';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1032';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1033
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1033
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1033
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1033';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1033';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1034
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1034
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1034
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1034';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1034';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1035
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1035
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1035
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1035';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1035';
            let inputInData = HuksOptions.inData;
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                HuksOptions.inData = inputInData;
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1036
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1036
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1036
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1036';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1036';
            let inputInData = HuksOptions.inData;
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                HuksOptions.inData = inputInData;
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', true, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1037
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1037
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1037
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1037';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1037';
            let inputInData = HuksOptions.inData;
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                HuksOptions.inData = inputInData;
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = inputInData;
                await publicUpdateFunc(HuksOptions, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1038
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1038
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1038
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1038';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1038';
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
                await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
                HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
                await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', true, -31);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1039
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1039
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1039
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1039';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1039';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1040
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1040
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1040
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1040';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1040';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1041
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1041
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1041
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1041';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1041';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1042
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1042
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1042
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1042';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1042';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1043
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1043
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1043
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1043';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1043';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -21);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1044
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1044
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1044
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1044';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1044';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1045
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1045
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1045
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1045';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1045';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1046
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1046
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1046
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1046';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1046';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicUpdateFunc(HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1047
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1047
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1047
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1047';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1047';
            if (useSoftware) {
                updateResult =  await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1048
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1048
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1048
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1048';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1048';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1049
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1049
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1049
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1049';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1049';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1050
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1050
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1050
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1050';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1050';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicUpdateFunc(HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1051
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1051
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1051
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1051';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1051';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1052
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1052
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1052
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1052';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1052';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicUpdateFunc(HuksOptions, -13);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1053
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1053
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1053
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1053';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1053';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1054
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1054
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1054
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1054';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1054';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1055
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1055
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1055
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1055';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1055';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1056
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1056
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1056
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1056';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1056';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1057
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1057
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1057
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1057';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1057';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1058
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1058
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1058
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1058';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1058';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1059
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1059
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1059
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1059';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1059';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1060
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1060
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1060
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1060';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1060';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'abort', false, 0);
                await publicUpdateFunc(HuksOptions, -13);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1061
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1061
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1061
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1061';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1061';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                HuksOptions.inData = new Uint8Array(updateResult);
                HuksOptions.outData = stringToUint8Array('0');
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_abnormal_1062
         * @tc.number Security_HUKS_Cipher_API8_abnormal_1062
         * @tc.desc   Security_HUKS_Cipher_API8_abnormal_1062
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_abnormal_1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Cipher_API8_abnormal_1062';
            const newSrcKeyAlias = 'security_huks_third_abnormal_cipher_new_1062';
            if (useSoftware) {
                updateResult = await publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = new Uint8Array(updateResult);
                await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
                await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
                await publicUpdateFunc(HuksOptions, 0);
                await publicFinishAbortFunc(HuksOptions, 'finish', false, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGNONESHA256_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGPKCS1_V1_5SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData14Array);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData14Array);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData5Array);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size512PADDINGOAEPSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize512PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData5Array);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGNONESHA256_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGPKCS1_V1_5SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData12Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size768PADDINGOAEPSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize768PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize768);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData12Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize768);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias101';
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
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGNONESHA256_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGNONESHA256NewKeyAlias101';
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData128Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGPKCS1_V1_5SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size1024PADDINGOAEPSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize1024PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize1024);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize1024);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias101';
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
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGNONESHA256_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGPKCS1_V1_5SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA384KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA384NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA384KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA384NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA512KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA512NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size2048PADDINGOAEPSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA512KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize2048PADDINGOAEPSHA512NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize2048);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
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
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
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
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGNONESHA256_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGPKCS1_V1_5SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA512KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA512NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size3072PADDINGOAEPSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA512KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize3072PADDINGOAEPSHA512NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize3072);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
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
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_102
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_102
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
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
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_104
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_104
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGNONESHA256_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
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
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGPKCS1_V1_5SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA1KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA1NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA1);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA1
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA1
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA224KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA224NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA224);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA224
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            if (useSoftware) {
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
                await resetOptions();
                let second = new Array(
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA224
                );
                HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
                HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
                updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA256
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA384KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA384NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA384KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA384NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA384
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_101
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_101
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA512KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA512NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_103
         * @tc.number Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_103
         * @tc.desc   Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API8_RSA_Size4096PADDINGOAEPSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA512KeyAlias101';
            const newSrcKeyAlias = 'testCipherRSASize4096PADDINGOAEPSHA512NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let first = new Array(
                HuksCipherRSA.HuksKeyPurposeENCRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 3, first, gInData32Array);
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', true);
            await resetOptions();
            let second = new Array(
                HuksCipherRSA.HuksKeyPurposeDECRYPT,
                HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                HuksCipherRSA.HuksKeyRSADIGESTSHA512
            );
            HuksOptions = makeOptions(baseHuksOptions, 3, second, new Uint8Array(updateResult));
            HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyRSASize4096);
            updateResult = await publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1007
         * @tc.number Security_HUKS_errorCode_API8_1007
         * @tc.desc   Security_HUKS_errorCode_API8_1007
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1007', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_007';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64,
            };
            let HuksOptions2 = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    { tag: HksTag.HKS_TAG_DIGEST, value: HksKeyDigest.HKS_DIGEST_SHA384 }
                ),
                inData: gInData64,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicExportKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicImportKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
                await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1014
         * @tc.number Security_HUKS_errorCode_API8_1014
         * @tc.desc   Security_HUKS_errorCode_API8_1014
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1014', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_014';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64,
            };
            let HuksOptions2 = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS7,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicExportKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicImportKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
                await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1019
         * @tc.number Security_HUKS_errorCode_API8_1019
         * @tc.desc   Security_HUKS_errorCode_API8_1019
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1019', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_019';
            let HuksOptions1 = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64,
            };
            let HuksOptions2 = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS7,
                    HuksCipherRSA.HuksKeyRSADIGESTNONE
                ),
                inData: gInData64,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicExportKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicImportKeyFunc(srcKeyAliasFirst, HuksOptions1);
                await publicInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
                await publicDeleteKeyFunc(srcKeyAliasFirst, HuksOptions1, 0);
            }
            done();
        });
    });
}
