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
import * as paramPublic from './publicDeriveParam.js';
import { HksTag, HksKeyStorageType } from '../publicParam';
let handle;
async function publicDeriveGenFunc(srcKeyAlies, HuksOptions) {
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

async function publicDeriveInitFunc(srcKeyAlies, HuksOptions) {
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

async function publicDeriveUpdateFunc(HuksOptions) {
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
}

async function publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInderfaceName) {
  if (thirdInderfaceName == 'finish') {
    await huks
      .finish(handle, huksOptionsFinish)
      .then((data) => {
        console.log(`test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.log('test finish err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else {
    let huksOptionsAbort = new Array({
      tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    await huks
      .abort(handle, huksOptionsAbort)
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

async function publicDeriveDeleteFunc(srcKeyAlies, HuksOptions) {
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

async function publicDeriveFunc(srcKeyAlies, HuksOptions, huksOptionsFinish, deriveArray, thirdInderfaceName) {
  try {
    await publicDeriveGenFunc(srcKeyAlies, HuksOptions);
    let deriveArrAlg = HuksOptions.properties[0];
    let deriveArrLen = HuksOptions.properties[3];
    HuksOptions.properties.splice(0, 1, deriveArray[0]);
    HuksOptions.properties.splice(3, 1, deriveArray[1]);

    await publicDeriveInitFunc(srcKeyAlies, HuksOptions);
    await publicDeriveUpdateFunc(HuksOptions);
    await publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInderfaceName);

    HuksOptions.properties.splice(0, 1, deriveArrAlg);
    HuksOptions.properties.splice(3, 1, deriveArrLen);
    await publicDeriveDeleteFunc(srcKeyAlies, HuksOptions);
  } catch (e) {
    expect(null).assertFail();
  }
}

export { publicDeriveFunc };