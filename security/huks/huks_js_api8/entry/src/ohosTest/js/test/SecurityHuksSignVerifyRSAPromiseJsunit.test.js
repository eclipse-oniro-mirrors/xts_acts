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
import Data from './utils/common/data';
import { HuksSignVerifyRSA } from './utils/param/signVerify/publicSignVerifyParam';
import { checkSoftware, makeOptions, stringToUint8Array } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signVerify/publicSignVerifyPromise';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;

let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);
let srcData63BSha256 = new Uint8Array([
    0xD2, 0xE1, 0x24, 0x8F, 0x0D, 0xBB, 0x2F, 0x98, 0x64, 0x13, 0x27, 0xE0, 0x0D, 0xEA, 0x34, 0xBB,
    0x1D, 0x1C, 0xC2, 0xA1, 0xBE, 0x10, 0xF0, 0xB1, 0x6F, 0x8E, 0xDF, 0x9B, 0x42, 0xBA, 0x38, 0x5D
]);
let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);
let srcData65BSha256 = new Uint8Array([
    0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
    0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF,
]);
let srcDataHash65 = new Uint8Array([
    0xC0, 0x35, 0x45, 0x84, 0xD4, 0x77, 0xCF, 0x09, 0xAD, 0x33, 0xDD, 0xC4, 0xCC, 0xE0, 0xF1, 0xF9,
    0xD0, 0x73, 0x31, 0xB3, 0x97, 0x9D, 0xBA, 0x1E, 0xA8, 0x2D, 0x65, 0x81, 0x3C, 0x9F, 0x05, 0x1A
])
let baseHuksOptions = {};
let baseHuksOptions1 = {};
let baseHuksOptions2 = {};
let useSoftware = true;

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(HuksSignVerifyRSA.HuksKeyAlgRSA, HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN),
    };
    baseHuksOptions1 = {
        properties: new Array(HuksSignVerifyRSA.HuksKeyAlgRSA, HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN),
    };
    baseHuksOptions2 = {
        properties: new Array(HuksSignVerifyRSA.HuksKeyAlgRSA, HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY),
    };
}

export default function SecurityHuksSignVerifyRSAPromiseJsunit() {
    describe('SecurityHuksSignVerifyRSAPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_101
         * @tc.number Security_HUKS_SignVerify_API8_RSA_101
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData63Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_102
         * @tc.number Security_HUKS_SignVerify_API8_RSA_102
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData63Kb,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_104
         * @tc.number Security_HUKS_SignVerify_API8_RSA_104
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_102
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_102
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias102';
            let params = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_102
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_102
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1NONEKeyAlias102';
            let params = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData63BSha256);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData63BSha256);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_104
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_104
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias104';
            let params = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_104
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_104
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1NONEKeyAlias104';
            let params = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData65BSha256);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData65BSha256);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_101
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_101
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias101';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData63Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_101
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_101
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1SHA1KeyAlias101';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData63Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData63Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData63Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1NONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1NONEKeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcDataHash65);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcDataHash65);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcDataHash65);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1SHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1SHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1SHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1PSSSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1PSSSHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1MD5_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1MD5_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1MD5_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1MD5_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1MD5KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1NONE_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1NONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1NONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1NONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1NONEKeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65BSha256);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1SHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1SHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1SHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1SHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1SHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1SHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size768SIGNPKCS1PSSSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize768SIGNPKCS1PSSSHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize768
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize768
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1MD5_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1MD5_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1MD5_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1MD5_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1MD5KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize1024
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1NONE_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1NONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1NONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1NONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1NONEKeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1SHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize1024
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1SHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize1024
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1SHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1SHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1SHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1SHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize1024
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize1024
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size1024SIGNPKCS1PSSSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize1024SIGNPKCS1PSSSHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize1024
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1MD5_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1MD5_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1MD5_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1MD5_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1MD5KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1NONE_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1NONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1NONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1NONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1NONEKeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1SHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size2048SIGNPKCS1PSSSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize2048SIGNPKCS1PSSSHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize2048
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1MD5_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1MD5_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1MD5_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1MD5_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1MD5KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1NONE_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1NONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1NONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1NONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1NONEKeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1SHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1SHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1SHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1SHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1SHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1SHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size3072SIGNPKCS1PSSSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize3072SIGNPKCS1PSSSHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize3072
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1MD5_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1MD5_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1MD5_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1MD5_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1MD5KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1NONE_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1NONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1NONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1NONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1NONEKeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1SHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA1KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA224KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                );
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA256KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);

            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA384KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size4096SIGNPKCS1PSSSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1PSSSHA512KeyAlias103';
            let params1 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let params2 = new Array(
                HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                HuksSignVerifyRSA.HuksKeyRSASize4096
            );
            HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });
    });
}
