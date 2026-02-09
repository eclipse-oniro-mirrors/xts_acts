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
import { HuksSignVerifyDSA } from './utils/param/signVerify/publicSignVerifyParam';
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
        properties: new Array(HuksSignVerifyDSA.HuksKeyAlgDSA),
        inData: new Array(),
    };
}


export default function SecurityHuksSignVerifyDSACallbackJsunit() {
    describe('SecurityHuksSignVerifyDSACallbackJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_001
         * @tc.number Security_HUKS_SignVerify_API8_DSA_001
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias001';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_002
         * @tc.number Security_HUKS_SignVerify_API8_DSA_002
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63Kb,
            };
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_003
         * @tc.number Security_HUKS_SignVerify_API8_DSA_003
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias003';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksKeySIZE1024
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_004
         * @tc.number Security_HUKS_SignVerify_API8_DSA_004
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias004';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_002
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_002
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias002';
            let first = new Array(HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN, HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 1, first, srcData63Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_004
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_004
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias004';
            let first = new Array(HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN, HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 1, first, srcData65Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_001
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_001
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias001';
            let firstParams = new Array(HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN, HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 1, firstParams, srcData63Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
                await resetOptions();
                let second = new Array(
                    HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                    HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
                );
                HuksOptions = makeOptions(baseHuksOptions, 1, second, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_003
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_003
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias003';
            let firstParams = new Array(HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN, HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 1, firstParams, srcData65Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
                await resetOptions();
                let second = new Array(
                    HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                    HuksSignVerifyDSA.HuksKeySIZE1024
                );
                HuksOptions = makeOptions(baseHuksOptions, 1, second, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            }
            done();
        });
    });
}
