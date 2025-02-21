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

async function publicGenerateKeyFunc(keyAlias, HuksOptions) {
  await generateKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test generateKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicImportKey(keyAlias, HuksOptions) {
  let _InData = HuksOptions.inData;
  HuksOptions.inData = exportKey;
  await importKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test ImportKey data: ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
  HuksOptions.inData = _InData;
}

function importKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.importKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test importKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test importKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicExportKey(keyAlias, HuksOptions) {
  await exportkey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function exportkey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.exportKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test exportKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicInitFunc(keyAlias, HuksOptions) {
  await init(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle = data.handle;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function init(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.init(srcKeyAlies, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test init err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicUpdateFunc(HuksOptions) {
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
    await updateCallback(handle, HuksOptions).then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      outData = outData.concat(Array.from(data.outData));
      expect(data.errorCode == 0).assertTrue();
    })
      .catch((err) => {
        console.log('test update err information: ' + err);
        expect(null).assertFail();
      });
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

function updateCallback(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.update(handle, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test update err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicFinishFunc(HuksOptions) {
  await finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      finishOutData = data.outData;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function finish(handle, HuksOptionsFinish) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, HuksOptionsFinish, function (err, data) {
      if (err.code !== 0) {
        console.log('test generateKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicAbortFucn(HuksOptions) {
  await abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function abort(handle, HuksOptionsAbort) {
  return new Promise((resolve, reject) => {
    huks.abort(handle, HuksOptionsAbort, function (err, data) {
      if (err.code !== 0) {
        console.log('test abort err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicDeleteKeyFunc(KeyAlias, HuksOptions) {
  await deleteKey(KeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test deleteKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
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
      await publicGenerateKeyFunc(keyAlias, HuksOptions);
      HuksOptions.properties.splice(1, 1, purposeSign);
      if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
        HuksOptions.properties.splice(2, 1);
      }
    } else {
      keyAlias = srcKeyAlies + 'New';
      finishOutData = HuksOptions.inData;
      await publicImportKey(keyAlias, HuksOptions);
    }
    await publicInitFunc(keyAlias, HuksOptions);
    HuksOptions.inData = rawData;
    await publicUpdateFunc(HuksOptions);
    if (thirdInderfaceName == 'finish') {
      if (isSING) {
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishFunc(HuksOptions);
        HuksOptions.properties.splice(1, 1, purposeSignVerigy);
        await publicExportKey(keyAlias, HuksOptions);
      } else {
        HuksOptions.inData = finishOutData;
        await publicFinishFunc(HuksOptions);
      }
    } else {
      await publicAbortFucn(HuksOptions);
    }
    if (isSING && thirdInderfaceName == 'abort') {
      HuksOptions.properties.splice(1, 1, purposeSignVerigy);
    } else if (!isSING) {
      HuksOptions.properties.splice(1, 1, PurposeVerify);
    }
    await publicDeleteKeyFunc(keyAlias, HuksOptions);
    return finishOutData;
  } catch (e) {
    expect(null).assertFail();
  }
}

export { publicSignVerifyFunc };
