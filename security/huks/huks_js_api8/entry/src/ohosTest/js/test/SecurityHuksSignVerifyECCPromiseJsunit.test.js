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
import { HuksSignVerifyECC } from './utils/param/signVerify/publicSignVerifyParam';
import { checkSoftware, makeOptions, stringToUint8Array } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signVerify/publicSignVerifyPromise';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let srcData63AfterSha256 = new Uint8Array([
    0xD2, 0xE1, 0x24, 0x8F, 0x0D, 0xBB, 0x2F, 0x98, 0x64, 0x13, 0x27, 0xE0, 0x0D, 0xEA, 0x34, 0xBB,
    0x1D, 0x1C, 0xC2, 0xA1, 0xBE, 0x10, 0xF0, 0xB1, 0x6F, 0x8E, 0xDF, 0x9B, 0x42, 0xBA, 0x38, 0x5D,
]);
const srcData65Sha256 = new Uint8Array([
    0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
    0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF,
]);
let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);
let srcData63KbSha256 = new Uint8Array([
    0xDC, 0x3D, 0x92, 0xF4, 0xCB, 0xC6, 0xDC, 0xD3, 0x92, 0xDA, 0x2B, 0xB0, 0x23, 0x64, 0x61, 0x65,
    0x5D, 0x15, 0x0E, 0x84, 0xAE, 0x75, 0x09, 0x4E, 0x81, 0x3E, 0x88, 0x99, 0x84, 0x5B, 0xFB, 0x43
]);
let srcData63BSha256 = new Uint8Array([
    0xD2, 0xE1, 0x24, 0x8F, 0x0D, 0xBB, 0x2F, 0x98, 0x64, 0x13, 0x27, 0xE0, 0x0D, 0xEA, 0x34, 0xBB,
    0x1D, 0x1C, 0xC2, 0xA1, 0xBE, 0x10, 0xF0, 0xB1, 0x6F, 0x8E, 0xDF, 0x9B, 0x42, 0xBA, 0x38, 0x5D
]);
let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);
let srcData65KbSha256 = new Uint8Array([
    0xC0, 0x35, 0x45, 0x84, 0xD4, 0x77, 0xCF, 0x09, 0xAD, 0x33, 0xDD, 0xC4, 0xCC, 0xE0, 0xF1, 0xF9,
    0xD0, 0x73, 0x31, 0xB3, 0x97, 0x9D, 0xBA, 0x1E, 0xA8, 0x2D, 0x65, 0x81, 0x3C, 0x9F, 0x05, 0x1A
]);
let srcData65BSha256 = new Uint8Array([
    0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
    0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF,
]);
let baseHuksOptions = {};
let baseHuksOptions1 = {};
let baseHuksOptions2 = {};
let useSoftware = true;

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(HuksSignVerifyECC.HuksKeyAlgECC, HuksSignVerifyECC.HuksKeyECCPurposeSIGN),
    };
    baseHuksOptions1 = {
        properties: new Array(HuksSignVerifyECC.HuksKeyAlgECC, HuksSignVerifyECC.HuksKeyECCPurposeSIGN),
    };
    baseHuksOptions2 = {
        properties: new Array(HuksSignVerifyECC.HuksKeyAlgECC, HuksSignVerifyECC.HuksKeyECCPurposeVERIFY),
    };
}

export default function SecurityHuksSignVerifyECCPromiseJsunit() {
    describe('SecurityHuksSignVerifyECCPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_101
         * @tc.number Security_HUKS_SignVerify_API8_ECC_101
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData63AfterSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData63AfterSha256);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData63AfterSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_102
         * @tc.number Security_HUKS_SignVerify_API8_ECC_102
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData63AfterSha256,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData63AfterSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Sha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Sha256);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Sha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_104
         * @tc.number Security_HUKS_SignVerify_API8_ECC_104
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Sha256,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData65Sha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_102
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_102
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias102';
            let params = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_102
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_102
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias102';
            let params = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData63Byte);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData63Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_104
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_104
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias104';
            let params = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_104
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_104
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias104';
            let params = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData65Byte);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_101
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_101
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias101';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData63KbSha256);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63KbSha256);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63KbSha256);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_101
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_101
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias101';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData63BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData63BSha256);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize256);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData63BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNNONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65KbSha256);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65KbSha256);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65KbSha256);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNNONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize256);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size384SIGNNONE_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size384SIGNNONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size384SIGNNONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size384SIGNNONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize384);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize384);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size521SIGNNONE_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size521SIGNNONE_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size521SIGNNONE_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size521SIGNNONE_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize521);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65BSha256);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65BSha256);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestNONE, HuksSignVerifyECC.HuksKeyECCSize521);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65BSha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize256);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize384);
            if (useSoftware) {
                let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize384);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize521);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA1, HuksSignVerifyECC.HuksKeyECCSize521);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize256);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize384);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize384);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize521);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA224, HuksSignVerifyECC.HuksKeyECCSize521);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize256);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize384);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize384);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize521);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA256, HuksSignVerifyECC.HuksKeyECCSize521);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize256);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize384);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize384);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize521);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA384, HuksSignVerifyECC.HuksKeyECCSize521);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size224SIGNSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize224SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize224);
                HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size256SIGNSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize256);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size384SIGNSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize384);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize384);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ECC_Size521SIGNSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let paramsFirst = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize521);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, paramsFirst, srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            let paramsSecond = new Array(HuksSignVerifyECC.HuksTagECCDigestSHA512, HuksSignVerifyECC.HuksKeyECCSize521);
            HuksOptions = makeOptions(baseHuksOptions2, 2, paramsSecond, finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });
    });
}
