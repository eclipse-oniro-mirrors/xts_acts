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
import { expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { stringToUint8Array, uint8ArrayToString } from '../publicFunc';
import { HuksCipherRSA } from './publicCipherParam';
import { logger } from '../../common/logger.js';

let ginData32 = 'RSA_32_ttttttttttttttttttttttttt';
let ginData32array = stringToUint8Array(ginData32);

let encryptedData;
let inputInData;
let exportKey;
let handle = 0;

export let updateResult = new Array();

export function resetValue() {
    handle = 0;
    updateResult = new Array();
    encryptedData = ginData32array;
    exportKey = {};
}

export async function publicGenerateKeyFunc(srcKeyAlias, genHuksOptions) {
    await huks.generateKey(srcKeyAlias, genHuksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicExportKeyFunc(srcKeyAlias, genHuksOptions) {
    await huks.exportKey(srcKeyAlias, genHuksOptions)
        .then((data) => {
            logger.log(`test exportKey data: ${JSON.stringify(data)}`);
            exportKey = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test exportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicImportKeyFunc(srcKeyAlias, HuksOptions) {
    HuksOptions.inData = exportKey;
    await huks.importKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test importKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test importKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicInitFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
            if (expectValue == 0) {
                handle = data.handle;
            }
        })
        .catch((err) => {
            logger.error('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicUpdateFunc(HuksOptions, expectValue) {
    if (expectValue != 0) {
        await updateFunc(HuksOptions, expectValue);
        return;
    }
    let dateSize = 64;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = HuksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await updateFunc(HuksOptions, expectValue);
        HuksOptions.inData = stringToUint8Array('0');
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await updateFunc(HuksOptions, expectValue);
            HuksOptions.inData = huksOptionsInData;
        }
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
            await updateFunc(HuksOptions, expectValue);
        }
    }
}

export async function updateFunc(HuksOptions, expectValue) {
    await huks.update(handle, HuksOptions)
        .then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test update err information: ' + err);
            expect(null).assertFail();
        });
}

export async function publicFinishAbortFunc(HuksOptions, thirdInterfaceName, isEncrypt, expectValue) {
    if (thirdInterfaceName == 'finish') {
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishFunc(HuksOptions, isEncrypt, expectValue);
    } else if (thirdInterfaceName == 'abort') {
        await publicAbortFunc(HuksOptions, expectValue);
    }
}

export async function publicFinishFunc(HuksOptions, isEncrypt, expectValue) {
    await huks.finish(handle, HuksOptions)
        .then((data) => {
            logger.log(`test finish data: ${JSON.stringify(data)}`);
            if (expectValue != 0) {
                expect(data.errorCode).assertEqual(expectValue);
                return;
            }
            if (isEncrypt) {
                updateResult = Array.from(data.outData);
                if (uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)) {
                    expect(null).assertFail();
                } else {
                    expect(data.errorCode).assertEqual(expectValue);
                }
            }
            if (!isEncrypt) {
                if (uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)) {
                    expect(data.errorCode).assertEqual(0);
                } else {
                    expect(data.errorCode).assertEqual(expectValue);
                }
            }
        })
        .catch((err) => {
            logger.error('test finish err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicAbortFunc(HuksOptions, expectValue) {
    await huks.abort(handle, HuksOptions)
        .then((data) => {
            logger.log(`test abort data: ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test abort err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, expectValue) {
    await huks.deleteKey(srcKeyAlias, genHuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicCipherFunc(srcKeyAlias, newSrcKeyAlias, genHuksOptions, huksOptions, thirdInterfaceName, isEncrypt) {
    inputInData = huksOptions.inData;
    updateResult = new Array();
    let KeyAlias = srcKeyAlias;
    if (isEncrypt) {
        await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
        encryptedData = huksOptions.inData;
        await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
        await publicImportKeyFunc(newSrcKeyAlias, huksOptions);
        KeyAlias = newSrcKeyAlias;
    }
    huksOptions.inData = inputInData;
    await publicInitFunc(KeyAlias, huksOptions, 0);
    await publicUpdateFunc(huksOptions, 0);
    await publicFinishAbortFunc(huksOptions, thirdInterfaceName, isEncrypt, 0);
    if (!isEncrypt || (isEncrypt && thirdInterfaceName == 'abort')) {
        await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions, 0);
        await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions, 0);
    }
    return updateResult;
}

export async function publicCipher(srcKeyAlias, newSrcKeyAlias, genHuksOptions, HuksOptions) {
    let inputInData = HuksOptions.inData;
    await publicGenerateKeyFunc(srcKeyAlias, genHuksOptions);
    await publicExportKeyFunc(srcKeyAlias, genHuksOptions);
    HuksOptions.properties.splice(1, 0, HuksCipherRSA.HuksKeyPurposeENCRYPT);
    await publicImportKeyFunc(newSrcKeyAlias, HuksOptions);

    HuksOptions.inData = inputInData;
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(HuksOptions, 0);
    await publicFinishAbortFunc(HuksOptions, 'finish', true, 0);
    return updateResult;
}

