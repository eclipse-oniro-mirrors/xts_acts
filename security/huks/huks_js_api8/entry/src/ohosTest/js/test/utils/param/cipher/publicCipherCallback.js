/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { stringToUint8Array, uint8ArrayToString } from '../publicFunc.js';
import * as huksCallback from '../huksCallback.js';
import { logger } from '../../common/logger.js';

let encryptedData;
let inputInData;
var handle;
let updateResult = new Array();
var handle;
let exportKeyData;

export async function publicGenerateKeyFunc(srcKeyAlias, huksOptions) {
    await huksCallback.generateKey(srcKeyAlias, huksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicExportKeyFunc(srcKeyAlias, huksOptions) {
    await huksCallback.exportKey(srcKeyAlias, huksOptions)
        .then((data) => {
            logger.log(`test exportKey data: ${JSON.stringify(data)}`);
            exportKeyData = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test exportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicImportKeyFunc(srcKeyAlias, huksOptions) {
    huksOptions.inData = exportKeyData;
    await huksCallback.importKey(srcKeyAlias, huksOptions)
        .then((data) => {
            logger.log(`test importKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test importKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicInitFunc(srcKeyAlias, huksOptions) {
    await huksCallback.init(srcKeyAlias, huksOptions)
        .then((data) => {
            logger.log(`test init data: ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicUpdateFunc(huksOptions) {
    let dateSize = 64;
    let tempHuksOptionsInData = huksOptions.inData;
    let inDataArray = huksOptions.inData;
    if (Array.from(inDataArray).length < dateSize) {
        await updateFunc(handle, huksOptions);
        huksOptions.inData = stringToUint8Array('0');
    } else {
        let count = Math.floor(Array.from(inDataArray).length / dateSize);
        let remainder = Array.from(inDataArray).length % dateSize;
        for (let i = 0; i < count; i++) {
            huksOptions.inData = new Uint8Array(Array.from(tempHuksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
            await updateFunc(handle, huksOptions);
            huksOptions.inData = tempHuksOptionsInData;
        }
        if (remainder !== 0) {
            huksOptions.inData = new Uint8Array(
                Array.from(tempHuksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
            );
            await updateFunc(handle, huksOptions);
        }
    }
}

export async function updateFunc(handle, huksOptions) {
    await huksCallback.update(handle, huksOptions)
        .then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test update err information: ' + err);
            expect(null).assertFail();
        });
}

export async function publicFinishAbortFunc(huksOptions, thirdInterfaceName, isEncrypt) {
    if (thirdInterfaceName == 'finish') {
        huksOptions.inData = new Uint8Array(new Array());
        await publicFinishFunc(huksOptions, isEncrypt);
    } else if (thirdInterfaceName == 'abort') {
        await publicAbortFunc(huksOptions);
    }
}

export async function publicFinishFunc(HuksOptions, isEncrypt) {
    await huksCallback.finish(handle, HuksOptions)
        .then((data) => {
            logger.log(`test finish data: ${JSON.stringify(data)}`);
            if (isEncrypt) {
                updateResult = Array.from(data.outData);
                if (uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)) {
                    expect(null).assertFail();
                } else {
                    expect(data.errorCode == 0).assertTrue();
                }
            }
            if (!isEncrypt) {
                if (uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)) {
                    expect(data.errorCode == 0).assertTrue();
                } else {
                    expect(null).assertFail();
                }
            }
        })
        .catch((err) => {
            logger.error('test finish err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicAbortFunc(HuksOptions) {
    await huksCallback.abort(handle, HuksOptions)
        .then((data) => {
            logger.log(`test abort data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test abort err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicDeleteKeyFunc(srcKeyAlias, genHuksOptions) {
    await huksCallback.deleteKey(srcKeyAlias, genHuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
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
    await publicInitFunc(KeyAlias, huksOptions);
    await publicUpdateFunc(huksOptions);
    await publicFinishAbortFunc(huksOptions, thirdInterfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInterfaceName == 'abort')) {
        await publicDeleteKeyFunc(srcKeyAlias, genHuksOptions);
        await publicDeleteKeyFunc(newSrcKeyAlias, genHuksOptions);
    }
    return updateResult;
}

