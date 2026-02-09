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
import { publicSignVerifyFunc } from './utils/param/signVerify/publicSignVerifyCallback';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let baseHuksOptions = {};
let useSoftware = true;

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(HuksSignVerifyRSA.HuksKeyAlgRSA),
        inData: new Array(),
    };
}

export default function SecurityHuksSignVerifyRSACallbackJsunit() {
    describe('SecurityHuksSignVerifyRSACallbackJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_001
         * @tc.number Security_HUKS_SignVerify_API8_RSA_001
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias001';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData63Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
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
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_002
         * @tc.number Security_HUKS_SignVerify_API8_RSA_002
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA512,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData63Kb,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_003
         * @tc.number Security_HUKS_SignVerify_API8_RSA_003
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias003';
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
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
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
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_004
         * @tc.number Security_HUKS_SignVerify_API8_RSA_004
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize4096SIGNPKCS1SHA512KeyAlias004';
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
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_002
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_002
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias002';
            let first = new Array(
                HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData63Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_004
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_004
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias004';
            let first = new Array(
                HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_001
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_001
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias001';
            let first = new Array(
                HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 1, first, srcData63Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
                await resetOptions();
                let second = new Array(
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions, 1, second, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_003
         * @tc.number Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_003
         * @tc.desc   Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_RSA_Size512SIGNPKCS1MD5_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyRSASize512SIGNPKCS1MD5KeyAlias003';
            let first = new Array(
                HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            );
            let HuksOptions = makeOptions(baseHuksOptions, 1, first, srcData65Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
                await resetOptions();
                let second = new Array(
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize512
                );
                HuksOptions = makeOptions(baseHuksOptions, 1, second, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            }
            done();
        });
    });
}
