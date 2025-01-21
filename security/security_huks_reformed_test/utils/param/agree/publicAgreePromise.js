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
import huks from '@ohos.security.huks';
import { HksTag, HksKeyStorageType, HksKeyAlg } from '../publicParam';
import { HuksAgreeECDH } from './publicAgreeParam';
import { stringToUint8Array } from '../publicFunc';
import { expect } from 'deccjsunit/index';
let exportKeyFrist;
let exportKeySecond;
let handle;

async function publicAgreeGenFunc(srcKeyAlies, HuksOptions) {
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

async function publicAgreeExport1Func(srcKeyAlies, HuksOptions, exportKey) {
  console.info(`enter promise export`);
  try {
    await huks.exportKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: exportKeyItem success, data = ${JSON.stringify(data)}`);
        if (exportKey == 1) {
          exportKeyFrist = data.outData;
        } else {
          exportKeySecond = data.outData;
        }
      })
      .catch(error => {
        console.error(`promise: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicAgreeInitFunc(srcKeyAlies, HuksOptions) {
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

async function publicAgreeUpdateFunc(HuksOptions, exportKey) {
  let _inData = HuksOptions.inData;
  if (exportKey == 1) {
    HuksOptions.inData = exportKeySecond;
  } else {
    HuksOptions.inData = exportKeyFrist;
  }
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
  HuksOptions.inData = _inData;
}

async function publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInderfaceName) {
  if (thirdInderfaceName == 'finish') {
    console.info(`enter promise doFinish`);
    try {
      await huks.finishSession(handle, HuksOptionsFinish)
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
    let HuksOptionsAbort = new Array({
      tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    console.info(`enter promise doAbort`);
    try {
      await huks.abortSession(handle, HuksOptionsAbort)
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

async function publicAgreeDeleteFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise deleteKeyItem`);
  console.info(`promise: deleteKeyItem now, data = ${srcKeyAlies}`);
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

async function publicAgreeFunc(srcKeyAliesFirst,
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
    await publicAgreeDeleteFunc(srcKeyAliesFirst, HuksOptions);
    await publicAgreeDeleteFunc(srcKeyAliesSecond, HuksOptions);
    // do not delete this one
    if (thirdInderfaceName == 'finish' && isDeleteFinalKeys) {
      //   console.info('come to there');
      await publicAgreeDeleteFunc(srcKeyAliesFirst + 'final', HuksOptions);
      await publicAgreeDeleteFunc(srcKeyAliesSecond + 'final', HuksOptions);
    }
  } catch (error) {
    console.error(`dont know`);
    expect(null).assertFail();
  }
}
export { publicAgreeFunc };
