/*software
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
import huks from "@ohos.security.huks";
import { describe, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Data from './utils/data.json';
import { stringToUint8Array, arrayEqual, checkSoftware } from './utils/param/publicFunc';
import {
    HuksSignVerifyRSA,
    HuksSignVerifyDSA,
    HuksSignVerifyECC,
    HuksSignVerifyED25519,
    HuksSignVerifySM2
} from './utils/param/signverify/publicSignverifyParam';
import { HuksAgreeECDH } from './utils/param/agree/publicAgreeParam';
import { HuksCipherAES, HuksCipherRSA, HuksCipherSM4 } from './utils/param/cipher/publicCipherParam';
import { HuksDeriveHKDF, HuksDerivePBKDF2 } from './utils/param/derive/publicDeriveParam';
import { HuksHmac } from './utils/param/hmac/publicHmacParam';
import { CheckWifiInfo } from './utils/common/NetworkUtils';

let inDataString = "Hks_RSA_Sign_Verify_Test_0000000000000000000000000000000000000000000000000000000" +
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000" +
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
let inDataAfterSha512 = new Uint8Array([
    0x68, 0xD1, 0x5F, 0xE4, 0x46, 0xF7, 0xBF, 0x8D, 0x30, 0x91, 0x46, 0x53, 0x81, 0x49, 0xA0, 0xD5,
    0x39, 0xC7, 0xDC, 0x59, 0xE7, 0xF6, 0x42, 0x5D, 0x86, 0x09, 0x30, 0xD0, 0x3F, 0x4D, 0x91, 0x85,
]);
let srcData64 = Data.Data64b;
let srcData64Kb = stringToUint8Array(srcData64);
let signedResult;
let handle;

let IV = '0000000000000000';
let IVErr = '00000000000000000000000000000000000000000000000000000000000000000000';
let AAD = '0000000000000000';
let NONCE = '000000000000';
let AEAD = '0000000000000000';
let useSoftware = true;

async function getGenKeyOption() {
    let properties = [
        {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_RSA
        },
        {
            tag: huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
            value: huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT
        },
        {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048
        },
        {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
        },
        {
            tag: huks.HuksTag.HUKS_TAG_DIGEST,
            value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256
        },
        {
            tag: huks.HuksTag.HUKS_TAG_PADDING,
            value: huks.HuksKeyPadding.HUKS_PADDING_PSS
        },
        {
            tag: huks.HuksTag.HUKS_TAG_KEY_GENERATE_TYPE,
            value: huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DEFAULT
        },
        {
            tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
            value: huks.HuksCipherMode.HUKS_MODE_ECB
        }
    ];
    let options = {
        properties: properties
    };
    return options;
}

async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    console.error(`promise: generateKeyItem options, data = ${JSON.stringify(genHuksOptionsNONECBC)}`);
    try {
        await huks.generateKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
            .then((data) => {
                console.error(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicInitFunc(srcKeyAlias, HuksOptions) {
    console.error(`enter promise doInit`);
    try {
        await huks.initSession(srcKeyAlias, HuksOptions)
            .then((data) => {
                console.error(`promise: doInit success, data = ${JSON.stringify(data)}`);
                handle = data.handle;
            })
            .catch(error => {
                console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicInitSessionError(srcKeyAlias, HuksOptions, errCode) {
    console.error("enter publicInitSessionError");
    try {
        await huks.initSession(srcKeyAlias, HuksOptions).then(data => {
            console.error(`promise: doInit success, data = ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(null).assertFail();
        }).catch(err => {
            console.error(`promise: doInit key failed, code: ${err.code}, msg: ${err.message}`);
            expect(err.code == errCode).assertTrue();
        })
    } catch (err) {
        console.error(`promise: doInit input arg invalid, code: ${err.code}, msg: ${err.message}`);
        expect(null).assertFail();
    }
}

async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    console.error(`enter promise deleteKeyItem`);
    try {
        await huks.deleteKeyItem(srcKeyAlias, genHuksOptionsNONECBC)
            .then((data) => {
                console.error(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicUpdateSessionFunction(HuksOptions) {
    const maxUpdateSize = 64;
    const inData = HuksOptions.inData;
    const lastInDataPosition = inData.length - 1;
    let inDataSegSize = maxUpdateSize;
    let inDataSegPosition = 0;
    let isFinished = false;
    let outData = [];

    while (inDataSegPosition <= lastInDataPosition) {
        HuksOptions.inData = new Uint8Array(
            Array.from(inData).slice(inDataSegPosition, inDataSegPosition + inDataSegSize)
        );
        console.error(`enter promise doUpdate`);
        try {
            await huks.updateSession(handle, HuksOptions)
                .then((data) => {
                    console.error(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                    outData = outData.concat(Array.from(data.outData));
                })
                .catch(error => {
                    console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                    expect(null).assertFail();
                });
        } catch (error) {
            console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
            expect(null).assertFail();
        }
        if (inDataSegPosition + maxUpdateSize > lastInDataPosition) {
            isFinished = true;
            inDataSegSize = lastInDataPosition - inDataSegPosition + 1;
            console.error(`enter promise doUpdate`);
            break;
        }
        if ((!isFinished) && (inDataSegPosition + maxUpdateSize > lastInDataPosition)) {
            console.log(`update size invalid isFinished = ${isFinished}`);
            console.log(`inDataSegPosition = ${inDataSegPosition}`);
            console.log(`lastInDataPosition = ${lastInDataPosition}`);
            outData = [];
            expect(null).assertFail();
            return outData;
        }
        inDataSegPosition += maxUpdateSize;
    }
    return outData;
}

async function publicUpdateOnce(HuksOptions) {
    console.error(`enter promise doUpdate`);
    let outData;
    try {
        await huks.updateSession(handle, HuksOptions)
            .then((data) => {
                console.error(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                outData = data.outData;
            })
            .catch(error => {
                console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
    return outData;
}

async function publicFinishSessionFunc(HuksOptions) {
    console.error(`enter promise doFinish`);
    try {
        await huks.finishSession(handle, HuksOptions)
            .then((data) => {
                console.error(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                if (data !== null && data.outData !== null) {
                    signedResult = data.outData;
                }
            })
            .catch(error => {
                console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicExportFunc(srcKeyAlies, HuksOptions) {
    console.info(`enter promise export`);
    let exportKey;
    try {
        await huks.exportKeyItem(srcKeyAlies, HuksOptions)
            .then((data) => {
                console.info(`promise: exportKeyItem success, data = ${JSON.stringify(data)}`);
                exportKey = data.outData;
            })
            .catch(error => {
                console.error(`promise: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
    return exportKey;
}

export default function SecurityHuksSignExtendRSAJsunit() {
    describe('SecurityHuksSignExtendRSAJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0100
         * @tc.number Security_HUKS_RSA_SignExtend_0100
         * @tc.desc   No Padding and Sign Verify with RSA.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliesGen = "Security_HUKS_RSA_SignExtend_0100_Gen";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicGenerateKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            await publicInitFunc(srcKeyAliesGen, HuksOptionsSign);
            HuksOptionsSign.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);

            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicInitFunc(srcKeyAliesGen, HuksOptionsVerify);
            HuksOptionsVerify.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0200
         * @tc.number Security_HUKS_RSA_SignExtend_0200
         * @tc.desc   No Digest and Sign Verify with RSA.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliesGen = "Security_HUKS_RSA_SignExtend_0200";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicGenerateKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            await publicInitFunc(srcKeyAliesGen, HuksOptionsSign);
            HuksOptionsSign.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);

            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicInitFunc(srcKeyAliesGen, HuksOptionsVerify);
            HuksOptionsVerify.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0300
         * @tc.number Security_HUKS_RSA_SignExtend_0300
         * @tc.desc   Alg, Purpose and length filled and Sign Verify with RSA.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliesGen = "Security_HUKS_RSA_SignExtend_0300";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicGenerateKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            await publicInitFunc(srcKeyAliesGen, HuksOptionsSign);
            HuksOptionsSign.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);

            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicInitFunc(srcKeyAliesGen, HuksOptionsVerify);
            HuksOptionsVerify.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0400
         * @tc.number Security_HUKS_RSA_SignExtend_0400
         * @tc.desc   DigestNONE and Sign Verify with hashed plain test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliesGen = "Security_HUKS_RSA_SignExtend_0400";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: inDataAfterSha512,
            }
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: inDataAfterSha512,
            }
            await publicGenerateKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            await publicInitFunc(srcKeyAliesGen, HuksOptionsSign);
            HuksOptionsSign.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);

            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: signedResult,
            }
            await publicInitFunc(srcKeyAliesGen, HuksOptionsVerify);
            HuksOptionsVerify.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAliesGen, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0500
         * @tc.number Security_HUKS_RSA_SignExtend_0500
         * @tc.desc   No Padding while Sign Verify.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_0500";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitSessionError(srcKeyAlies, HuksOptionsSign, 401);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0600
         * @tc.number Security_HUKS_RSA_SignExtend_0600
         * @tc.desc   No Digest while Sign Verify.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_0600";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitSessionError(srcKeyAlies, HuksOptionsSign, 401);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0700
         * @tc.number Security_HUKS_RSA_SignExtend_0700
         * @tc.desc   Alg, Purpose and length only while Sign Verify.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_0700";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: srcData64Kb,
            }
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitSessionError(srcKeyAlies, HuksOptionsSign, 401);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0800
         * @tc.number Security_HUKS_RSA_SignExtend_0800
         * @tc.desc   use plain text while Sign Verify.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_0800";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: inDataAfterSha512,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: inDataString,
            }
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_0900
         * @tc.number Security_HUKS_RSA_SignExtend_0900
         * @tc.desc   AES not GCM,no BlockMode while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_0900";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1000
         * @tc.number Security_HUKS_RSA_SignExtend_1000
         * @tc.desc   AES not GCM,no digest while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1000";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1100
         * @tc.number Security_HUKS_RSA_SignExtend_1100
         * @tc.desc   AES not GCM,no padding while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1100";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1200
         * @tc.number Security_HUKS_RSA_SignExtend_1200
         * @tc.desc   AES not GCM,no IV while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1200";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1300
         * @tc.number Security_HUKS_RSA_SignExtend_1300
         * @tc.desc   AES not GCM,no blockmode,digest,padding,IV while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1300";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1400
         * @tc.number Security_HUKS_RSA_SignExtend_1400
         * @tc.desc   AES GCM,no blockmode while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1400";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1500
         * @tc.number Security_HUKS_RSA_SignExtend_1500
         * @tc.desc   AES GCM,no digest while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1500";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1600
         * @tc.number Security_HUKS_RSA_SignExtend_1600
         * @tc.desc   AES GCM,no padding while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1600";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1700
         * @tc.number Security_HUKS_RSA_SignExtend_1700
         * @tc.desc   AES GCM,no blockmode,digest,padding while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1700";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeDECRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherAES.HuksKeyAESDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA,
                        value: stringToUint8Array(AAD)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_NONCE,
                        value: stringToUint8Array(NONCE)
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_AE_TAG,
                        value: stringToUint8Array(AEAD)
                    },
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1800
         * @tc.number Security_HUKS_RSA_SignExtend_1800
         * @tc.desc   AES GCM,no digest while generate,use wrong digest (SHA256)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1800";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurpose,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherAES.HuksKeyAlgAES,
                    HuksCipherAES.HuksKeyPurposeENCRYPT,
                    HuksCipherAES.HuksKeyAESSize256,
                    HuksCipherAES.HuksKeyAESPADDINGNONE,
                    HuksCipherAES.HuksKeyAESBLOCKMODE,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_1900
         * @tc.number Security_HUKS_RSA_SignExtend_1900
         * @tc.desc   RSA Cipher,no blockMode while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_1900";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurpose,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            await publicUpdateSessionFunction(HuksOptionsEncrypt);
            await publicFinishSessionFunc(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: signedResult,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            await publicUpdateSessionFunction(HuksOptionsDecrypt);
            await publicFinishSessionFunc(signedResult);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2000
         * @tc.number Security_HUKS_RSA_SignExtend_2000
         * @tc.desc   RSA Cipher,no digest while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2000";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurpose,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            await publicUpdateSessionFunction(HuksOptionsEncrypt);
            await publicFinishSessionFunc(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: signedResult,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            await publicUpdateSessionFunction(HuksOptionsDecrypt);
            await publicFinishSessionFunc(signedResult);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2100
         * @tc.number Security_HUKS_RSA_SignExtend_2100
         * @tc.desc   RSA Cipher,no padding while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2100";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurpose,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            await publicUpdateSessionFunction(HuksOptionsEncrypt);
            await publicFinishSessionFunc(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: signedResult,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            await publicUpdateSessionFunction(HuksOptionsDecrypt);
            await publicFinishSessionFunc(signedResult);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2200
         * @tc.number Security_HUKS_RSA_SignExtend_2200
         * @tc.desc   RSA Cipher,no blockmode,digest,padding while generate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2200";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurpose,
                    HuksCipherRSA.HuksKeyRSASize4096,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            await publicUpdateSessionFunction(HuksOptionsEncrypt);
            await publicFinishSessionFunc(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: signedResult,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            await publicUpdateSessionFunction(HuksOptionsDecrypt);
            await publicFinishSessionFunc(signedResult);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2300
         * @tc.number Security_HUKS_RSA_SignExtend_2300
         * @tc.desc   RSA Cipher,wrong blockmode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2300";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurpose,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherAES.HuksKeyAESBLOCKMODEGCM,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2400
         * @tc.number Security_HUKS_RSA_SignExtend_2400
         * @tc.desc   SM4 Cipher,no blockmode while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2400";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurpose,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2600
         * @tc.number Security_HUKS_RSA_SignExtend_2600
         * @tc.desc   SM4 Cipher,no padding while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2600";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurpose,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2700
         * @tc.number Security_HUKS_RSA_SignExtend_2700
         * @tc.desc   SM4 Cipher,no IV while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2700";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurpose,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2800
         * @tc.number Security_HUKS_RSA_SignExtend_2800
         * @tc.desc   SM4 Cipher,no blockMode,padding,IV while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2800";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurpose,
                    HuksCipherSM4.HuksKeySM4Size128,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsEncrypt);
            let encryptedData = await publicUpdateSessionFunction(HuksOptionsEncrypt);
            let HuksOptionsDecrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeDECRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: encryptedData,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsDecrypt);
            let outData = await publicUpdateSessionFunction(HuksOptionsDecrypt);
            expect(arrayEqual(Array.from(outData), Array.from(srcData64Kb))).assertTrue();
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_2900
         * @tc.number Security_HUKS_RSA_SignExtend_2900
         * @tc.desc   SM4 Cipher,wrong padding while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_2900";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurpose,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksCipherSM4.HuksKeySM4PADDINGNONE,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsEncrypt = {
                properties: new Array(
                    HuksCipherSM4.HuksKeyAlgSM4,
                    HuksCipherSM4.HuksKeyPurposeENCRYPT,
                    HuksCipherSM4.HuksKeySM4Size128,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherSM4.HuksKeySM4BLOCKMODECBC,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitSessionError(srcKeyAlies, HuksOptionsEncrypt, 401);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3000
         * @tc.number Security_HUKS_RSA_SignExtend_3000
         * @tc.desc   RSA SignVreify,hash mode doesn't suite for the hashed data
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3000";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: inDataAfterSha512,
            }
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyRSA.HuksKeyAlgRSA,
                    HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                    HuksSignVerifyRSA.HuksTagPKCS1DigestNONE,
                    HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksSignVerifyRSA.HuksKeyRSASize4096
                ),
                inData: inDataAfterSha512,
            }
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            HuksOptionsSign.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3100
         * @tc.number Security_HUKS_RSA_SignExtend_3100
         * @tc.desc   DSA SignVerify,no digest while generate(TEE Not support)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3100";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyDSA.HuksKeySIZE1024
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                    HuksSignVerifyDSA.HuksKeySIZE1024
                ),
                inData: srcData64Kb,
            };
            if (useSoftware) {
                await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
                await publicInitFunc(srcKeyAlies, HuksOptionsSign);
                HuksOptionsSign.inData = srcData64Kb;
                await publicUpdateSessionFunction(HuksOptionsSign);
                HuksOptionsSign.inData = new Uint8Array(new Array());
                await publicFinishSessionFunc(HuksOptionsSign);
                let HuksOptionsVerify = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksKeySIZE1024
                    ),
                    inData: srcData64Kb,
                };
                await publicInitFunc(srcKeyAlies, HuksOptionsVerify);
                HuksOptionsVerify.inData = srcData64Kb;
                await publicUpdateSessionFunction(HuksOptionsVerify);
                HuksOptionsVerify.inData = signedResult;
                await publicFinishSessionFunc(HuksOptionsVerify);
                await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            }
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3200
         * @tc.number Security_HUKS_RSA_SignExtend_3200
         * @tc.desc   ECC SignVerify,no Hash Support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3200";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSINGVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: inDataAfterSha512,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: inDataAfterSha512,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            HuksOptionsSign.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);
            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: inDataAfterSha512,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsVerify);
            HuksOptionsVerify.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3300
         * @tc.number Security_HUKS_RSA_SignExtend_3300
         * @tc.desc   ECC SignVerify,hash mode doesn't suite for the hashed data
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3300";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSINGVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: inDataAfterSha512,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: inDataAfterSha512,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitSessionError(srcKeyAlies, HuksOptionsSign, 401);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3400
         * @tc.number Security_HUKS_RSA_SignExtend_3400
         * @tc.desc   ECC SignVerify,no digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3400";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSINGVERIFY,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            HuksOptionsSign.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);
            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyECC.HuksKeyAlgECC,
                    HuksSignVerifyECC.HuksKeyECCPurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestSHA256,
                    HuksSignVerifyECC.HuksKeyECCSize384
                ),
                inData: srcData64Kb,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsVerify);
            HuksOptionsVerify.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3500
         * @tc.number Security_HUKS_RSA_SignExtend_3500
         * @tc.desc   ED25519 SignVerify,no digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3500";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyRSAPurposeSINGVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            HuksOptionsSign.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);
            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData64Kb,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsVerify);
            HuksOptionsVerify.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3600
         * @tc.number Security_HUKS_RSA_SignExtend_3600
         * @tc.desc   SM2 SignVerify,no hash support
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3600";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSINGVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: inDataAfterSha512,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: inDataAfterSha512,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            HuksOptionsSign.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);
            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: inDataAfterSha512,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsVerify);
            HuksOptionsVerify.inData = inDataAfterSha512;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3700
         * @tc.number Security_HUKS_RSA_SignExtend_3700
         * @tc.desc   SM2 SignVerify,hash mode doesn't suite for the hashed data
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3700";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSINGVERIFY,
                    HuksSignVerifyECC.HuksTagECCDigestNONE,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: inDataAfterSha512,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifyECC.HuksTagECCDigestSHA384,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: inDataAfterSha512,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitSessionError(srcKeyAlies, HuksOptionsSign, 401);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3800
         * @tc.number Security_HUKS_RSA_SignExtend_3800
         * @tc.desc   SM2 SignVerify,no digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3800";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSINGVERIFY,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsSign = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsSign);
            HuksOptionsSign.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsSign);
            HuksOptionsSign.inData = new Uint8Array(new Array());
            await publicFinishSessionFunc(HuksOptionsSign);
            let HuksOptionsVerify = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeVERIFY,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: srcData64Kb,
            };
            await publicInitFunc(srcKeyAlies, HuksOptionsVerify);
            HuksOptionsVerify.inData = srcData64Kb;
            await publicUpdateSessionFunction(HuksOptionsVerify);
            HuksOptionsVerify.inData = signedResult;
            await publicFinishSessionFunc(HuksOptionsVerify);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_3900
         * @tc.number Security_HUKS_RSA_SignExtend_3900
         * @tc.desc   ECDH Agree,no blockMode while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_3900";
            let srcKeyAliesSecond = "Security_HUKS_RSA_SignExtend_3900_02";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsAgree = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECDH,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeySTORAGE,
                    HuksAgreeECDH.HuksKeyISKEYALIAS,
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODEECB
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicGenerateKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            let exportKeyFrist = await publicExportFunc(srcKeyAlies, HuksOptionsGen);
            let exportKeySecond = await publicExportFunc(srcKeyAliesSecond, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeySecond;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinish);
            let huksOptionsFinishSecond = huksOptionsFinish;
            huksOptionsFinishSecond.properties.splice(6, 1, {
                tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesSecond + 'final'),
            });
            await publicInitFunc(srcKeyAliesSecond, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeyFrist;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinishSecond);
            await publicDeleteKeyFunc(srcKeyAliesSecond + 'final', HuksOptionsAgree);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicDeleteKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4000
         * @tc.number Security_HUKS_RSA_SignExtend_4000
         * @tc.desc   ECDH Agree,no digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4000";
            let srcKeyAliesSecond = "Security_HUKS_RSA_SignExtend_4000_02";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsAgree = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECDH,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeySTORAGE,
                    HuksAgreeECDH.HuksKeyISKEYALIAS,
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODEECB
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicGenerateKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            let exportKeyFrist = await publicExportFunc(srcKeyAlies, HuksOptionsGen);
            let exportKeySecond = await publicExportFunc(srcKeyAliesSecond, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeySecond;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinish);
            let huksOptionsFinishSecond = huksOptionsFinish;
            huksOptionsFinishSecond.properties.splice(6, 1, {
                tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesSecond + 'final'),
            });
            await publicInitFunc(srcKeyAliesSecond, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeyFrist;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinishSecond);
            await publicDeleteKeyFunc(srcKeyAliesSecond + 'final', HuksOptionsAgree);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicDeleteKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4100
         * @tc.number Security_HUKS_RSA_SignExtend_4100
         * @tc.desc   ECDH Agree,no padding while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4100";
            let srcKeyAliesSecond = "Security_HUKS_RSA_SignExtend_4100_02";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsAgree = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECDH,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeySTORAGE,
                    HuksAgreeECDH.HuksKeyISKEYALIAS,
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODEECB
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicGenerateKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            let exportKeyFrist = await publicExportFunc(srcKeyAlies, HuksOptionsGen);
            let exportKeySecond = await publicExportFunc(srcKeyAliesSecond, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeySecond;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinish);
            let huksOptionsFinishSecond = huksOptionsFinish;
            huksOptionsFinishSecond.properties.splice(6, 1, {
                tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesSecond + 'final'),
            });
            await publicInitFunc(srcKeyAliesSecond, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeyFrist;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinishSecond);
            await publicDeleteKeyFunc(srcKeyAliesSecond + 'final', HuksOptionsAgree);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicDeleteKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4200
         * @tc.number Security_HUKS_RSA_SignExtend_4200
         * @tc.desc   ECDH Agree,no padding,blockmode,digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4200";
            let srcKeyAliesSecond = "Security_HUKS_RSA_SignExtend_4200_02";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsAgree = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECDH,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeySTORAGE,
                    HuksAgreeECDH.HuksKeyISKEYALIAS,
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODEECB
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicGenerateKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            let exportKeyFrist = await publicExportFunc(srcKeyAlies, HuksOptionsGen);
            let exportKeySecond = await publicExportFunc(srcKeyAliesSecond, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeySecond;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinish);
            let huksOptionsFinishSecond = huksOptionsFinish;
            huksOptionsFinishSecond.properties.splice(6, 1, {
                tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliesSecond + 'final'),
            });
            await publicInitFunc(srcKeyAliesSecond, HuksOptionsAgree);
            HuksOptionsAgree.inData = exportKeyFrist;
            await publicUpdateOnce(HuksOptionsAgree);
            await publicFinishSessionFunc(huksOptionsFinishSecond);
            await publicDeleteKeyFunc(srcKeyAliesSecond + 'final', HuksOptionsAgree);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicDeleteKeyFunc(srcKeyAliesSecond, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4300
         * @tc.number Security_HUKS_RSA_SignExtend_4300
         * @tc.desc   HKDF Derive,no digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4300";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksKeyHKDFSize192,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsDerive = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgHKDF,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeySTORAGE,
                    HuksDeriveHKDF.HuksKeyISKEYALIAS,
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsDerive);
            await publicUpdateOnce(HuksOptionsDerive);
            await publicFinishSessionFunc(huksOptionsFinish);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4400
         * @tc.number Security_HUKS_RSA_SignExtend_4400
         * @tc.desc   HKDF Derive,no IV while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4400";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyHKDFSize192,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsDerive = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgHKDF,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeySTORAGE,
                    HuksDeriveHKDF.HuksKeyISKEYALIAS,
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsDerive);
            await publicUpdateOnce(HuksOptionsDerive);
            await publicFinishSessionFunc(huksOptionsFinish);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4500
         * @tc.number Security_HUKS_RSA_SignExtend_4500
         * @tc.desc   HKDF Derive,no digest,IV while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4500";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksKeyHKDFSize192,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsDerive = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgHKDF,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IV)
                    }
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeySTORAGE,
                    HuksDeriveHKDF.HuksKeyISKEYALIAS,
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsDerive);
            await publicUpdateOnce(HuksOptionsDerive);
            await publicFinishSessionFunc(huksOptionsFinish);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4600
         * @tc.number Security_HUKS_RSA_SignExtend_4600
         * @tc.desc   HKDF Derive,IV length err
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4600";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyHKDFSize192,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsDerive = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgHKDF,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: stringToUint8Array(IVErr)
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsDerive);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4700
         * @tc.number Security_HUKS_RSA_SignExtend_4700
         * @tc.desc   HKDF Derive,IV format err
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4700";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyHKDFSize192,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsDerive = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgHKDF,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_IV,
                        value: IV
                    }
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            try {
                await huks.initSession(srcKeyAlies, HuksOptionsDerive).then(data => {
                    console.error(`promise: doInit success, data = ${JSON.stringify(data)}`);
                    expect(null).assertFail();
                }).catch(err => {
                    console.error(`promise: doInit key failed, code: ${err.code}, msg: ${err.message}`);
                    expect(err.code == 401).assertTrue();
                })
            } catch (err) {
                console.error(`promise: doInit input arg invalid, code: ${err.code}, msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4800
         * @tc.number Security_HUKS_RSA_SignExtend_4800
         * @tc.desc   PBKDF Derive,no digest while generate
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4800";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksDerivePBKDF2.HuksKeyAlgAES,
                    HuksDerivePBKDF2.HuksKeyPurposePBKDF2,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Size192,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Iteration,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Salt
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsDerive = {
                properties: new Array(
                    HuksDerivePBKDF2.HuksKeyAlgPBKDF2,
                    HuksDerivePBKDF2.HuksKeyPurposePBKDF2,
                    HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256,
                    HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Iteration,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Salt
                ),
                inData: srcData64Kb,
            };
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDerivePBKDF2.HuksKeySTORAGE,
                    HuksDerivePBKDF2.HuksKeyISKEYALIAS,
                    HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                    HuksDerivePBKDF2.HuksKeySIZE256,
                    HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAlies),
                    },
                    HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                    HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsDerive);
            await publicUpdateOnce(HuksOptionsDerive);
            await publicFinishSessionFunc(huksOptionsFinish);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_RSA_SignExtend_4900
         * @tc.number Security_HUKS_RSA_SignExtend_4900
         * @tc.desc   HMAC ,no digest while ...
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_RSA_SignExtend_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlies = "Security_HUKS_RSA_SignExtend_4900";
            let HuksOptionsGen = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksKeySIZE,
                ),
                inData: srcData64Kb,
            };
            let HuksOptionsUse = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksKeySIZE,
                    HuksHmac.HuksTagDigestSHA512
                ),
                inData: srcData64Kb,
            };
            await publicGenerateKeyFunc(srcKeyAlies, HuksOptionsGen);
            await publicInitFunc(srcKeyAlies, HuksOptionsUse);
            await publicUpdateSessionFunction(HuksOptionsUse);
            await publicFinishSessionFunc(HuksOptionsUse);
            await publicDeleteKeyFunc(srcKeyAlies, HuksOptionsGen);
            done();
        })

        /**
         * @tc.name   Security_HUKS_Cipher_AnonAttestation_0010
         * @tc.number Security_HUKS_Cipher_AnonAttestation_0010
         * @tc.desc   generateKeyItem with RSA ...
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Cipher_AnonAttestation_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await CheckWifiInfo();
            let srcKeyAlies = "Security_HUKS_Cipher_AnonAttestation_0010";
            let properties = [
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
                    value: stringToUint8Array('sec_level')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
                    value: stringToUint8Array('challenge_data')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
                    value: stringToUint8Array('version_info')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
                    value: stringToUint8Array(srcKeyAlies)
                }
            ];
            let options = {
                properties: properties
            };
            try {
                let genKeyOption = await getGenKeyOption();
                await huks.generateKeyItem(srcKeyAlies, genKeyOption).then(data => {
                    console.info(srcKeyAlies + ": generateKeyItem succeed, data: " + data);
                });
                await huks.anonAttestKeyItem(srcKeyAlies, options).then(data => {
                    expect(data.certChains != null).assertTrue();
                    console.info(srcKeyAlies + ": anonAttestKeyItem succeed, data: " + data);
                });
                await huks.deleteKeyItem(srcKeyAlies, genKeyOption).then(data => {
                    console.info(srcKeyAlies + ": deleteKeyItem succeed, data: " + data);
                });
            } catch (err) {
                console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed, err: " + err + ", errcode: " +
                    err.code);
                expect(null).assertFail();
            }
            console.info(srcKeyAlies + ": success");
            done();
        })

        /**
         * @tc.name   Security_HUKS_Cipher_AnonAttestation_0012
         * @tc.number Security_HUKS_Cipher_AnonAttestation_0012
         * @tc.desc   generateKeyItem with SM2, Callback...
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Cipher_AnonAttestation_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await CheckWifiInfo();
            let srcKeyAlies = "Security_HUKS_Cipher_AnonAttestation_0012";
            let properties = [
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
                    value: stringToUint8Array('sec_level')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
                    value: stringToUint8Array('challenge_data')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
                    value: stringToUint8Array('version_info')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
                    value: stringToUint8Array(srcKeyAlies)
                }
            ];
            let options = {
                properties: properties
            };
            let genKeyOption = await getGenKeyOption();
            genKeyOption.properties = [
                {
                    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                    value: huks.HuksKeyAlg.HUKS_ALG_SM2
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                    value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_DIGEST,
                    value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                }
            ];
            await huks.generateKeyItem(srcKeyAlies, genKeyOption).then(data => {
                console.info(srcKeyAlies + ": generateKeyItem succeed, data: " + data);
            });
            huks.anonAttestKeyItem(srcKeyAlies, options, function (err, data) {
                try {
                    if (err) {
                        console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed, err: " + err +
                            ", errcode: " + err.code);
                        expect(null).assertFail();
                    } else {
                        expect(data.certChains != null).assertTrue();
                        console.info(srcKeyAlies + ": anonAttestKeyItem succeed, data: " + data);
                        huks.deleteKeyItem(srcKeyAlies, genKeyOption, (err) => {
                            if (err) {
                                console.error("promise: " + srcKeyAlies + ": deleteKeyItem failed, err: " + err +
                                    ", errcode: " + err.code);
                                expect(null).assertFail();
                            } else {
                                console.info(srcKeyAlies + ": deleteKeyItem succeed");
                                console.info(srcKeyAlies + ": success");
                                done();
                            }
                        });
                    }
                } catch (error) {
                    console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed");
                    done()
                }
            });
        })

        /**
         * @tc.name   Security_HUKS_Cipher_AnonAttestation_0013
         * @tc.number Security_HUKS_Cipher_AnonAttestation_0013
         * @tc.desc   generateKeyItem with ECC ...
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Cipher_AnonAttestation_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await CheckWifiInfo();
            let srcKeyAlies = "Security_HUKS_Cipher_AnonAttestation_0013";
            let properties = [
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
                    value: stringToUint8Array('sec_level')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
                    value: stringToUint8Array('challenge_data')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
                    value: stringToUint8Array('version_info')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
                    value: stringToUint8Array(srcKeyAlies)
                }
            ];
            let options = {
                properties: properties
            };
            try {
                let genKeyOption = await getGenKeyOption();
                genKeyOption.properties = [
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_ECC
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_ECC_KEY_SIZE_384
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_NONE
                    }
                ];
                await huks.generateKeyItem(srcKeyAlies, genKeyOption).then(data => {
                    console.info(srcKeyAlies + ": generateKeyItem succeed, data: " + data);
                });

                await huks.anonAttestKeyItem(srcKeyAlies, options).then(data => {
                    expect(data.certChains != null).assertTrue();
                    console.info(srcKeyAlies + ": anonAttestKeyItem succeed, data: " + data);
                });
                await huks.deleteKeyItem(srcKeyAlies, genKeyOption).then(data => {
                    console.info(srcKeyAlies + ": deleteKeyItem succeed, data: " + data);
                });
            } catch (err) {
                console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed, err: " + err + ", errcode: " +
                    err.code);
                expect(null).assertFail();
            }
            console.info(srcKeyAlies + ": success");
            done();
        })

        /**
         * @tc.name   Security_HUKS_Cipher_AnonAttestation_0014
         * @tc.number Security_HUKS_Cipher_AnonAttestation_0014
         * @tc.desc   generateKeyItem with AES ...
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Cipher_AnonAttestation_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await CheckWifiInfo();
            let srcKeyAlies = "Security_HUKS_Cipher_AnonAttestation_0014";
            let properties = [
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
                    value: stringToUint8Array('sec_level')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
                    value: stringToUint8Array('challenge_data')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
                    value: stringToUint8Array('version_info')
                },
                {
                    tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
                    value: stringToUint8Array(srcKeyAlies)
                }
            ];
            let options = {
                properties: properties
            };
            let genKeyOption;
            try {
                genKeyOption = await getGenKeyOption();
                genKeyOption.properties = [
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_AES
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
                            huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256
                    }
                ];
                await huks.generateKeyItem(srcKeyAlies, genKeyOption).then(data => {
                    console.info(srcKeyAlies + ": generateKeyItem succeed, data: " + data);
                });
            } catch (err) {
                console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed, err: " + err + ", errcode: " +
                    err.code);
                expect(null).assertFail();
            }
            try {
                await huks.anonAttestKeyItem(srcKeyAlies, options).then(data => {
                    console.info(srcKeyAlies + ": anonAttestKeyItem succeed, data: " + data);
                });
                expect(null).assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
                console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed, err: " + err + ", errcode: " +
                    err.code);
            }
            try {
                await huks.deleteKeyItem(srcKeyAlies, genKeyOption).then(data => {
                    console.info(srcKeyAlies + ": deleteKeyItem succeed, data: " + data);
                });
            } catch (err) {
                console.error("promise: " + srcKeyAlies + ": anonAttestKeyItem failed, err: " + err + ", errcode: " +
                    err.code);
                expect(null).assertFail();
            }
            console.info(srcKeyAlies + ": success");
            done();
        })
    }
    )
}
