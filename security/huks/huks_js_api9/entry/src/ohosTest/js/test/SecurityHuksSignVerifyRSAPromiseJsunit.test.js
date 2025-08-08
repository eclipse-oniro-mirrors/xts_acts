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
import { HuksSignVerifyRSA } from './utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array, checkSoftware } from './utils/param/publicFunc';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyPromise.js';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let useSoftware = true;
let srcData65KbSha256 = new Uint8Array([
    0x23, 0xF8, 0x94, 0xEA, 0xEE, 0x1C, 0x70, 0xA9, 0x33, 0x82, 0x6C, 0xCF, 0xEF, 0x2D, 0x41, 0x6F,
    0x64, 0xF6, 0x46, 0xD4, 0xCD, 0xD4, 0x5C, 0x33, 0x84, 0x4D, 0x53, 0x4A, 0x1D, 0xF0, 0xE7, 0xDF
]);

export default function SecurityHuksSignVerifyRSAPromiseJsunit() {
    describe('SecurityHuksSignVerifyRSAPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        it('Security_HUKS_SignVerify_API9_RSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData63Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63Kb);
            done();
        });
        it('Security_HUKS_SignVerify_API9_RSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData63Kb,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
            done();
        });
        it('Security_HUKS_SignVerify_API9_RSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1MD5KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize2048
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });
        it('Security_HUKS_SignVerify_API9_RSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Kb);
            done();
        });
        it('testSignVerifyRSASize2048SIGNPKCS1NONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1NONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65KbSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65KbSha256);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65KbSha256);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPKCS1SHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize2048
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize2048SIGNPKCS1SHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize2048
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize2048SIGNPKCS1SHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA256KeyAlias103';
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
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

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
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPKCS1SHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA384KeyAlias103';
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
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

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
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPKCS1SHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPKCS1SHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSMD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSMD5KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize2048
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65KbSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65KbSha256);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65KbSha256);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize2048
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSSHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize2048
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSSHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSSHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize2048SIGNPSSSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize2048SIGNPSSSHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize2048
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1MD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1MD5KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize3072
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1NONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1NONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65KbSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65KbSha256);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65KbSha256);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1SHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize3072
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1SHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize3072
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1SHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1SHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPKCS1SHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPKCS1SHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSMD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSMD5KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize3072
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65KbSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65KbSha256);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65KbSha256);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize3072
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSSHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize3072
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSSHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSSHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize3072SIGNPSSSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize3072SIGNPSSSHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize3072
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1MD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1MD5KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize4096
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1NONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1NONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65KbSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65KbSha256);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65KbSha256);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1SHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize4096
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1SHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                        HuksSignVerifyRSA.HuksKeyRSASize4096
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1SHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1SHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPKCS1SHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSMD5103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSMD5KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize4096
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSNONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSNONEKeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65KbSha256,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65KbSha256);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65KbSha256);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSSHA1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA1,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize4096
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSSHA224103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSSHA224KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyRSA.HuksKeyAlgRSA,
                        HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA224,
                        HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                        HuksSignVerifyRSA.HuksKeyRSASize4096
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSSHA256103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSSHA256KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSSHA384103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSSHA384KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA384,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('testSignVerifyRSASize4096SIGNPSSSHA512103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPSSSHA512KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPSS,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });
    });
}
