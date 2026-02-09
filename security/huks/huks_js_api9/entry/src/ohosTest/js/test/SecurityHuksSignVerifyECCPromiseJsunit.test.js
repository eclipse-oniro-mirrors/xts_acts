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
import { describe, it, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import Data from './utils/data.json';
import { HuksSignVerifyECC } from './utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array, checkSoftware } from './utils/param/publicFunc';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyPromise.js';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let finishOutData;
let srcData63AfterSha256 = new Uint8Array([
    0xD2, 0xE1, 0x24, 0x8F, 0x0D, 0xBB, 0x2F, 0x98, 0x64, 0x13, 0x27, 0xE0, 0x0D, 0xEA, 0x34, 0xBB,
    0x1D, 0x1C, 0xC2, 0xA1, 0xBE, 0x10, 0xF0, 0xB1, 0x6F, 0x8E, 0xDF, 0x9B, 0x42, 0xBA, 0x38, 0x5D,
]);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let useSoftware = true;
const srcData65Sha256 = new Uint8Array([
    0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
    0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF,
]);

export default function SecurityHuksSignVerifyECCPromiseJsunit() {
    describe('SecurityHuksSignVerifyECCPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ECC_101
         * @tc.number Security_HUKS_SignVerify_API9_ECC_101
         * @tc.desc   Security_HUKS_SignVerify_API9_ECC_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ECC_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData63AfterSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63AfterSha256);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63AfterSha256);
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ECC_102
         * @tc.number Security_HUKS_SignVerify_API9_ECC_102
         * @tc.desc   Security_HUKS_SignVerify_API9_ECC_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ECC_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData63AfterSha256,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63AfterSha256);
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ECC_103
         * @tc.number Security_HUKS_SignVerify_API9_ECC_103
         * @tc.desc   Security_HUKS_SignVerify_API9_ECC_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ECC_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Sha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ECC_104
         * @tc.number Security_HUKS_SignVerify_API9_ECC_104
         * @tc.desc   Security_HUKS_SignVerify_API9_ECC_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ECC_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Sha256,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Sha256);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize384SIGNNONE103
         * @tc.number testSignVerifyECCSize384SIGNNONE103
         * @tc.desc   testSignVerifyECCSize384SIGNNONE103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize384SIGNNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData65Sha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize521SIGNNONE103
         * @tc.number testSignVerifyECCSize521SIGNNONE103
         * @tc.desc   testSignVerifyECCSize521SIGNNONE103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize521SIGNNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize521SIGNNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: srcData65Sha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Sha256);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Sha256);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize256SIGNSHA1103
         * @tc.number testSignVerifyECCSize256SIGNSHA1103
         * @tc.desc   testSignVerifyECCSize256SIGNSHA1103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize256SIGNSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA1,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyECC.HuksKeyAlgECC,
                        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                        HuksSignVerifyECC.HuksTagECCDigestSHA1,
                        HuksSignVerifyECC.HuksKeyECCSize256
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize384SIGNSHA1103
         * @tc.number testSignVerifyECCSize384SIGNSHA1103
         * @tc.desc   testSignVerifyECCSize384SIGNSHA1103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize384SIGNSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA1,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyECC.HuksKeyAlgECC,
                        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                        HuksSignVerifyECC.HuksTagECCDigestSHA1,
                        HuksSignVerifyECC.HuksKeyECCSize384
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize521SIGNSHA1103
         * @tc.number testSignVerifyECCSize521SIGNSHA1103
         * @tc.desc   testSignVerifyECCSize521SIGNSHA1103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize521SIGNSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA1,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyECC.HuksKeyAlgECC,
                        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                        HuksSignVerifyECC.HuksTagECCDigestSHA1,
                        HuksSignVerifyECC.HuksKeyECCSize521
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize256SIGNSHA224103
         * @tc.number testSignVerifyECCSize256SIGNSHA224103
         * @tc.desc   testSignVerifyECCSize256SIGNSHA224103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize256SIGNSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA224,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyECC.HuksKeyAlgECC,
                        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                        HuksSignVerifyECC.HuksTagECCDigestSHA224,
                        HuksSignVerifyECC.HuksKeyECCSize256
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize384SIGNSHA224103
         * @tc.number testSignVerifyECCSize384SIGNSHA224103
         * @tc.desc   testSignVerifyECCSize384SIGNSHA224103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize384SIGNSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA224,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyECC.HuksKeyAlgECC,
                        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                        HuksSignVerifyECC.HuksTagECCDigestSHA224,
                        HuksSignVerifyECC.HuksKeyECCSize384
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize521SIGNSHA224103
         * @tc.number testSignVerifyECCSize521SIGNSHA224103
         * @tc.desc   testSignVerifyECCSize521SIGNSHA224103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize521SIGNSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA224,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyECC.HuksKeyAlgECC,
                        HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                        HuksSignVerifyECC.HuksTagECCDigestSHA224,
                        HuksSignVerifyECC.HuksKeyECCSize521
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize256SIGNSHA256103
         * @tc.number testSignVerifyECCSize256SIGNSHA256103
         * @tc.desc   testSignVerifyECCSize256SIGNSHA256103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize256SIGNSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize384SIGNSHA256103
         * @tc.number testSignVerifyECCSize384SIGNSHA256103
         * @tc.desc   testSignVerifyECCSize384SIGNSHA256103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize384SIGNSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize521SIGNSHA256103
         * @tc.number testSignVerifyECCSize521SIGNSHA256103
         * @tc.desc   testSignVerifyECCSize521SIGNSHA256103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize521SIGNSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize256SIGNSHA384103
         * @tc.number testSignVerifyECCSize256SIGNSHA384103
         * @tc.desc   testSignVerifyECCSize256SIGNSHA384103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize256SIGNSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize384SIGNSHA384103
         * @tc.number testSignVerifyECCSize384SIGNSHA384103
         * @tc.desc   testSignVerifyECCSize384SIGNSHA384103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize384SIGNSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize521SIGNSHA384103
         * @tc.number testSignVerifyECCSize521SIGNSHA384103
         * @tc.desc   testSignVerifyECCSize521SIGNSHA384103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize521SIGNSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize256SIGNSHA512103
         * @tc.number testSignVerifyECCSize256SIGNSHA512103
         * @tc.desc   testSignVerifyECCSize256SIGNSHA512103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize256SIGNSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize256SIGNSHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA512,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA512,
                    HuksSignVerifyECC.HuksKeyECCSize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize384SIGNSHA512103
         * @tc.number testSignVerifyECCSize384SIGNSHA512103
         * @tc.desc   testSignVerifyECCSize384SIGNSHA512103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize384SIGNSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA512,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA512,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   testSignVerifyECCSize521SIGNSHA512103
         * @tc.number testSignVerifyECCSize521SIGNSHA512103
         * @tc.desc   testSignVerifyECCSize521SIGNSHA512103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSignVerifyECCSize521SIGNSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyECCSize384SIGNSHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA512,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA512,
                    HuksSignVerifyECC.HuksKeyECCSize521
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

    });
}
