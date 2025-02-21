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
import { describe, it, expect, beforeAll } from "@ohos/hypium";
import Data from '../../../../../../utils/data.json';
import { stringToUint8Array, checkSoftware } from '../../../../../../utils/param/publicFunc';
import { HuksSignVerifyRSA } from '../../../../../../utils/param/signverify/publicSignverifyParam';

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
let useSoftware = true;

async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptionsNONECBC) {
    console.error(`enter promise generateKeyItem`);
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
            expect(null).assertFail();
            return;
        }
        inDataSegPosition += maxUpdateSize;
    }
}

async function publicUpdateError(HuksOptions, errCode) {
    console.error(`enter promise doUpdate`);
    try {
        await huks.updateSession(handle, HuksOptions)
            .then((data) => {
                console.error(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                expect(null).assertFail();
            })
            .catch(error => {
                console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                expect(err.code == errCode).assertTrue();
            });
    } catch (error) {
        console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
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

export default function SecurityHuksRSASignExtendJsunit() {
    describe('SecurityHuksRSASignExtendJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        /**
         * @tc.number Security_HUKS_RSA_SignExtend_0100
         * @tc.name No Padding and Sign Verify with RSA.
         * @tc.desc No Padding and Sign Verify with RSA.
         */
        it("Security_HUKS_RSA_SignExtend_0100", 0, async function (done) {
            let srcKeyAliesGen = "Security_HUKS_RSA_SignExtend_0100_Gen";
            if (useSoftware) {
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
            }
            done();
        })

        /**
         * @tc.number Security_HUKS_RSA_SignExtend_0200
         * @tc.name No Digest and Sign Verify with RSA.
         * @tc.desc No Digest and Sign Verify with RSA.
         */
        it("Security_HUKS_RSA_SignExtend_0200", 0, async function (done) {
            let srcKeyAliesGen = "Security_HUKS_RSA_SignExtend_0200";
            if (useSoftware) {
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
            }
            done();
        })

        /**
         * @tc.number Security_HUKS_RSA_SignExtend_0300
         * @tc.name Alg, Purpose and length filled and Sign Verify with RSA.
         * @tc.desc Alg, Purpose and length filled and Sign Verify with RSA.
         */
        it("Security_HUKS_RSA_SignExtend_0300", 0, async function (done) {
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
            if (useSoftware) {
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
            }
            done();
        })

        /**
         * @tc.number Security_HUKS_RSA_SignExtend_0400
         * @tc.name DigestNONE and Sign Verify with hashed plain test.
         * @tc.desc DigestNONE and Sign Verify with hashed plain test.
         */
        it("Security_HUKS_RSA_SignExtend_0400", 0, async function (done) {
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
         * @tc.number Security_HUKS_RSA_SignExtend_0500
         * @tc.name No Padding while Sign Verify.
         * @tc.desc No Padding while Sign Verify.
         */
        it("Security_HUKS_RSA_SignExtend_0500", 0, async function (done) {
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
         * @tc.number Security_HUKS_RSA_SignExtend_0600
         * @tc.name No Digest while Sign Verify.
         * @tc.desc No Digest while Sign Verify.
         */
        it("Security_HUKS_RSA_SignExtend_0600", 0, async function (done) {
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
         * @tc.number Security_HUKS_RSA_SignExtend_0700
         * @tc.name Alg, Purpose and length only while Sign Verify.
         * @tc.desc Alg, Purpose and length only while Sign Verify.
         */
        it("Security_HUKS_RSA_SignExtend_0700", 0, async function (done) {
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
         * @tc.number Security_HUKS_RSA_SignExtend_0800
         * @tc.name use plain text while Sign Verify.
         * @tc.desc use plain text while Sign Verify.
         */
        it("Security_HUKS_RSA_SignExtend_0800", 0, async function (done) {
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
    })
}
