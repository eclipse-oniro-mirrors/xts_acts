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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherRSA } from './utils/param/cipher/publicCipherParam';
import { stringToUint8Array, uint8ArrayToString } from './utils/param/publicFunc';

let gInData32 = 'RSA_32_ttttttttttttttttttttttttt';
let gInData256 =
    'RSA_512_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData384 =
    'RSA_512_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData512 =
    'RSA_512_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
let gInData32Array = stringToUint8Array(gInData32);
let gInData256Array = stringToUint8Array(gInData256);
let gInData384Array = stringToUint8Array(gInData384);
let gInData512Array = stringToUint8Array(gInData512);

let defaultData = '0';
let encryptedData;
let inputInData;
var handle;
let updateResult = new Array();
let exportKey;

let genHuksOptions = {
    properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurpose,
        HuksCipherRSA.HuksKeyRSASize4096
    ),
    inData: new Uint8Array(defaultData),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    console.info(`enter promise generateKeyItem`);
    try {
        await huks.generateKeyItem(srcKeyAlies, genHuksOptionsNONC)
            .then((data) => {
                console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
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

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    console.info(`enter promise export`);
    try {
        await huks.exportKeyItem(srcKeyAlies, genHuksOptionsNONC)
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
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
    HuksOptions.inData = exportKey;
    console.info(`enter promise importKeyItem`);
    try {
        await huks.importKeyItem(srcKeyAlies, HuksOptions)
            .then((data) => {
                console.info(`promise: importKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: importKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: importKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
    console.info(`enter promise doInit`);
    try {
        await huks.initSession(srcKeyAlies, HuksOptions)
            .then((data) => {
                console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                handle = data.handle;
                expect(data.challenge == undefined).assertTrue();
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

async function publicUpdateFunc(HuksOptions) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await update(handle, HuksOptions);
        HuksOptions.inData = stringToUint8Array('0');
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await update(handle, HuksOptions);
            HuksOptions.inData = huksOptionsInData;
        }
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
            await update(handle, HuksOptions);
        }
    }
}

async function update(handle, HuksOptions) {
    console.info(`enter promise doUpdate`);
    try {
        await huks.updateSession(handle, HuksOptions)
            .then((data) => {
                console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
    if (thirdInderfaceName == 'finish') {
        HuksOptions.inData = new Uint8Array(new Array());
        await finish(HuksOptions, isEncrypt);
    } else if (thirdInderfaceName == 'abort') {
        await abort(HuksOptions);
    }
}

async function finish(HuksOptions, isEncrypt) {
    console.info(`enter promise doFinish`);
    try {
        await huks.finishSession(handle, HuksOptions)
            .then((data) => {
                console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                if (isEncrypt) {
                    updateResult = Array.from(data.outData);
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

async function abort(HuksOptions) {
    console.info(`enter promise doAbort`);
    try {
        await huks.abortSession(handle, HuksOptions)
            .then((data) => {
                console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    console.info(`enter promise deleteKeyItem`);
    try {
        await huks.deleteKeyItem(srcKeyAlies, genHuksOptionsNONC)
            .then((data) => {
                console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
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

async function publicCipherFunc(
    srcKeyAlies,
    newSrcKeyAlies,
    genHuksOptionsNONC,
    HuksOptions,
    thirdInderfaceName,
    isEncrypt
) {
    inputInData = HuksOptions.inData;
    try {
        updateResult = new Array();
        let KeyAlias = srcKeyAlies;
        if (isEncrypt) {
            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            encryptedData = HuksOptions.inData;
            await publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions);
            KeyAlias = newSrcKeyAlies;
        }
        HuksOptions.inData = inputInData;
        await publicInitFunc(KeyAlias, HuksOptions);
        await publicUpdateFunc(HuksOptions);
        await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
        if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptionsNONC);
        }
    } catch (e) {
        expect(null).assertFail();
    }
}

export default function SecurityHuksCipherRSAPromiseJsunit() {
    describe('SecurityHuksCipherRSAPromiseJsunit', function () {
        /**
         * @tc.name   Security_HUKS_Cipher_API9_RSA_101
         * @tc.number Security_HUKS_Cipher_API9_RSA_101
         * @tc.desc   Security_HUKS_Cipher_API9_RSA_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API9_RSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias101';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API9_RSA_102
         * @tc.number Security_HUKS_Cipher_API9_RSA_102
         * @tc.desc   Security_HUKS_Cipher_API9_RSA_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API9_RSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API9_RSA_103
         * @tc.number Security_HUKS_Cipher_API9_RSA_103
         * @tc.desc   Security_HUKS_Cipher_API9_RSA_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API9_RSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Cipher_API9_RSA_104
         * @tc.number Security_HUKS_Cipher_API9_RSA_104
         * @tc.desc   Security_HUKS_Cipher_API9_RSA_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Cipher_API9_RSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias104';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias104';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData512Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
            done();
        });

        /**
         * @tc.name   testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103
         * @tc.number testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103
         * @tc.desc   testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGPKCS1_V1_5SHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103
         * @tc.number testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103
         * @tc.desc   testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGOAEPSHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGOAEPSHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103
         * @tc.number testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103
         * @tc.desc   testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGOAEPSHA384KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGOAEPSHA384NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103
         * @tc.number testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103
         * @tc.desc   testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize4096PADDINGOAEPSHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize4096PADDINGOAEPSHA384KeyAlias512';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGOAEPSHA384NewKeyAlias512';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize4096);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize4096,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize3072PADDINGNONESHA256KeyAlias103
         * @tc.number testCipherRSASize3072PADDINGNONESHA256KeyAlias103
         * @tc.desc   testCipherRSASize3072PADDINGNONESHA256KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize3072PADDINGNONESHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize3072PADDINGNONESHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize3072PADDINGNONESHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData384Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103
         * @tc.number testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103
         * @tc.desc   testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA384KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize3072PADDINGPKCS1_V1_5SHA384NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103
         * @tc.number testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103
         * @tc.desc   testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103
         * @tc.number testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103
         * @tc.desc   testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103
         * @tc.number testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103
         * @tc.desc   testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize3072PADDINGOAEPSHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384KeyAlias512';
            const newSrcKeyAlies = 'testCipherRSASize3072PADDINGOAEPSHA384NewKeyAlias512';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize3072);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize3072,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize2048PADDINGNONESHA256KeyAlias103
         * @tc.number testCipherRSASize2048PADDINGNONESHA256KeyAlias103
         * @tc.desc   testCipherRSASize2048PADDINGNONESHA256KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize2048PADDINGNONESHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize2048PADDINGNONESHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize2048PADDINGNONESHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData256Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGNONE,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize2048PADDINGPKCS1_V1_5SHA512KeyAlias103
         * @tc.number testCipherRSASize2048PADDINGPKCS1_V1_5SHA512KeyAlias103
         * @tc.desc   testCipherRSASize2048PADDINGPKCS1_V1_5SHA512KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize2048PADDINGPKCS1_V1_5SHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA512KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize2048PADDINGPKCS1_V1_5SHA512NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGPKCS1V15,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103
         * @tc.number testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103
         * @tc.desc   testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize2048PADDINGOAEPSHA256KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize2048PADDINGOAEPSHA256NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA256
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103
         * @tc.number testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103
         * @tc.desc   testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize2048PADDINGOAEPSHA384KeyAlias103';
            const newSrcKeyAlies = 'testCipherRSASize2048PADDINGOAEPSHA384NewKeyAlias103';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA384);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA384
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        /**
         * @tc.name   testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103
         * @tc.number testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103
         * @tc.desc   testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCipherRSASize2048PADDINGOAEPSHA512KeyAlias103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize2048PADDINGOAEPSHA384KeyAlias512';
            const newSrcKeyAlies = 'testCipherRSASize2048PADDINGOAEPSHA384NewKeyAlias512';
            genHuksOptions.properties.splice(2, 1, HuksCipherRSA.HuksKeyRSASize2048);
            genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
            genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGOAEP);
            genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA512);
            let HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeENCRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: gInData32Array,
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions = {
                properties: new Array(
                    HuksCipherRSA.HuksKeyAlgRSA,
                    HuksCipherRSA.HuksKeyPurposeDECRYPT,
                    HuksCipherRSA.HuksKeyRSASize2048,
                    HuksCipherRSA.HuksKeyRSAPADDINGOAEP,
                    HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
                    HuksCipherRSA.HuksKeyRSADIGESTSHA512
                ),
                inData: new Uint8Array(updateResult),
            };
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });
    });
}
