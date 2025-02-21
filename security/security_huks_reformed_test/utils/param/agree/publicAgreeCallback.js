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
import { HuksAgreeECDH } from './publicAgreeParam.js';
import { stringToUint8Array } from '../publicFunc.js';
import { expect } from 'deccjsunit/index';
let exportKeyFrist;
let exportKeySecond;
let handle;

async function publicAgreeGenFunc(srcKeyAlies, HuksOptions) {
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

async function publicAgreeExport1Func(srcKeyAlies, HuksOptions, exportKeys) {
  console.info(`enter callback export`);
  try {
    await exportKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: exportKeyItem success, data = ${JSON.stringify(data)}`);
        if (exportKeys == 1) {
          exportKeyFrist = data.outData;
        } else {
          exportKeySecond = data.outData;
        }
      })
      .catch(error => {
        console.error(`callback: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

function exportKeyItem(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.exportKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
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
async function publicAgreeInitFunc(srcKeyAlies, HuksOptions) {
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

async function publicAgreeUpdateFunc(HuksOptions, exportKey) {
  let _inData = HuksOptions.inData;
  if (exportKey == 1) {
    HuksOptions.inData = exportKeySecond;
  } else {
    HuksOptions.inData = exportKeyFrist;
  }
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
  HuksOptions.inData = _inData;
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

async function publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInderfaceName) {
  if (thirdInderfaceName == 'finish') {
    console.info(`enter callback doFinish`);
    try {
      await finishSession(handle, HuksOptionsFinish)
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
    let HuksOptionsAbort = new Array({
      tag: HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    console.info(`enter callback doAbort`);
    try {
      await abortSession(handle, HuksOptionsAbort)
        .then((data) => {
          console.info(`callback: doAbort success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doAbort failed, code: ${error.code}, msg: ${error.message}`);
        });
    } catch (error) {
      console.error(`callback: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
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

async function publicAgreeDeleteFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter callback deleteKeyItem`);
  try {
    await deleteKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
      });
  } catch (error) {
    console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
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

async function publicAgreeFunc(
  srcKeyAliesFrist,
  srcKeyAliesSecond,
  HuksOptions,
  HuksOptionsFinish,
  thirdInderfaceName
) {
  try {
    await publicAgreeGenFunc(srcKeyAliesFrist, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliesSecond, HuksOptions);
    await publicAgreeExport1Func(srcKeyAliesFrist, HuksOptions, 1);
    await publicAgreeExport1Func(srcKeyAliesSecond, HuksOptions, 2);

    if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_ECC) {
      HuksOptions.properties.splice(0, 1, HuksAgreeECDH.HuksKeyAlgECDH);
      HuksOptions.properties.splice(3, 1);
      HuksOptions.properties.splice(4, 1);
      HuksOptions.properties.splice(5, 1);
    }

    await publicAgreeInitFunc(srcKeyAliesFrist, HuksOptions);
    await publicAgreeUpdateFunc(HuksOptions, 1);
    await publicAgreeFinishAbortFunc(HuksOptionsFinish, thirdInderfaceName);

    let tempHuksOptionsFinish = HuksOptionsFinish;
    let HuksOptionsFinishSecond = tempHuksOptionsFinish;
    HuksOptionsFinishSecond.properties.splice(6, 1, {
      tag: HksTag.HKS_TAG_KEY_ALIAS,
      value: stringToUint8Array(srcKeyAliesSecond + 'final'),
    });

    await publicAgreeInitFunc(srcKeyAliesSecond, HuksOptions);
    await publicAgreeUpdateFunc(HuksOptions, 2);
    await publicAgreeFinishAbortFunc(HuksOptionsFinishSecond, thirdInderfaceName);

    await publicAgreeDeleteFunc(srcKeyAliesFrist, HuksOptions);
    if (thirdInderfaceName == 'finish') {
      await publicAgreeDeleteFunc(srcKeyAliesSecond + 'final', HuksOptions);
    }
    await publicAgreeDeleteFunc(srcKeyAliesSecond, HuksOptions);
  } catch (e) {
    expect(null).assertFail();
  }
}
export { publicAgreeFunc };
