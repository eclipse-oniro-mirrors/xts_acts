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
import { HksTag, HksKeyStorageType, HksKeyAlg } from '../publicParam.js';
import { HuksAgreeECDH } from './publicAgreeParam.js';
import { stringToUint8Array } from '../publicFunc.js';
import { expect } from '@ohos/hypium';

let exportKeyFrist;
let exportKeySecond;
let handle;

async function publicAgreeGenFunc(srcKeyAlies, HuksOptions) {
    await huks
        .generateKey(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeExport1Func(srcKeyAlies, HuksOptions, exportKey) {
    await huks
        .exportKey(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test exportKey data: ${JSON.stringify(data)}`);
            if (exportKey == 1) {
                exportKeyFrist = data.outData;
            } else {
                exportKeySecond = data.outData;
            }
        })
        .catch((err) => {
            console.log('test exportKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeInitFunc(srcKeyAlies, HuksOptions) {
    await huks
        .init(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test init data ${JSON.stringify(data)}`);
            handle = data.handle;
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test init err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeUpdateFunc(HuksOptions, exportKey) {
    let _inData = HuksOptions.inData;
    if (exportKey == 1) {
        HuksOptions.inData = exportKeySecond;
    } else {
        HuksOptions.inData = exportKeyFrist;
    }
    await huks
        .update(handle, HuksOptions)
        .then((data) => {
            console.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test update err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
    HuksOptions.inData = _inData;
}

async function publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInderfaceName) {
    if (thirdInderfaceName == 'finish') {
        await huks
            .finish(handle, HuksOptionsFinish)
            .then((data) => {
                console.log(`test finish data ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            })
            .catch((err) => {
                console.log('test finish err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    } else {
        let HuksOptionsAbort = new Array({
            tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
            value: HksKeyStorageType.HKS_STORAGE_TEMP,
        });
        await huks
            .abort(handle, HuksOptionsAbort)
            .then((data) => {
                console.log(`test abort data ${JSON.stringify(data)}`);
                expect(data.errorCode == 0).assertTrue();
            })
            .catch((err) => {
                console.log('test abort err information: ' + JSON.stringify(err));
                expect(null).assertFail();
            });
    }
}

async function publicAgreeDeleteFunc(srcKeyAlies, HuksOptions) {
    await huks
        .deleteKey(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test deleteKey data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicAgreeFunc(
    srcKeyAliesFirst,
    srcKeyAliesSecond,
    HuksOptions,
    HuksOptionsFinish,
    thirdInderfaceName,
    isDeleteFinalKeys,
) {
    try {
        await publicAgreeGenFunc(srcKeyAliesFirst, HuksOptions);
        await publicAgreeGenFunc(srcKeyAliesSecond, HuksOptions);
        await publicAgreeExport1Func(srcKeyAliesFirst, HuksOptions, 1);
        await publicAgreeExport1Func(srcKeyAliesSecond, HuksOptions, 2);

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
            value: stringToUint8Array(srcKeyAliesFirst + 'final'),
        });
        await publicAgreeInitFunc(srcKeyAliesFirst, HuksOptionsInit);
        await publicAgreeUpdateFunc(HuksOptions, 1);
        await publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInderfaceName);

        //2nd Agree
        let tempHuksOptionsFinish = HuksOptionsFinish;
        let HuksOptionsFinishSecond = tempHuksOptionsFinish;
        HuksOptionsFinishSecond.properties.splice(6, 1, {
            tag: HksTag.HKS_TAG_KEY_ALIAS,
            value: stringToUint8Array(srcKeyAliesSecond + 'final'),
        });
        await publicAgreeInitFunc(srcKeyAliesSecond, HuksOptionsInit);
        await publicAgreeUpdateFunc(HuksOptions, 2);
        await publicAgreeFinishAbortFunc(HuksOptionsFinishSecond, thirdInderfaceName);

        //Delete
        await publicAgreeDeleteFunc(srcKeyAliesFirst, HuksOptions);
        await publicAgreeDeleteFunc(srcKeyAliesSecond, HuksOptions);
        if (thirdInderfaceName == 'finish' && isDeleteFinalKeys) {
            await publicAgreeDeleteFunc(srcKeyAliesFirst + 'final', HuksOptions);
            await publicAgreeDeleteFunc(srcKeyAliesSecond + 'final', HuksOptions);
        }
    } catch (e) {
        expect(null).assertFail();
    }
}

export { publicAgreeFunc };
