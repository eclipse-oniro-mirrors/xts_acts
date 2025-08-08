/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { HuksCipherRSA } from './utils/param/cipher/publicCipherParam';
import { stringToUint8Array, checkSoftware } from './utils/param/publicFunc';
import huks from '@ohos.security.huks';
import { HuksKeyAlgX25519, HuksAgreeECDH } from './utils/param/agree/publicAgreeParam';
import {
    HuksSignVerifySM2,
    HuksSignVerifyED25519,
    HuksSignVerifyRSA,
    HuksSignVerifyDSA
} from './utils/param/signverify/publicSignverifyParam';

let gInData64 = 'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData64Array = stringToUint8Array(gInData64);
let useSoftware = true;

async function publicGenerateKeyItemFunc(keyAlias, huksOptions) {
    console.info(`enter callback generateKeyItem`);
    try {
        await generateKeyItem(keyAlias, huksOptions)
            .then((data) => {
                console.info(`callback: generateKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`callback: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function generateKeyItem(keyAlias, huksOptions) {
    return new Promise((resolve, reject) => {
        try {
            huks.generateKeyItem(keyAlias, huksOptions, function (error, data) {
                if (error) {
                    reject(error);
                } else {
                    resolve(data);
                }
            });
        } catch (error) {
            expect(null).assertFail();
        }
    });
}

async function publicExportKeyItem(srcKeyAlies, HuksOptions) {
    console.info(`enter callback export`);
    try {
        await exportKeyItem(srcKeyAlies, HuksOptions)
            .then((data) => {
                console.info(`callback: exportKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`callback: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function exportKeyItem(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        try {
            huks.exportKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
                if (error) {
                    reject(error);
                } else {
                    resolve(data);
                }
            });
        } catch (error) {
            expect(null).assertFail();
        }
    });
}

async function publicDeleteKeyItem(KeyAlias, HuksOptions) {
    console.info(`enter callback deleteKeyItem`);
    try {
        await deleteKeyItem(KeyAlias, HuksOptions)
            .then((data) => {
                console.info(`callback: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`callback: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function deleteKeyItem(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        try {
            huks.deleteKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
                if (error) {
                    reject(error);
                } else {
                    resolve(data);
                }
            });
        } catch (error) {
            expect(null).assertFail();
        }
    });
}

export default function SecurityHuksExportJsunit() {
    describe('SecurityHuksExportJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        // HKS_SUPPORT_SM4_CBC_NOPADDING
        it('Security_HUKS_Export_API9_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0100";
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
                await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
                await publicExportKeyItem(srcKeyAlies, HuksOptions);
                await publicDeleteKeyItem(srcKeyAlies, HuksOptions);
            }
            done();
        });

        it('Security_HUKS_Export_API9_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0200";
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
                await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
                await publicExportKeyItem(srcKeyAlies, HuksOptions);
                await publicDeleteKeyItem(srcKeyAlies, HuksOptions);
            }
            done();
        });

        it('Security_HUKS_Export_API9_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0300";
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
                await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
                await publicExportKeyItem(srcKeyAlies, HuksOptions);
                await publicDeleteKeyItem(srcKeyAlies, HuksOptions);
            }
            done();
        });

        it('Security_HUKS_Export_API9_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0400";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0500";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0600";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0700";
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
                await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
                await publicExportKeyItem(srcKeyAlies, HuksOptions);
                await publicDeleteKeyItem(srcKeyAlies, HuksOptions);
            }
            done();
        });

        it('Security_HUKS_Export_API9_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0800";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_0900";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize384,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1000";
            let HuksOptions = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyECCSize521,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCDIGEST
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1100";
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
                await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
                await publicExportKeyItem(srcKeyAlies, HuksOptions);
                await publicDeleteKeyItem(srcKeyAlies, HuksOptions);
            }
            done();
        });

        it('Security_HUKS_Export_API9_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1200";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1300";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1400";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1500";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1600";
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
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1700";
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
                await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
                await publicExportKeyItem(srcKeyAlies, HuksOptions);
                await publicDeleteKeyItem(srcKeyAlies, HuksOptions);
            }
            done();
        });

        it('Security_HUKS_Export_API9_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_Export_API9_1800";
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifySM2.HuksKeySize256,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                ),
                inData: gInData64Array,
            };
            await publicGenerateKeyItemFunc(srcKeyAlies, HuksOptions);
            await publicExportKeyItem(srcKeyAlies, HuksOptions);
            await publicDeleteKeyItem(srcKeyAlies, HuksOptions)
            done();
        });

        it('Security_HUKS_Export_API9_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = '****'
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
            console.info(`enter promise export`);
            try {
                await huks.exportKeyItem(srcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: exportKeyItem success, data = ${JSON.stringify(data)}`);
                        exportKey = data.outData;
                    })
                    .catch(error => {
                        console.error(`promise: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                    });
            } catch (error) {
                console.error(`promise: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            }
            done();
        });
    });
}
