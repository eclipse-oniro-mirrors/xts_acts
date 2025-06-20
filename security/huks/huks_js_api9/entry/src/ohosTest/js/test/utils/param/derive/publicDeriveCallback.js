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
  console.info(`enter callback generateKeyItem`);
  try {
    await generateKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function generateKeyItem(keyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.generateKeyItem(keyAlias, huksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicDeriveInitFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter callback doInit`);
  try {
    await initSession(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback1: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch((error) => {
        console.error(`callback1: doInit failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function initSession(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.initSession(srcKeyAlies, HuksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicDeriveUpdateFunc(HuksOptions) {
  console.info(`enter callback doUpdate`);
  try {
    await updateSession(handle, HuksOptions)
      .then((data) => {
        console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function updateSession(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.updateSession(handle, HuksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInderfaceName) {
  if (thirdInderfaceName == 'finish') {
    console.info(`enter callback doFinish`);
    try {
      await finishSession(handle, huksOptionsFinish)
        .then((data) => {
          console.info(`callback: doFinish success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doFinish failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  } else {
    let huksOptionsAbort = new Array({
      tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    console.info(`enter callback doAbort`);
  try {
    await abortSession(handle, huksOptionsAbort)
      .then ((data) => {
        console.info(`callback: doAbort success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: doAbort failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
  }
}

function abortSession(handle, HuksOptionsAbort) {
  return new Promise((resolve, reject) => {
    try {
      huks.abortSession(handle, HuksOptionsAbort, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

function finishSession(handle, HuksOptionsFinish) {
  return new Promise((resolve, reject) => {
    try {
      huks.finishSession(handle, HuksOptionsFinish, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicDeriveDeleteFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter callback deleteKeyItem`);
  try {
    await deleteKeyItem(srcKeyAlies, HuksOptions)
      .then ((data) => {
        console.info(`callback: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function deleteKeyItem(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.deleteKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
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
