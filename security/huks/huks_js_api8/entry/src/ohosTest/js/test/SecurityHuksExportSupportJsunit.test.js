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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { HuksCipherRSA } from './utils/param/cipher/publicCipherParam';
import { checkSoftware, stringToUint8Array } from './utils/param/publicFunc';
import { HuksAgreeECDH, HuksKeyAlgX25519 } from './utils/param/agree/publicAgreeParam';
import { HuksSignVerifyDSA, HuksSignVerifyED25519, HuksSignVerifyRSA, HuksSignVerifySM2 } from './utils/param/signVerify/publicSignVerifyParam';
import { logger } from './utils/common/logger';
import * as huksCallback from './utils/param/huksCallback.js';

let gInData64 = 'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData64Array = stringToUint8Array(gInData64);
let useSoftware = true;

async function publicGenerateKeyFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.generateKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicExportKeyFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.exportKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test ExportKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicDeleteKeyFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.deleteKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export default function SecurityHuksExportSupportJsunit() {
    describe('SecurityHuksExportSupportJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        /**
         * @tc.name   Security_HUKS_Export_API8_0100
         * @tc.number Security_HUKS_Export_API8_0100
         * @tc.desc   Security_HUKS_Export_API8_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0100";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSASize512,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64Array,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                await publicExportKeyFunc(srcKeyAlias, HuksOptions);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0200
         * @tc.number Security_HUKS_Export_API8_0200
         * @tc.desc   Security_HUKS_Export_API8_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0200";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSASize768,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64Array,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                await publicExportKeyFunc(srcKeyAlias, HuksOptions);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0300
         * @tc.number Security_HUKS_Export_API8_0300
         * @tc.desc   Security_HUKS_Export_API8_0300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0300";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSASize1024,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64Array,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                await publicExportKeyFunc(srcKeyAlias, HuksOptions);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0400
         * @tc.number Security_HUKS_Export_API8_0400
         * @tc.desc   Security_HUKS_Export_API8_0400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0400";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0500
         * @tc.number Security_HUKS_Export_API8_0500
         * @tc.desc   Security_HUKS_Export_API8_0500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0500";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0600
         * @tc.number Security_HUKS_Export_API8_0600
         * @tc.desc   Security_HUKS_Export_API8_0600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0600";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0700
         * @tc.number Security_HUKS_Export_API8_0700
         * @tc.desc   Security_HUKS_Export_API8_0700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0700";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize224,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                await publicExportKeyFunc(srcKeyAlias, HuksOptions);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0800
         * @tc.number Security_HUKS_Export_API8_0800
         * @tc.desc   Security_HUKS_Export_API8_0800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0800";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_0900
         * @tc.number Security_HUKS_Export_API8_0900
         * @tc.desc   Security_HUKS_Export_API8_0900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_0900";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize384,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1000
         * @tc.number Security_HUKS_Export_API8_1000
         * @tc.desc   Security_HUKS_Export_API8_1000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1000";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize521,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1100
         * @tc.number Security_HUKS_Export_API8_1100
         * @tc.desc   Security_HUKS_Export_API8_1100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1100";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize224,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE,
                ),
                inData: gInData64Array,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                await publicExportKeyFunc(srcKeyAlias, HuksOptions);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1200
         * @tc.number Security_HUKS_Export_API8_1200
         * @tc.desc   Security_HUKS_Export_API8_1200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1200";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1300
         * @tc.number Security_HUKS_Export_API8_1300
         * @tc.desc   Security_HUKS_Export_API8_1300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1300";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize384,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1400
         * @tc.number Security_HUKS_Export_API8_1400
         * @tc.desc   Security_HUKS_Export_API8_1400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1400";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize521,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1500
         * @tc.number Security_HUKS_Export_API8_1500
         * @tc.desc   Security_HUKS_Export_API8_1500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1500";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA256
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1600
         * @tc.number Security_HUKS_Export_API8_1600
         * @tc.desc   Security_HUKS_Export_API8_1600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1600";
            let HuksOptions = {
                properties: new Array(
                    HuksKeyAlgX25519.HuksKeyAlgX25519,
                    HuksKeyAlgX25519.HuksKeyCURVE25519Size256,
                    HuksKeyAlgX25519.HuksKeyDIGEST,
                    HuksKeyAlgX25519.HuksKeyPADDING,
                    HuksKeyAlgX25519.HuksKeyPurposeAGREE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODE
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1700
         * @tc.number Security_HUKS_Export_API8_1700
         * @tc.desc   Security_HUKS_Export_API8_1700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1700";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                    HuksSignVerifyDSA.HuksKeySIZE1024
                ),
                inData: gInData64Array,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                await publicExportKeyFunc(srcKeyAlias, HuksOptions);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_1800
         * @tc.number Security_HUKS_Export_API8_1800
         * @tc.desc   Security_HUKS_Export_API8_1800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "Security_HUKS_Export_API8_1800";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifySM2.HuksKeySize256,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
            await publicExportKeyFunc(srcKeyAlias, HuksOptions);
            await publicDeleteKeyFunc(srcKeyAlias, HuksOptions)
            done();
        });

        /**
         * @tc.name   Security_HUKS_Export_API8_2000
         * @tc.number Security_HUKS_Export_API8_2000
         * @tc.desc   Security_HUKS_Export_API8_2000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Export_API8_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = '****'
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256,
                ),
                inData: gInData64Array,
            };
            await huksCallback.exportKey(srcKeyAlias, HuksOptions)
                .then((data) => {
                    logger.log(`test ExportKey data: ${JSON.stringify(data)}`);
                    expect(null).assertFail();
                })
                .catch((err) => {
                    logger.log('test ImportKey err information: ' + JSON.stringify(err));
                    expect(err.code == -13).assertTrue();
                });
            done();
        });
    });
}
