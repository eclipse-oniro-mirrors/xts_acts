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
import { stringToUint8Array, uint8ArrayToString, arrayEqual} from '../../../../../../../utils/param/publicFunc';

let gInData512 = 'RSA_512_tttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let gInData512Array = stringToUint8Array(gInData512);
let defaultData = '0';
let plainData;
let encryptedData;
let inputInData;
var handle;
let encryptedResult = new Array();
let decryptedResult = new Array();
let exportKey;

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
    inData: new Uint8Array(defaultData),
};

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
                exportKey = data.outData;
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

async function publicImportKeyItem(keyAlias, huksOptions) {
    console.info(`enter promise importKeyItem`);

    let temp
    if (huksOptions.hasOwnProperty('inData')) {
        temp = huksOptions.inData;
    }
    huksOptions.inData = exportKey;
    try {
        await importKeyItem(keyAlias, huksOptions)
            .then((data) => {
                if (huksOptions.hasOwnProperty('inData')) {
                    huksOptions.inData = temp;
                }
                console.info(`callback: importKeyItem success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`callback: importKeyItem failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: importKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function importKeyItem(keyAlias, huksOptions) {
    return new Promise((resolve, reject) => {
        try {
            huks.importKeyItem(keyAlias, huksOptions, function (error, data) {
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

async function publicInitSession(srcKeyAlies, HuksOptions) {
    console.info(`enter callback doInit`);
    try {
        await initSession(srcKeyAlies, HuksOptions)
            .then((data) => {
                console.info(`callback1: doInit success, data = ${JSON.stringify(data)}`);
                handle = data.handle;
            })
            .catch((error) => {
                console.error(`callback1: doInit failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function initSession(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        try {
            huks.initSession(srcKeyAlies, HuksOptions, function (error, data) {
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

async function publicUpdateFunc(HuksOptions) {
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await publicUpdateSession(handle, HuksOptions);
        HuksOptions.inData = stringToUint8Array('0');
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await publicUpdateSession(handle, HuksOptions);
            HuksOptions.inData = huksOptionsInData;
        }
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
            await publicUpdateSession(handle, HuksOptions);
        }
    }
}

async function publicUpdateSession(handle, HuksOptions) {
    console.info(`enter callback doUpdate`);
    try {
        await updateSession(handle, HuksOptions)
            .then((data) => {
                console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function updateSession(handle, HuksOptions) {
    return new Promise((resolve, reject) => {
        try {
            huks.updateSession(handle, HuksOptions, function (error, data) {
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

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
    if (thirdInderfaceName == 'finish') {
        HuksOptions.inData = new Uint8Array(new Array());
        await finish(HuksOptions, isEncrypt);
    } else if (thirdInderfaceName == 'abort') {
        await abort(HuksOptions);
    }
}

async function finish(HuksOptions, isEncrypt) {
    console.info(`enter callback doFinish`);
    try {
        await finishSession(handle, HuksOptions)
            .then((data) => {
                if (isEncrypt) {
                    encryptedResult = Array.from(data.outData);
                    console.info(`callback: doFinish success, data = ${JSON.stringify(data)}`);
                }else{
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

function finishSession(handle, HuksOptionsFinish) {
    return new Promise((resolve, reject) => {
        try {
            huks.finishSession(handle, HuksOptionsFinish, function (error, data) {
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

async function abort(HuksOptions) {
    console.info(`enter callback doAbort`);
    try {
        await abortSession(handle, HuksOptions)
            .then((data) => {
                console.info(`callback: doAbort success, data = ${JSON.stringify(data)}`);
            })
            .catch(error => {
                console.error(`callback: doAbort failed, code: ${error.code}, msg: ${error.message}`);
                expect(null).assertFail();
            });
    } catch (error) {
        console.error(`callback: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
    }
}

function abortSession(handle, HuksOptionsAbort) {
    return new Promise((resolve, reject) => {
        try {
            huks.abortSession(handle, HuksOptionsAbort, function (error, data) {
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
            });
    } catch (error) {
        console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
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
            await publicGenerateKeyItemFunc(srcKeyAlies, genHuksOptionsNONC);
            encryptedData = HuksOptions.inData;
            await publicExportKeyItem(srcKeyAlies, genHuksOptionsNONC);
            await publicImportKeyItem(newSrcKeyAlies, HuksOptions);
            KeyAlias = newSrcKeyAlies;
        }
        HuksOptions.inData = inputInData;
        await publicInitSession(KeyAlias, HuksOptions);
        await publicUpdateFunc(HuksOptions);
        await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
        if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
            await publicDeleteKeyItem(srcKeyAlies, genHuksOptionsNONC);
            await publicDeleteKeyItem(newSrcKeyAlies, genHuksOptionsNONC);
        }
    } catch (e) {
        expect(null).assertFail();
    }
}

export default function SecurityHuksRSABasicCallbackJsunit() {
    describe('SecurityHuksSM2BasicCallbackJsunit', function () {
        it('Security_HUKS_Cipher_API9_SM2_001', 0, async function (done) {
            // init-update-finish
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_001_001';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_001_002';
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

            //init
            encryptedResult = new Array();
            encryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyItemFunc(srcKeyAlies, genHuksOptions)
            await publicExportKeyItem(srcKeyAlies, genHuksOptions);
            await publicImportKeyItem(newSrcKeyAlies, HuksOptions);

            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitSession(newSrcKeyAlies, HuksOptions);
            await publicUpdateSession(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);

            await publicInitSession(srcKeyAlies, HuksOptions);
            await publicUpdateSession(handle, HuksOptions)
            HuksOptions.inData = stringToUint8Array(new Array());
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            publicDeleteKeyItem(srcKeyAlies, genHuksOptions);
            publicDeleteKeyItem(newSrcKeyAlies, genHuksOptions);
            done();
        });

        it('Security_HUKS_Cipher_API9_SM2_002', 0, async function (done) {
            // init-finish
            const srcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_002_001';
            const newSrcKeyAlies = 'Security_HUKS_Cipher_API9_SM2_002_002';
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

            //init
            encryptedResult = new Array();
            encryptedResult = new Array();
            plainData = HuksOptions.inData;

            await publicGenerateKeyItemFunc(srcKeyAlies, genHuksOptions)
            await publicExportKeyItem(srcKeyAlies, genHuksOptions);
            await publicImportKeyItem(newSrcKeyAlies, HuksOptions);

            HuksOptions.inData = plainData;

            //Encrypt
            await publicInitSession(newSrcKeyAlies, HuksOptions);
            await finish(HuksOptions, true);

            //Decrypt
            HuksOptions.properties.splice(1, 1,
                {
                    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
                },);
            HuksOptions.inData = new Uint8Array(encryptedResult);

            await publicInitSession(srcKeyAlies, HuksOptions);
            await finish(HuksOptions, false);

            //check
            expect(arrayEqual(plainData, decryptedResult)).assertTrue();

            //delete
            publicDeleteKeyItem(srcKeyAlies, genHuksOptions);
            publicDeleteKeyItem(newSrcKeyAlies, genHuksOptions);
            done();
        });
    });
}