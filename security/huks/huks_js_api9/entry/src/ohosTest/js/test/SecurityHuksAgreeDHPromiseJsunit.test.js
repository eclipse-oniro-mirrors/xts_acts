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
import huks from '@ohos.security.huks';
import { describe, it, beforeAll, expect, TestType, Size, Level } from '@ohos/hypium';
import * as Data from './utils/data.json';
import { stringToUint8Array, checkSoftware } from './utils/param/publicFunc';
import { HuksAgreeDH } from './utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from './utils/param/agree/publicAgreePromise';
import { HksTag } from './utils/param/publicParam';
import { checkAESChiper } from './utils/param/checkAES';

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let HuksOptions2048 = {
    properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
    inData: srcData65Kb,
};

let IV = '0000000000000000';
let huksOptionsCipher = {
    properties: new Array(
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECBC,
        { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
    ),
};

function makehuksOptionsFinish(srcKeyAliesFirst) {
    let huksOptionsFinish = {
        properties: new Array(
            HuksAgreeDH.HuksKeySTORAGE,
            HuksAgreeDH.HuksKeyISKEYALIAS,
            HuksAgreeDH.HuksKeyALGORITHMAES,
            HuksAgreeDH.HuksKeySIZE256,
            HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
            HuksAgreeDH.HuksKeyDIGESTNONE,
            {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesFirst),
            },
            HuksAgreeDH.HuksKeyPADDINGNONE,
            HuksAgreeDH.HuksKeyBLOCKMODECBC
        ),
        inData: srcData65Kb,
    };
    return huksOptionsFinish;
}

function makehuksOptionsDerive(srcKeyAliesFirst) {
    let huksOptionsFinish = {
        properties: new Array(
            HuksAgreeDH.HuksKeyALGORITHMAES,
            HuksAgreeDH.HuksKeyPurposeDERIVE,
            HuksAgreeDH.HuksKeyDIGESTSHA256,
            HuksAgreeDH.HuksKeySIZE256,
            HuksAgreeDH.HuksKeyPADDINGNONE,
            HuksAgreeDH.HuksKeyBLOCKMODECBC,
            {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesFirst),
            },
            HuksAgreeDH.HuksKeySTORAGE,
            HuksAgreeDH.HuksKeyISKEYALIAS,
        ),
        inData: srcData65Kb,
    };
    return huksOptionsFinish;
}

function makehuksOptionsHmac(srcKeyAliesFirst) {
    let huksOptionsFinish = {
        properties: new Array(
            HuksAgreeDH.HuksKeyALGORITHMHMAC,
            HuksAgreeDH.HuksKeyPurposeMAC,
            HuksAgreeDH.HuksKeyDIGESTSHA256,
            HuksAgreeDH.HuksKeySIZE256,
            HuksAgreeDH.HuksKeyPADDINGNONE,
            HuksAgreeDH.HuksKeyBLOCKMODECBC,
            {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesFirst),
            },
            HuksAgreeDH.HuksKeySTORAGE,
            HuksAgreeDH.HuksKeyISKEYALIAS,
        ),
        inData: srcData65Kb,
    };
    return huksOptionsFinish;
}

export default function SecurityHuksAgreeDHPromiseJsunit() {
    describe('SecurityHuksAgreeDHPromiseJsunit', function () {
        beforeAll(async function (done) {
            done();
        })

        /**
         * @tc.name   Security_HUKS_Agree_API9_DH_101
         * @tc.number Security_HUKS_Agree_API9_DH_101
         * @tc.desc   Security_HUKS_Agree_API9_DH_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API9_DH_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_02_101';
            let HuksOptions63kb = {
                properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH,
                    HuksAgreeDH.HuksKeyDHSize2048),
                // inData: srcData63Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE128,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array("unset"),
                    },
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODECBC,
                ),
            };
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'finish',
                false);
            //AES check
            let res = await checkAESChiper(srcKeyAliesFirst + 'final', srcKeyAliesSecond + 'final', huksOptionsCipher);
            expect(res).assertTrue();
            done();
        });

        //abort
        /**
         * @tc.name   Security_HUKS_Agree_API9_DH_102
         * @tc.number Security_HUKS_Agree_API9_DH_102
         * @tc.desc   Security_HUKS_Agree_API9_DH_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API9_DH_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_101';
            let HuksOptions63kb = {
                properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH,
                    HuksAgreeDH.HuksKeyDHSize2048),
                inData: srcData63Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODEECB
                ),
                inData: srcData63Kb,
            };
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API9_DH_103
         * @tc.number Security_HUKS_Agree_API9_DH_103
         * @tc.desc   Security_HUKS_Agree_API9_DH_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API9_DH_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = makehuksOptionsFinish(srcKeyAliesFirst);
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish',
                true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API9_DH_104
         * @tc.number Security_HUKS_Agree_API9_DH_104
         * @tc.desc   Security_HUKS_Agree_API9_DH_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API9_DH_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_02_101';
            let HuksOptions63kb = {
                properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH,
                    HuksAgreeDH.HuksKeyDHSize3072),
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array("unset"),
                    },
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODECBC,
                ),
            };
            if (await checkSoftware()) {
                await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'finish',
                    false);
                //AES check
                let res =
                    await checkAESChiper(srcKeyAliesFirst + 'final', srcKeyAliesSecond + 'final', huksOptionsCipher);
                expect(res).assertTrue();
            } else {
                try {
                    await huks.generateKeyItem(srcKeyAliesFirst, HuksOptions63kb);
                    expect(null).assertFail();
                } catch (error) {
                    expect(error.code).assertEqual(12000003);
                }
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API9_DH_105
         * @tc.number Security_HUKS_Agree_API9_DH_105
         * @tc.desc   Security_HUKS_Agree_API9_DH_105
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API9_DH_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_02_101';
            let HuksOptions63kb = {
                properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH,
                    HuksAgreeDH.HuksKeyDHSize4096),
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array("unset"),
                    },
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODECBC,
                ),
            };
            if (await checkSoftware()) {
                await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'finish',
                    false);
                //AES check
                let res =
                    await checkAESChiper(srcKeyAliesFirst + 'final', srcKeyAliesSecond + 'final', huksOptionsCipher);
                expect(res).assertTrue();
            } else {
                try {
                    await huks.generateKeyItem(srcKeyAliesFirst, HuksOptions63kb);
                    expect(null).assertFail();
                } catch (error) {
                    expect(error.code).assertEqual(12000003);
                }
            }
            done();
        });

        /**
         * @tc.name   testAgreeDHSize2048Finish65KBAgree108
         * @tc.number testAgreeDHSize2048Finish65KBAgree108
         * @tc.desc   testAgreeDHSize2048Finish65KBAgree108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testAgreeDHSize2048Finish65KBAgree108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_108';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_108';
            let huksOptionsFinish = makehuksOptionsDerive(srcKeyAliesFirst);
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish',
                true);
            done();
        });

        /**
         * @tc.name   testAgreeDHSize2048Finish65KBAgree130
         * @tc.number testAgreeDHSize2048Finish65KBAgree130
         * @tc.desc   testAgreeDHSize2048Finish65KBAgree130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testAgreeDHSize2048Finish65KBAgree130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_130';
            const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_130';
            let huksOptionsFinish = makehuksOptionsHmac(srcKeyAliesFirst);
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish',
                true);
            done();
        });
    });
}
