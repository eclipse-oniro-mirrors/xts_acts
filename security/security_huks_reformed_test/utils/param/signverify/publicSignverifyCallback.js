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
import { expect } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import { HksKeyAlg } from '../publicParam.js';
import { HuksSignVerifyDSA } from './publicSignverifyParam.js';
import { stringToUint8Array, uint8ArrayToString } from '../publicFunc.js';
let finishOutData;
let exportKey;
let handle;

async function publicGenerateKeyItemFunc(keyAlias, huksOptions) {
  console.info(`enter callback generateKeyItem`);
  try {
    await generateKeyItem(keyAlias, huksOptions)
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

async function publicImportKeyItem(keyAlias, huksOptions) {
  console.info(`enter promise importKeyItem`);
  let _InData = huksOptions.inData;
  huksOptions.inData = exportKey;
  try {
    await importKeyItem(keyAlias, huksOptions)
      .then((data) => {
        console.info(`callback: importKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: importKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: importKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
  huksOptions.inData = _InData;
}

function importKeyItem(keyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.importKeyItem(keyAlias, huksOptions, function (error, data) {
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

async function publicExportKeyItem(srcKeyAlies, HuksOptions) {
  console.info(`enter callback export`);
  try {
    await exportKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: exportKeyItem success, data = ${JSON.stringify(data)}`);
        exportKey = data.outData;
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

async function publicInitSession(srcKeyAlies, HuksOptions) {
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

async function publicUpdateSessionFunc(HuksOptions) {
  const maxUpdateSize = 64;
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
    console.error(`enter promise doUpdate`);
    try {
      await updateSession(handle, HuksOptions)
        .then((data) => {
          console.error(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
          outData = outData.concat(Array.from(data.outData));
        })
        .catch(error => {
          console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
    if (inDataSegPosition + maxUpdateSize > lastInDataPosition) {
      isFinished = true;
      inDataSegSize = lastInDataPosition - inDataSegPosition + 1;
      console.error(`enter promise doUpdate`);
      break;
    }
    if ((!isFinished) && (inDataSegPosition + maxUpdateSize > lastInDataPosition)) {
      console.log(`update size invalid isFinished = ${isFinished}`);
      console.log(`inDataSegPosition = ${inDataSegPosition}`);
      console.log(`lastInDataPosition = ${lastInDataPosition}`);
      expect(null).assertFail();
      return;
    }
    inDataSegPosition += maxUpdateSize;
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

async function publicFinishSession(HuksOptionsFinish) {
  console.info(`enter callback doFinish`);
  try {
    await finishSession(handle, HuksOptionsFinish)
      .then((data) => {
        if (data !== null && data.outData !== null) {
          finishOutData = data.outData;
        }
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

async function publicAbortSession(HuksOptionsAbort) {
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

async function publicDeleteKeyItem(KeyAlias, HuksOptions) {
  console.info(`enter callback deleteKeyItem`);
  try {
    await deleteKeyItem(KeyAlias, HuksOptions)
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

async function publicSignVerifyFunc(srcKeyAlies, HuksOptions, thirdInderfaceName, isSING, rawData) {
  try {
    let keyAlias = srcKeyAlies;
    let purposeSignVerigy = HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY;
    let purposeSign = HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN;
    let PurposeVerify = HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY;
    if (isSING) {
      HuksOptions.properties.splice(1, 1, purposeSignVerigy);
      if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
        HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
      }
      await publicGenerateKeyItemFunc(keyAlias, HuksOptions);
      HuksOptions.properties.splice(1, 1, purposeSign);
      if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
        HuksOptions.properties.splice(2, 1);
      }
    } else {
      keyAlias = srcKeyAlies + 'New';
      finishOutData = HuksOptions.inData;
      await publicImportKeyItem(keyAlias, HuksOptions);
    }
    await publicInitSession(keyAlias, HuksOptions);
    HuksOptions.inData = rawData;
    await publicUpdateSessionFunc(HuksOptions);
    if (thirdInderfaceName == 'finish') {
      if (isSING) {
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishSession(HuksOptions);
        HuksOptions.properties.splice(1, 1, purposeSignVerigy);
        await publicExportKeyItem(keyAlias, HuksOptions);
      } else {
        HuksOptions.inData = finishOutData;
        await publicFinishSession(HuksOptions);
      }
    } else {
      await publicAbortSession(HuksOptions);
    }
    if (isSING && thirdInderfaceName == 'abort') {
      HuksOptions.properties.splice(1, 1, purposeSignVerigy);
    } else if (!isSING) {
      HuksOptions.properties.splice(1, 1, PurposeVerify);
    }
    await publicDeleteKeyItem(keyAlias, HuksOptions);
    return finishOutData;
  } catch (e) {
    expect(null).assertFail();
  }
}

export { publicSignVerifyFunc };
