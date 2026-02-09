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
import { logger } from '../../common/logger.js';

let handle = 0;

export async function publicDeriveGenFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.generateKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicDeriveInitFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data ${JSON.stringify(data)}`);
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

export async function publicDeriveUpdateFunc(HuksOptions, expectValue) {
    await huks.update(handle, HuksOptions)
        .then((data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test update err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInterfaceName, expectValue) {
    if (thirdInterfaceName == 'finish') {
        await huks.finish(handle, huksOptionsFinish)
            .then((data) => {
                logger.log(`test finish data ${JSON.stringify(data)}`);
                expect(data.errorCode).assertEqual(expectValue);
            })
            .catch((err) => {
                logger.error('test finish err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    } else {
        await huks.abort(handle, huksOptionsFinish)
            .then((data) => {
                logger.log(`test abort data ${JSON.stringify(data)}`);
                expect(data.errorCode).assertEqual(expectValue);
            })
            .catch((err) => {
                logger.error('test abort err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    }
}

export async function publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.deleteKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export async function publicDeriveFunc(srcKeyAlias, HuksOptions, huksOptionsFinish, deriveArray, thirdInterfaceName) {
    await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
    let deriveArrAlg = HuksOptions.properties[0];
    let deriveArrLen = HuksOptions.properties[3];
    HuksOptions.properties.splice(0, 1, deriveArray[0]);
    HuksOptions.properties.splice(3, 1, deriveArray[1]);
    await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
    await publicDeriveUpdateFunc(HuksOptions, 0);
    await publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInterfaceName, 0);
    HuksOptions.properties.splice(0, 1, deriveArrAlg);
    HuksOptions.properties.splice(3, 1, deriveArrLen);
    await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
}
