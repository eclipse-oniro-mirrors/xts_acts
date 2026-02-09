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
import huks from '@ohos.security.huks';
import { HksKeyAlg, HksTag } from '../publicParam.js';
import { HuksAgreeECDH } from './publicAgreeParam.js';
import { stringToUint8Array } from '../publicFunc.js';
import { expect } from '@ohos/hypium';
import { logger } from '../../common/logger.js';

let exportKeyFirst;
let exportKeySecond;
let handle = 0;

function resetHandle() {
    handle = 0;
}

async function publicAgreeGenFunc(srcKeyAlias, HuksOptions) {
    await huks.generateKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeExportFunc(srcKeyAlias, HuksOptions, exportKey) {
    await huks.exportKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test exportKey data: ${JSON.stringify(data)}`);
            if (exportKey == 1) {
                exportKeyFirst = data.outData;
            } else {
                exportKeySecond = data.outData;
            }
        })
        .catch((err) => {
            logger.error('test exportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeInitFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeUpdateFunc(HuksOptions, exportKey, expectValue) {
    let _inData = HuksOptions.inData;
    if (exportKey == 1) {
        HuksOptions.inData = exportKeySecond;
    } else {
        HuksOptions.inData = exportKeyFirst;
    }
    await huks.update(handle, HuksOptions)
        .then((data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error('test update err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
    HuksOptions.inData = _inData;
}

async function publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInterfaceName, expectValue) {
    if (thirdInterfaceName == 'finish') {
        await huks.finish(handle, HuksOptionsFinish)
            .then((data) => {
                logger.log(`test finish data ${JSON.stringify(data)}`);
                expect(data.errorCode).assertEqual(expectValue);
            })
            .catch((err) => {
                logger.error('test finish err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    } else {
        await huks.abort(handle, HuksOptionsFinish)
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

async function publicAgreeDeleteFunc(srcKeyAlias, HuksOptions, expectValue) {
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

async function publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions, HuksOptionsFinish, thirdInterfaceName, isDeleteFinalKeys,) {
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
    if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_ECC) {
        HuksOptions.properties.splice(0, 1, HuksAgreeECDH.HuksKeyAlgECDH);
        HuksOptions.properties.splice(3, 1);
        HuksOptions.properties.splice(4, 1);
        HuksOptions.properties.splice(5, 1);
    }
    let HuksOptionsInit = JSON.parse(JSON.stringify(HuksOptions));
    HuksOptionsInit.properties.splice(2, 1, HuksOptionsFinish.properties[3])
    //1st Agree
    HuksOptionsFinish.properties.splice(6, 1, {
        tag: HksTag.HKS_TAG_KEY_ALIAS,
        value: stringToUint8Array(srcKeyAliasFirst + 'final'),
    });
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptionsInit, 0);
    await publicAgreeUpdateFunc(HuksOptions, 1, 0);
    await publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInterfaceName, 0);
    //2nd Agree
    let tempHuksOptionsFinish = HuksOptionsFinish;
    let HuksOptionsFinishSecond = tempHuksOptionsFinish;
    HuksOptionsFinishSecond.properties.splice(6, 1, {
        tag: HksTag.HKS_TAG_KEY_ALIAS,
        value: stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptionsInit, 0);
    await publicAgreeUpdateFunc(HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(HuksOptionsFinishSecond, thirdInterfaceName, 0);
    //Delete
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    if (thirdInterfaceName == 'finish' && isDeleteFinalKeys) {
        await publicAgreeDeleteFunc(srcKeyAliasFirst + 'final', HuksOptions, 0);
        await publicAgreeDeleteFunc(srcKeyAliasSecond + 'final', HuksOptions, 0);
    }
}

export {
    publicAgreeDeleteFunc,
    publicAgreeExportFunc,
    publicAgreeFinishAbortFunc,
    publicAgreeFunc,
    publicAgreeGenFunc,
    publicAgreeInitFunc,
    publicAgreeUpdateFunc,
    resetHandle
};
