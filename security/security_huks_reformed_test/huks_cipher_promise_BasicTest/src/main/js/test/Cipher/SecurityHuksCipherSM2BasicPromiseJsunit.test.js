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


import { describe, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherRSA } from '../../../../../../utils/param/cipher/publicCipherParam';
import { stringToUint8Array, uint8ArrayToString, arrayEqual } from '../../../../../../utils/param/publicFunc';
import { Data1kb } from '../../../../../../utils/data.json';

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
let gInData1024Array = stringToUint8Array(Data1kb);


let defaultData = '0';
let plainData;
let inputInData;
var handle;
let encryptedResult = new Array();
let decryptedResult = new Array();
let exportKey;


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
    let temp
    if (HuksOptions.hasOwnProperty('inData')) {
        temp = HuksOptions.inData;
    }
    HuksOptions.inData = exportKey;
    console.info(`enter promise importKeyItem`);
    try {
        await huks.importKeyItem(srcKeyAlies, HuksOptions)
            .then((data) => {
                if (HuksOptions.hasOwnProperty('inData')) {
                    HuksOptions.inData = temp;
                }
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
                    encryptedResult = Array.from(data.outData);
                    console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                } else {
                    decryptedResult = Array.from(data.outData);
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
        encryptedResult = new Array();
        let KeyAlias = srcKeyAlies;
        if (isEncrypt) {
            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC);
            plainData = HuksOptions.inData;
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
        if (!isEncrypt) {
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();
        }

    } catch (e) {
        expect(null).assertFail();
    }
}

let genHuksOptions = {
    properties: new Array(
        {
            tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
            value: huks.HuksKeyAlg.HUKS_ALG_SM2,
        },
        {
            tag: huks.HuksTag.HUKS_TAG_PURPOSE,
            value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
            value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256,
        },
    ),
};


export default function SecurityHuksCipherSM2BasicPromiseJsunit() {
    describe('SecurityHuksCipherSM2BasicPromiseJsunit', function () {

        it('Security_HUKS_Cipher_API9_SM2_101', 0, async function (done) {
            // init-update-finish
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_101A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_101B';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData512Array,
            }

            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_102', 0, async function (done) {
            // init - update - finish
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_102A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_102B';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_103', 0, async function (done) {
            // only use finish instead of update
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_103A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_103B';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_104', 0, async function (done) {
            // wrong key size
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_104A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_104B';
            let genHuksOptionsKeysize512 = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_512
                    },
                ),
            };

            console.info(`enter promise generateKeyItem`);
            try {
                await huks.generateKeyItem(srcKeyAlies, genHuksOptionsKeysize512)
                    .then((data) => {
                        console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000003).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertTrue();
            }
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_105', 0, async function (done) {
            // HUKS_DIGEST_NONE error
            console.info("---------------------------------------105---------------------------------------------------------")
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_105A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_105B';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,

                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); // huksOptions.indata check inside this function
            HuksOptions.inData = plainData;

            //Encrypt
            HuksOptions.properties.splice(3, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_DIGEST,
                    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA1
                },
            )
            console.info(`enter promise doInit`);
            try {
                await huks.initSession(newSrcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                        handle = data.handle;
                        // expect(data.challenge == undefined).assertTrue();
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 401).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_106', 0, async function (done) {
            // HUKS_DIGEST_NONE error
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,

                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); // huksOptions.indata check inside this function
            HuksOptions.inData = plainData;

            //Encrypt
            HuksOptions.properties.splice(3, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_DIGEST,
                    value: huks.HuksKeyDigest.HUKS_DIGEST_NONE
                },
            )
            console.info(`enter promise doInit`);
            try {
                await huks.initSession(newSrcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                        handle = data.handle;
                        // expect(data.challenge == undefined).assertTrue();
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 401).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_107', 0, async function (done) {
            // HUKS_DIGEST_NONE error
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,

                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); // huksOptions.indata check inside this function
            HuksOptions.inData = plainData;

            //Encrypt
            HuksOptions.properties.splice(3, 1);
            console.info(`enter promise doInit`);
            try {
                await huks.initSession(newSrcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                        handle = data.handle;
                        // expect(data.challenge == undefined).assertTrue();
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 401).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1081', 0, async function (done) {
            // only use finish instead of update
            // indata is null
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            // plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata


            HuksOptions.inData = stringToUint8Array(new Array());
            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            let isEncrypt = true;
            console.info(`enter promise doFinish`);
            try {
                await huks.finishSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                        if (isEncrypt) {
                            encryptedResult = Array.from(data.outData);
                            console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                            expect(null).assertFail();
                        } else {
                            decryptedResult = Array.from(data.outData);
                            expect(null).assertFail();
                        }
                    })
                    .catch(error => {
                        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000014).assertTrue();

                    });
            } catch (error) {
                console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            }
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1082', 0, async function (done) {
            // use update and finish

            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            HuksOptions.inData = stringToUint8Array(new Array());
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            console.info(`enter promise doUpdate`);
            try {
                await huks.updateSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                    });
            } catch (error) {
                console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1091', 0, async function (done) {
            // only use finish instead of update
            // indata is null
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            // plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            // HuksOptions.inData = plainData;

            // console.info('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
            delete HuksOptions.inData;
            // HuksOptions.splice(1, 1); // delete inData.
            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            let isEncrypt = true;
            console.info(`enter promise doFinish`);
            try {
                await huks.finishSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                        if (isEncrypt) {
                            encryptedResult = Array.from(data.outData);
                            console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                            expect(null).assertFail();
                        } else {
                            decryptedResult = Array.from(data.outData);
                            expect(null).assertFail();
                        }
                    })
                    .catch(error => {
                        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000014).assertTrue();

                    });
            } catch (error) {
                console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1092', 0, async function (done) {
            // use update and finish

            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            delete HuksOptions.inData;
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            try {
                await huks.updateSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                    });
            } catch (error) {
                console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_110', 0, async function (done) {
            // use update and finish
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            HuksOptions.properties.splice(2, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                    value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_512
                },
            )
            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_111', 0, async function (done) {
            // use update and finish
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const srcKeyAlies2 = srcKeyAlies + '2';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicGenerateKeyFunc(srcKeyAlies2, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            HuksOptions.properties.splice(2, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                    value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_512
                },
            )
            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlies2, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            console.info(`enter promise doFinish`);
            let isEncrypt = true;
            try {
                await huks.finishSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                        if (isEncrypt) {
                            encryptedResult = Array.from(data.outData);
                            console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                            expect(null).assertFail();
                        } else {
                            decryptedResult = Array.from(data.outData);
                            expect(null).assertFail();
                        }
                    })
                    .catch(error => {
                        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                        // expect(error.code == 12000006).assertTrue();

                    });
            } catch (error) {
                console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);

            }
            //check
            // expect(arrayEqual(plainData, encryptedResult)).assertTrue();
            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_112', 0, async function (done) {
            // HUKS_DIGEST_NONE error
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,

                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); // huksOptions.indata check inside this function
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },
            );
            HuksOptions.properties.splice(3, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_DIGEST,
                    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA1
                },
            );

            HuksOptions.inData = new Uint8Array(encryptedResult);
            console.info(`enter promise doInit`);
            try {
                await huks.initSession(newSrcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                        handle = data.handle;
                        // expect(data.challenge == undefined).assertTrue();
                        // expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                        // expect(error.code == 401).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_113', 0, async function (done) {
            // HUKS_DIGEST_NONE error
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,

                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); // huksOptions.indata check inside this function
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },
            );
            HuksOptions.properties.splice(3, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_DIGEST,
                    value: huks.HuksKeyDigest.HUKS_DIGEST_NONE
                },
            );

            HuksOptions.inData = new Uint8Array(encryptedResult);
            console.info(`enter promise doInit`);
            try {
                await huks.initSession(newSrcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                        handle = data.handle;
                        // expect(data.challenge == undefined).assertTrue();
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 401).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_114', 0, async function (done) {
            // HUKS_DIGEST_NONE error
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,

                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is only one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); // huksOptions.indata check inside this function
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },
            );
            HuksOptions.properties.splice(3, 1);

            HuksOptions.inData = new Uint8Array(encryptedResult);
            console.info(`enter promise doInit`);
            try {
                await huks.initSession(newSrcKeyAlies, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
                        handle = data.handle;
                        // expect(data.challenge == undefined).assertTrue();
                        expect(null).assertFail();
                    })
                    .catch(error => {
                        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 401).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1151', 0, async function (done) {
            // only use finish instead of update
            // indata is null
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            // plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            //point
            HuksOptions.inData = stringToUint8Array(new Array());

            await publicInitFunc(srcKeyAlies, HuksOptions);
            let isEncrypt = false;
            console.info(`enter promise doFinish`);
            try {
                await huks.finishSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                        if (isEncrypt) {
                            encryptedResult = Array.from(data.outData);
                            console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                            expect(null).assertFail();
                        } else {
                            decryptedResult = Array.from(data.outData);
                            expect(null).assertFail();
                        }
                    })
                    .catch(error => {
                        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000014).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
                // expect(null).assertFail();
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1152', 0, async function (done) {
            // use update and finish

            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = stringToUint8Array(new Array());
            await publicInitFunc(srcKeyAlies, HuksOptions);
            console.info(`enter promise doUpdate`);
            try {
                await huks.updateSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                        expect(null).assertFail();

                    })
                    .catch(error => {
                        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000014).assertTrue();

                    });
            } catch (error) {
                console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1161', 0, async function (done) {
            // only use finish instead of update
            // indata is null
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            // plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);

            //point
            delete HuksOptions.inData;

            await publicInitFunc(srcKeyAlies, HuksOptions);
            let isEncrypt = false;
            console.info(`enter promise doFinish`);
            try {
                await huks.finishSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
                        if (isEncrypt) {
                            encryptedResult = Array.from(data.outData);
                            console.info(`promise: doFinish success, data2 = ` + encryptedResult);
                            expect(null).assertFail();
                        } else {
                            decryptedResult = Array.from(data.outData);
                            expect(null).assertFail();
                        }
                    })
                    .catch(error => {
                        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000014).assertTrue();
                    });
            } catch (error) {
                console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
                // expect(null).assertFail();
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_1162', 0, async function (done) {
            // use update and finish

            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await update(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            // HuksOptions.inData = stringToUint8Array(new Array());
            delete HuksOptions.inData;
            await publicInitFunc(srcKeyAlies, HuksOptions);
            console.info(`enter promise doUpdate`);
            try {
                await huks.updateSession(handle, HuksOptions)
                    .then((data) => {
                        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
                        expect(null).assertFail();

                    })
                    .catch(error => {
                        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                        expect(error.code == 12000014).assertTrue();

                    });
            } catch (error) {
                console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
            }

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_801', 0, async function (done) {
            // use update and finish
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData32Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            let encryptStartTime = new Date();
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            // delete console.info cuz it takes too long

            console.info(`enter promise doUpdate`);
            try {
                await huks.updateSession(handle, HuksOptions)
                    .then((data) => {
                    })
                    .catch(error => {
                        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                        expect(null).assertFail();
                    });
            } catch (error) {
                console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            }

            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);
            let encryptEndTime = new Date();

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            let DecryptStartTime = new Date();
            await publicInitFunc(srcKeyAlies, HuksOptions);
            console.info(`enter promise doUpdate`);
            try {
                await huks.updateSession(handle, HuksOptions)
                    .then((data) => {
                    })
                    .catch(error => {
                        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                        expect(null).assertFail();
                    });
            } catch (error) {
                console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            }
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, false);
            let DecryptEndTime = new Date();

            //check
            // @ts-ignore
            let diffEncrypt = encryptEndTime - encryptStartTime;
            // @ts-ignore
            let diffDecrypt = DecryptEndTime - DecryptStartTime;
            console.info('diffEncrypt time(ms) is  ' + diffEncrypt);
            console.info('diffDecrypt time(ms) is  ' + diffDecrypt);
            expect(diffEncrypt < 100).assertTrue();
            expect(diffDecrypt < 100).assertTrue();
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_802', 0, async function (done) {
            // only use finish instead of update
            const srcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256KeyAlias102';
            const newSrcKeyAlies = 'testCipherRSASize4096PADDINGNONESHA256NewKeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_SM2
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                ),
                inData: gInData1024Array,
            }
            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata
            HuksOptions.inData = plainData;

            //Encrypt
            let encryptStartTime = new Date();
            await publicInitFunc(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);
            let encryptEndTime = new Date();

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);
            let DecryptStartTime = new Date();
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await finish(HuksOptions, false);
            let DecryptEndTime = new Date();

            // @ts-ignore
            let diffEncrypt = encryptEndTime - encryptStartTime;
            // @ts-ignore
            let diffDecrypt = DecryptEndTime - DecryptStartTime;
            console.info('diffEncrypt time(ms) is  ' + diffEncrypt);
            console.info('diffDecrypt time(ms) is  ' + diffDecrypt);
            expect(diffEncrypt < 100).assertTrue()
            expect(diffDecrypt < 100).assertTrue()
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            await publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });


    });
}


