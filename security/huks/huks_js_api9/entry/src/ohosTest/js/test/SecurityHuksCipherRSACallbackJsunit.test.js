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
let encryptedData;
let inputInData;
var handle;
let updateResult = new Array();
let exportKey;

let genHuksOptions = {
    properties: new Array(
        HuksCipherRSA.HuksKeyAlgRSA,
        HuksCipherRSA.HuksKeyPurpose,
        HuksCipherRSA.HuksKeyRSASize4096),
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
    huksOptions.inData = exportKey;
    try {
        await importKeyItem(keyAlias, huksOptions)
            .then((data) => {
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
                updateResult = Array.from(data.outData);
                console.info(`callback: doFinish success, data = ${JSON.stringify(data)}`);
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
        updateResult = new Array();
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

export default function SecurityHuksCipherRSACallbackJsunit() {
    describe('SecurityHuksCipherRSACallbackJsunit', function () {
        it('Security_HUKS_Cipher_API9_RSA_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias001';
            const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias001';
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

        it('Security_HUKS_Cipher_API9_RSA_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias002';
            const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias002';
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

        it('Security_HUKS_Cipher_API9_RSA_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias003';
            const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias003';
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

        it('Security_HUKS_Cipher_API9_RSA_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias004';
            const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias004';
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
    });
}
