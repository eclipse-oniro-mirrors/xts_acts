/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { cryptoFramework } from "@kit.CryptoArchitectureKit";
import { asyncType } from "../common/commonUtils";
import { BusinessError } from '@ohos.base';

let SHA3_SPEC = [
  "SHA3-256", "SHA3-384", "SHA3-512"
]

function doMdSync(md: cryptoFramework.Md, message: cryptoFramework.DataBlob): cryptoFramework.DataBlob {
  try {
    md.updateSync(message);
    let mdResult: cryptoFramework.DataBlob = md.digestSync();
    return mdResult;
  } catch (error: BusinessError) {
    console.error(`doMdSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doMdPromise(md: cryptoFramework.Md, message: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    await md.update(message);
    let mdResult: cryptoFramework.DataBlob = await md.digest();
    return mdResult;
  } catch (error: BusinessError) {
    console.error(`doMdPromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doUpdate(md: cryptoFramework.Md, message: cryptoFramework.DataBlob): Promise<void> {
  try {
    return new Promise<void>((resolve, reject) => {
      md.update(message, (err) => {
        if (err) {
          reject(err as Error);
        } else {
          resolve(undefined);
        }
      });
    });
  } catch (error: BusinessError) {
    console.error(`doUpdate “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doDigest(md: cryptoFramework.Md): Promise<cryptoFramework.DataBlob> {
  try {
    return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
      md.digest((err, data) => {
        if (err) {
          reject(err as Error);
        } else {
          if (data) {
            resolve(data);
          } else {
            resolve({data: new Uint8Array()} as cryptoFramework.DataBlob);
          }
        }
      });
    });
  } catch (error: BusinessError) {
    console.error(`doDigest “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doMdCallBack(md: cryptoFramework.Md, message: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    await doUpdate(md, message);
    let mdResult: cryptoFramework.DataBlob = await doDigest(md);

    return mdResult;
  } catch (error: BusinessError) {
    console.error(`doMdCallBack “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doMdSyncSplit(md: cryptoFramework.Md, message: cryptoFramework.DataBlob,
  blockSize: int): cryptoFramework.DataBlob {
  try {
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
    }
    if (rem != 0) {
      let tmp = message.data.subarray(blockSize * iterate, msgLen);
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      md.updateSync(updateText);
    }
    let mdResult: cryptoFramework.DataBlob = md.digestSync();

    return mdResult;
  } catch (error: BusinessError) {
    console.error(`doMdSyncSplit “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doMdPromiseSplit(md: cryptoFramework.Md, message: cryptoFramework.DataBlob,
  blockSize: int): Promise<cryptoFramework.DataBlob> {
  try {
    let msgLen: int = message.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = message.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await md.update(updateText);
    }
    if (rem != 0) {
      let tmp = message.data.subarray(blockSize * iterate, msgLen);
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await md.update(updateText);
    }
    let mdResult: cryptoFramework.DataBlob = await md.digest();

    return mdResult;
  } catch (error: BusinessError) {
    console.error(`doMdPromiseSplit “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doMdCallBackSplit(md: cryptoFramework.Md, message: cryptoFramework.DataBlob,
  blockSize: int): Promise<cryptoFramework.DataBlob> {
  try {
    let msgLen: int = message.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = message.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await doUpdate(md, updateText);
    }
    if (rem != 0) {
      let tmp = message.data.subarray(blockSize * iterate, msgLen);
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await doUpdate(md, updateText);
    }
    let mdResult: cryptoFramework.DataBlob = await doDigest(md);

    return mdResult;
  } catch (error: BusinessError) {
    console.error(`doMdCallBackSplit “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doMd(md: cryptoFramework.Md, msg: cryptoFramework.DataBlob,
  type: asyncType = asyncType.TYPE_IS_PROMISE): Promise<cryptoFramework.DataBlob> {
  try {
    let rawData: cryptoFramework.DataBlob = { data: new Uint8Array() };
    switch (type) {
      case asyncType.TYPE_IS_SYNC:
        rawData = doMdSync(md, msg);
        break;
      case asyncType.TYPE_IS_PROMISE:
        rawData = await doMdPromise(md, msg);
        break;
      default:
        rawData = await doMdCallBack(md, msg);
        break;
    }
    return rawData;
  } catch (error: BusinessError) {
    console.error(`doMd “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doMdSpilt(md: cryptoFramework.Md, msg: cryptoFramework.DataBlob, blockSize: int,
  type: asyncType = asyncType.TYPE_IS_PROMISE): Promise<cryptoFramework.DataBlob> {
  try {
    let rawData: cryptoFramework.DataBlob = { data: new Uint8Array() };
    switch (type) {
      case asyncType.TYPE_IS_SYNC:
        rawData = doMdSyncSplit(md, msg, blockSize);
        break;
      case asyncType.TYPE_IS_PROMISE:
        rawData = await doMdPromiseSplit(md, msg, blockSize);
        break;
      default:
        rawData = await doMdCallBackSplit(md, msg, blockSize);
        break;
    }
    return rawData;
  } catch (error: BusinessError) {
    console.error(`doMd “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

export {
  doMdCallBack,
  doDigest,
  doMd,
  doMdSpilt,
  SHA3_SPEC
}