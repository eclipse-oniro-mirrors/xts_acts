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

async function publicGenerateKeyItem(keyAlias, HuksOptions) {
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(keyAlias, HuksOptions)
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

async function publicImportKeyFunc(keyAlias, HuksOptions) {
  let _InData = HuksOptions.inData;
  HuksOptions.inData = exportKey;
  console.info(`enter promise importKeyItem`);
  try {
    await huks.importKeyItem(keyAlias, HuksOptions)
      .then((data) => {
        console.info(`promise: importKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: importKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: importKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
  HuksOptions.inData = _InData;
}

async function publicExportKeyFunc(keyAlias, HuksOptions) {
  console.info(`enter promise export`);
  try {
    await huks.exportKeyItem(keyAlias, HuksOptions)
      .then((data) => {
        console.info(`promise: exportKeyItem success, data = ${JSON.stringify(data)}`);
        exportKey = data.outData;
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

async function publicInitSessionFunc(keyAlias, HuksOptions) {
  console.info(`enter promise doInit`);
  try {
    await huks.initSession(keyAlias, HuksOptions)
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
      await huks.updateSession(handle, HuksOptions)
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

async function publicFinishSession(HuksOptions) {
  console.info(`enter promise doFinish:${JSON.stringify(HuksOptions)}`);
  try {
    await huks.finishSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
        if (data !== null && data.outData !== null) {
          finishOutData = data.outData;
        }
      })
      .catch(error => {
        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicAbortSession(HuksOptions) {
  console.info(`enter promise doAbort`);
  try {
    await huks.abortSession(handle, HuksOptions)
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

async function publicDeleteKeyItem(KeyAlias, HuksOptions) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(KeyAlias, HuksOptions)
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
      await publicGenerateKeyItem(keyAlias, HuksOptions);
      HuksOptions.properties.splice(1, 1, purposeSign);
      if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
        HuksOptions.properties.splice(2, 1);
      }
    } else {
      keyAlias = srcKeyAlies + 'New';
      finishOutData = HuksOptions.inData;
      await publicImportKeyFunc(keyAlias, HuksOptions);
    }
    await publicInitSessionFunc(keyAlias, HuksOptions);
    HuksOptions.inData = rawData;
    await publicUpdateSessionFunc(HuksOptions);
    if (thirdInderfaceName == 'finish') {
      if (isSING) {
        HuksOptions.inData = new Uint8Array(new Array());
        await publicFinishSession(HuksOptions);
        HuksOptions.properties.splice(1, 1, purposeSignVerigy);
        await publicExportKeyFunc(keyAlias, HuksOptions);
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
