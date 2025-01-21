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

import { describe, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherRSA } from '../../../../../../../utils/param/cipher/publicCipherParam';
import { stringToUint8Array, uint8ArrayToString, arrayEqual } from '../../../../../../../utils/param/publicFunc';

let gInData64 =
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
    'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let gInData64Array = stringToUint8Array(gInData64);
let encryptedData;
let inputInData;
var handle;
let encryptedResult = new Array();
let exportKey;
let decryptedResult;
let plainData;


async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    await generateKey(srcKeyAlies, genHuksOptionsNONC)
        .then((data) => {
            console.error(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
            expect(data.outData == null).assertTrue();
            expect(data.properties == null).assertTrue();
            expect(huks.getSdkVersion(genHuksOptionsNONC) != null).assertTrue();
        })
        .catch((err) => {
            console.log('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

function generateKey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
            console.log(`test generateKey data: ${JSON.stringify(data)}`);
            if (err.code !== 0) {
                console.log('test generateKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    await exportkey(srcKeyAlies, genHuksOptionsNONC)
        .then((data) => {
            console.log(`test ExportKey data: ${JSON.stringify(data)}`);
            exportKey = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

function exportkey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.exportKey(srcKeyAlies, HuksOptions, function (err, data) {
            console.log(`test exportKey data: ${JSON.stringify(data)}`);
            if (err.code !== 0) {
                console.log('test exportKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
    let temp;
    if (HuksOptions.hasOwnProperty('inData')) {
        temp = HuksOptions.inData;
    }
    HuksOptions.inData = exportKey;
    await importkey(srcKeyAlies, HuksOptions)
        .then((data) => {
            if (HuksOptions.hasOwnProperty('inData')) {
                HuksOptions.inData = temp;
            }
            console.log(`test ImportKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

function importkey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.importKey(srcKeyAlies, HuksOptions, function (err, data) {
            console.log(`test importKey data: ${JSON.stringify(data)}`);
            if (err.code !== 0) {
                console.log('test importKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
    await init(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

function init(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.init(srcKeyAlies, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                console.log('test init err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
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
    await updateCallback(handle, HuksOptions)
        .then(async (data) => {
            console.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test update err information: ' + err);
            expect(null).assertFail();
        });
}

function updateCallback(handle, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.update(handle, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                console.log('test update err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
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
    try {
        await finishCallback(handle, HuksOptions)
            .then((data) => {
                console.log(`test finish data: ${JSON.stringify(data)}`);
                if (isEncrypt) {
                    encryptedResult = Array.from(data.outData);
                    console.info(`callback: doFinish success, data2 = ` + encryptedResult);
                } else {
                    decryptedResult = Array.from(data.outData);
                }
            })
            .catch(error => {
                console.error(`callback: doFinish failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function finishCallback(handle, huksOptionsFinish) {
    return new Promise((resolve, reject) => {
        huks.finish(handle, huksOptionsFinish, function (err, data) {
            if (err.code !== 0) {
                console.log('test generateKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

async function abort(HuksOptions) {
    await abortCallback(handle, HuksOptions)
        .then((data) => {
            console.log(`test abort data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test abort err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

function abortCallback(handle, huksOptionsAbort) {
    return new Promise((resolve, reject) => {
        huks.abort(handle, huksOptionsAbort, function (err, data) {
            if (err.code !== 0) {
                console.log('test abort err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
    await deleteKey(srcKeyAlies, genHuksOptionsNONC)
        .then((data) => {
            console.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

function deleteKey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                console.log('test deleteKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
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

export default function SecurityHuksRSABasicCallbackJsunit() {
    describe('SecurityHuksSM2BasicCallbackJsunit', function () {

        it('Security_HUKS_Cipher_API8_SM2_001', 0, async function (done) {
            const srcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_001A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_001B';

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
                inData: gInData64Array,
            }

            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyFunc(srcKeyAlies, genHuksOptions);
            await publicExportKeyFunc(srcKeyAlies, genHuksOptions);
            //public Key, purpose should change, cause there is noly one key
            await publicImportKeyFunc(newSrcKeyAlies, HuksOptions); //这里修改了huksOptions的.indata

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
            publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API8_SM2_002', 0, async function (done) {
            //init update finish
            const srcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_001A';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API8_SM2_001B';

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
                inData: gInData64Array,
            }

            //init
            encryptedResult = new Array();
            decryptedResult = new Array();
            plainData = HuksOptions.inData;

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
            HuksOptions.inData = new Uint8Array(encryptedResult);
            await publicInitFunc(srcKeyAlies, HuksOptions);
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            publicDeleteKeyFunc(srcKeyAlies, genHuksOptions);
            publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptions);
            done();
        });

    });
}
