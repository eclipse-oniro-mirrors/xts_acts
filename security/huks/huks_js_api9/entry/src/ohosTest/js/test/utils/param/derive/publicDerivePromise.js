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
import * as paramPublic from './publicDeriveParam';
import { HksTag, HksKeyStorageType } from '../publicParam';
let handle;
async function publicDeriveGenFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicDeriveInitFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise doInit`);
  try {
    await huks.initSession(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch(error => {
        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicDeriveUpdateFunc(HuksOptions) {
  console.info(`enter promise doUpdate`);
  try {
    await huks.updateSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInderfaceName) {
  if (thirdInderfaceName == 'finish') {
    console.info(`enter promise doFinish`);
    try {
      await huks.finishSession(handle, huksOptionsFinish)
        .then((data) => {
          console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  } else {
    let huksOptionsAbort = new Array({
      tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    console.info(`enter promise doAbort`);
    try {
      await huks.abortSession(handle, huksOptionsAbort)
        .then((data) => {
          console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  }
}

async function publicDeriveDeleteFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
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
