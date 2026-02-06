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
import { HksKeyAlg } from '../publicParam.js';
import { HuksSignVerifyDSA } from './publicSignVerifyParam';
import { logger } from '../../common/logger.js';
import * as huksCallback from '../huksCallback.js';

let finishOutData;
let exportKeyData;
let handle;

async function publicGenerateKeyFunc(keyAlias, HuksOptions) {
    await huksCallback.generateKey(keyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicImportKey(keyAlias, HuksOptions) {
    let _InData = HuksOptions.inData;
    HuksOptions.inData = exportKeyData;
    await huksCallback.importKey(keyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test ImportKey data: ${JSON.stringify(data)}`);
        })
        .catch((err) => {
            logger.error('test ImportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
    HuksOptions.inData = _InData;
}

async function publicExportKey(keyAlias, HuksOptions) {
    await huksCallback.exportKey(keyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test exportKey data: ${JSON.stringify(data)}`);
            exportKeyData = data.outData;
        })
        .catch((err) => {
            logger.error('test exportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicInitFunc(keyAlias, HuksOptions) {
    await huksCallback.init(keyAlias, HuksOptions)
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

async function publicUpdateFunc(HuksOptions, isBigData) {
    const maxUpdateSize = isBigData ? 64000 : 64;
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
        logger.error(`enter promise doUpdate`);
        await huksCallback.update(handle, HuksOptions).then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            outData = outData.concat(Array.from(data.outData));
            expect(data.errorCode == 0).assertTrue();
        })
            .catch((err) => {
                logger.error('test update err information: ' + err);
                expect(null).assertFail();
            });
        if (inDataSegPosition + maxUpdateSize > lastInDataPosition) {
            isFinished = true;
            inDataSegSize = lastInDataPosition - inDataSegPosition + 1;
            logger.error(`enter promise doUpdate`);
            break;
        }
        if ((!isFinished) && (inDataSegPosition + maxUpdateSize > lastInDataPosition)) {
            logger.log(`update size invalid isFinished = ${isFinished}`);
            logger.log(`inDataSegPosition = ${inDataSegPosition}`);
            logger.log(`lastInDataPosition = ${lastInDataPosition}`);
            expect(null).assertFail();
            return;
        }
        inDataSegPosition += maxUpdateSize;
    }
}

async function publicFinishFunc(HuksOptions) {
    await huksCallback.finish(handle, HuksOptions)
        .then((data) => {
            logger.log(`test finish data: ${JSON.stringify(data)}`);
            finishOutData = data.outData;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test finish err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAbortFunc(HuksOptions) {
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

async function publicDeleteKeyFunc(KeyAlias, HuksOptions) {
    await huksCallback.deleteKey(KeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicSignVerifyFunc(srcKeyAlias, HuksOptions, thirdInterfaceName, isSign, isBigData, rawData) {
    let keyAlias = srcKeyAlias;
    let purposeSignVerify = HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY;
    let purposeSign = HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN;
    let PurposeVerify = HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY;
    if (isSign) {
        HuksOptions.properties.splice(1, 1, purposeSignVerify);
        if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
            HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
        }
        await publicGenerateKeyFunc(keyAlias, HuksOptions);
        HuksOptions.properties.splice(1, 1, purposeSign);
        if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
            HuksOptions.properties.splice(2, 1);
        }
    } else {
        keyAlias = srcKeyAlias + 'New';
        finishOutData = HuksOptions.inData;
        await publicImportKey(keyAlias, HuksOptions);
    }
    await publicInitFunc(keyAlias, HuksOptions);
    HuksOptions.inData = rawData;
    await publicUpdateFunc(HuksOptions, isBigData);
    if (thirdInterfaceName == 'finish') {
        if (isSign) {
            HuksOptions.inData = new Uint8Array(new Array());
            await publicFinishFunc(HuksOptions);
            HuksOptions.properties.splice(1, 1, purposeSignVerify);
            await publicExportKey(keyAlias, HuksOptions);
        } else {
            HuksOptions.inData = finishOutData;
            await publicFinishFunc(HuksOptions);
        }
    } else {
        await publicAbortFunc(HuksOptions);
    }
    if (isSign && thirdInterfaceName == 'abort') {
        HuksOptions.properties.splice(1, 1, purposeSignVerify);
    } else if (!isSign) {
        HuksOptions.properties.splice(1, 1, PurposeVerify);
    }
    await publicDeleteKeyFunc(keyAlias, HuksOptions);
    return finishOutData;
}

export { publicSignVerifyFunc };
