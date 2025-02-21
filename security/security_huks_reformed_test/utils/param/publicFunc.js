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
import { HuksSignVerifyDSA } from "./signverify/publicSignverifyParam";
import Data from "../data.json";
let srcData65 = Data.Data65b;

function stringToArray(str) {
  let arr = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

function uint8ArrayToString(fileData) {
  let dataString = '';
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}
function stringToUint8Array(str) {
  let arr = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  let tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}
function arrayEqual(a, b) {
  if ((!a instanceof Array) || (!b instanceof Array)) {
    return false;
  }
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; ++i) {
    if ((!a instanceof Number) || (!b instanceof Number)) {
      return false;
    }
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

async function checkSoftware() {
  let dsaAlies = "useDsaToCheckSoftware";
  let dsaOption = {
    properties: new Array(
      HuksSignVerifyDSA.HuksKeyAlgDSA,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
      HuksSignVerifyDSA.HuksKeySIZE1024,
      HuksSignVerifyDSA.HuksTagDSADigestSHA256
    )
  };
  try {
    let res = await huks.generateKeyItem(dsaAlies, dsaOption);
    if (res == null) {
      await huks.deleteKeyItem(dsaAlies, dsaOption);
      console.error("This device uses software");
      return true;
    } else {
      console.error("This device does not use software");
      return false;
    }
  } catch (e) {
    return false;
  }
}

export { stringToArray, uint8ArrayToString, stringToUint8Array, arrayEqual, checkSoftware };
