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
import { HuksSignVerifyDSA } from './utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array, checkSoftware } from './utils/param/publicFunc';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyPromise.js';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let useSoftware = true;

export default function SecurityHuksSignVerifyDSAPromiseJsunit() {
    describe('SecurityHuksSignVerifyDSAPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_DSA_101
         * @tc.number Security_HUKS_SignVerify_API9_DSA_101
         * @tc.desc   Security_HUKS_SignVerify_API9_DSA_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_DSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63Kb);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_DSA_102
         * @tc.number Security_HUKS_SignVerify_API9_DSA_102
         * @tc.desc   Security_HUKS_SignVerify_API9_DSA_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_DSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63Kb,
            };
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_DSA_103
         * @tc.number Security_HUKS_SignVerify_API9_DSA_103
         * @tc.desc   Security_HUKS_SignVerify_API9_DSA_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_DSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksKeySIZE1024
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_DSA_104
         * @tc.number Security_HUKS_SignVerify_API9_DSA_104
         * @tc.desc   Security_HUKS_SignVerify_API9_DSA_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_DSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyDSASIGNSHA1KeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData65Kb,
            };
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Kb);
            }
            done();
        });
    });
}
