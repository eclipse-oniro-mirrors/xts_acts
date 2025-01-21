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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherAES } from './cipher/publicCipherParam';
import { HksTag } from './publicParam';
import { stringToUint8Array, uint8ArrayToString, checkSoftwar, arrayEqual } from './publicFunc';
import { Data64b } from '../data.json';
let IV = '0000000000000000';
let AAD = '0000000000000000';
let NONCE = '00000000000';
let AEAD = '0000000000000000';
let useSoftware = true;

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = 'Hks_AES_Cipher_Test_000000000000000000000000000000000000000_string';
let srcData65Kb = stringToUint8Array(srcData65);
let srcData64Kb = stringToUint8Array(Data64b)
let updateResult = new Array();
let finishData = new Array();
let dataBeforeEncrypt = new Array();
let handle;
let res = true;

async function publicInitFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise doInit`);
  try {
    await huks.initSession(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch(error => {
        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
        res = false;
      });
  } catch (error) {
    console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    res = false;
  }
}

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  let dateSize = 64;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = new Uint8Array(new Array());
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt, 0);
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
      await update(handle, HuksOptions);
    }
    HuksOptions.inData = huksOptionsInData;
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
      );
    } else {
      HuksOptions.inData = new Uint8Array(new Array());
    }
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
  }
}

async function update(handle, HuksOptions) {
  console.info(`enter promise doUpdate`);
  try {
    await huks.updateSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
        if (updateResult.length !== 0) {
          console.log(`test update outDatalength ${updateResult.length}`);
          updateResult = updateResult.concat(Array.from(data.outData));
        } else {
          console.log(`test update outDatalength ${updateResult.length}`);
          updateResult = Array.from(data.outData);
        }
      })
      .catch(error => {
        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
        res = false;
      });
  } catch (error) {
    console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
    res = false;
  }
}

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  if (thirdInderfaceName == 'finish') {
    await finish(HuksOptions, isEncrypt);
  } else if (thirdInderfaceName == 'abort') {
    await abort(HuksOptions);
  }
}

async function finish(HuksOptions, isEncrypt) {
  console.info(`enter promise doFinish`);
  try {
    await huks.finishSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
        if (dataBeforeEncrypt.length > 64) {
          finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
          updateResult = updateResult.concat(Array.from(data.outData));
        } else {
          console.info(`updateResult: updateResult success, data = ${JSON.stringify(updateResult)}`);
          finishData = uint8ArrayToString(updateResult);
        }
      })
      .catch(error => {
        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
        res = false;
      });
  } catch (error) {
    console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
    res = false;
  }
}

async function abort(HuksOptions) {
  console.info(`enter promise doAbort`);
  try {
    await huks.abortSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
        res = false;
      });
  } catch (error) {
    console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
    res = false;
  }
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlies, genHuksOptionsNONECBC)
      .then((data) => {
        console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        res = false;
      });
  } catch (error) {
    console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    res = false;
  }
}

async function publicCipherFunc(srcKeyAlies, HuksOptions, thirdInderfaceName, isEncrypt) {
  try {
    updateResult = new Array();
    if (isEncrypt) {
      // await publicGenerateKeyFunc(srcKeyAlies);
      dataBeforeEncrypt = HuksOptions.inData; //原始数据
    }
    await publicInitFunc(srcKeyAlies, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
    }
  } catch (e) {
    res = false;
  }
}

async function checkAESChiper(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions) {
  updateResult = new Array();
  HuksOptions.inData = srcData64Kb;
  HuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
  
  //加密
  await publicCipherFunc(srcKeyAliesFirst, HuksOptions, 'finish', true);
  //解密
  HuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyPurposeENCRYPT);
  HuksOptions.inData = new Uint8Array(updateResult);
  await publicCipherFunc(srcKeyAliesSecond, HuksOptions, 'finish', false);
  // let arrayEqualRes = false;
  let arrayEqualRes = arrayEqual(Array.from(updateResult), Array.from(srcData64Kb))
  // console.info('arrayEqualRes is ' + arrayEqualRes);
  if (!arrayEqualRes) { // if not success then res comes to false
    res = false;
  }

  // console.info('res before return is ' + res);
  return res;
}

export { checkAESChiper };