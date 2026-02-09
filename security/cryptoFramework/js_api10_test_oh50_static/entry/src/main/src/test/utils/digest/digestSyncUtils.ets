/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';


let DIGEST_SPEC = [
  "SHA1", "SHA224", "SHA256", "SHA384",
  "SHA512", "MD5", "SM3"
]

interface mdInfo {
  dataRes: cryptoFramework.DataBlob,
  mdObj: cryptoFramework.Md
}

const SHA1_MD_SIZE   = 20;
const SHA224_MD_SIZE = 28;
const SHA256_MD_SIZE = 32;
const SHA384_MD_SIZE = 48;
const SHA512_MD_SIZE = 64;
const SM3_MD_SIZE    = 32;
const MD5_MD_SIZE    = 16;

function getMdSize(algName: string): int {
  switch (algName) {
    case "SHA1":
      return SHA1_MD_SIZE;
    case "SHA224":
      return SHA224_MD_SIZE;
    case "SHA256":
      return SHA256_MD_SIZE;
    case "SHA384":
      return SHA384_MD_SIZE;
    case "SHA512":
      return SHA512_MD_SIZE;
    case "SM3":
      return SM3_MD_SIZE;
    case "MD5":
      return MD5_MD_SIZE;
    default:
      return 0
  }
}

function doMdSync(algName: string, message: cryptoFramework.DataBlob): mdInfo {
  try {
    let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
    md.updateSync(message);
    let mdResult: cryptoFramework.DataBlob = md.digestSync();

    return {dataRes: mdResult, mdObj: md} as mdInfo;
  } catch (error) {
    console.error(`doMdSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doMdWithNoUpdateSync(algName: string): mdInfo {
  try {
    let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
    let mdResult: cryptoFramework.DataBlob = md.digestSync();

    return {dataRes: mdResult, mdObj: md} as mdInfo;
  } catch (error) {
    console.error(`doMdSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doMdSyncSplit(algName: string, message: cryptoFramework.DataBlob, blockSize: int): mdInfo {
  try {
    let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
    let msgLen: int = message.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = message.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      md.updateSync(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = message.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        md.updateSync(updateText);
      }
    }
    let mdResult: cryptoFramework.DataBlob = md.digestSync();

    return {dataRes: mdResult, mdObj: md} as mdInfo;
  } catch (error) {
    console.error(`doMdSyncSplit “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}


export {
  DIGEST_SPEC,
  mdInfo,
  getMdSize,
  doMdSync,
  doMdSyncSplit,
  doMdWithNoUpdateSync
}