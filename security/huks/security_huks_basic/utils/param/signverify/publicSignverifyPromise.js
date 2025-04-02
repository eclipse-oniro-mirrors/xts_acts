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
import { HksKeyAlg } from '../publicParam.js';
import { HuksSignVerifyDSA } from './publicSignverifyParam.js';
import { stringToUint8Array, uint8ArrayToString } from '../publicFunc.js';
let finishOutData;
let exportKey;
let handle;

async function publicGenerateKeyFunc(keyAlias, HuksOptions) {
  await huks
    .generateKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicImportKey(keyAlias, HuksOptions) {
  let _InData = HuksOptions.inData;
  HuksOptions.inData = exportKey;
  await huks
    .importKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test ImportKey data: ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
  HuksOptions.inData = _InData;
}

async function publicExportKey(keyAlias, HuksOptions) {
  await huks
    .exportKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicInitFunc(keyAlias, HuksOptions) {
  await huks
    .init(keyAlias, HuksOptions)
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
    await huks.update(handle, HuksOptions)
      .then((data) => {
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

async function publicFinishFunc(HuksOptions) {
  await huks
    .finish(handle, HuksOptions)
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

async function publicAbortFucn(HuksOptions) {
  await huks
    .abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeleteKeyFunc(KeyAlias, HuksOptions) {
  await huks
    .deleteKey(KeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
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
