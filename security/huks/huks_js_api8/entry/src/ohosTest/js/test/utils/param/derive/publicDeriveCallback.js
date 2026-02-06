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
import { HksKeyStorageType, HksTag } from '../publicParam.js';
import { logger } from '../../common/logger.js';
import * as huksCallback from '../huksCallback.js';

let handle;

async function publicDeriveGenFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.generateKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicDeriveInitFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
    return HuksOptions;
}

async function publicDeriveUpdateFunc(HuksOptions) {
    await huksCallback.update(handle, HuksOptions)
        .then((data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test update err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInterfaceName) {
    if (thirdInterfaceName == 'finish') {
        await huksCallback.finish(handle, huksOptionsFinish)
            .then((data) => {
                logger.log(`test finish data ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            })
            .catch((err) => {
                logger.error('test finish err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    } else {
        let huksOptionsAbort = new Array({
            tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
            value: HksKeyStorageType.HKS_STORAGE_TEMP,
        });
        await huksCallback.abort(handle, huksOptionsAbort)
            .then((data) => {
                logger.log(`test abort data ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            })
            .catch((err) => {
                logger.error('test abort err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    }
}

async function publicDeriveDeleteFunc(srcKeyAlias, HuksOptions) {
    await huksCallback.deleteKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicDeriveFunc(srcKeyAlias, HuksOptions, huksOptionsFinish, deriveArray, thirdInterfaceName) {
    await publicDeriveGenFunc(srcKeyAlias, HuksOptions);
    let deriveArrAlg = HuksOptions.properties[0];
    let deriveArrLen = HuksOptions.properties[3];
    HuksOptions.properties.splice(0, 1, deriveArray[0]);
    HuksOptions.properties.splice(3, 1, deriveArray[1]);
    await publicDeriveInitFunc(srcKeyAlias, HuksOptions);
    await publicDeriveUpdateFunc(HuksOptions);
    await publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInterfaceName);
    HuksOptions.properties.splice(0, 1, deriveArrAlg);
    HuksOptions.properties.splice(3, 1, deriveArrLen);
    await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions);
}

export { publicDeriveFunc };
