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
import cryptoFramework from '@ohos.security.cryptoFramework';

let H_MAC_SPEC = [
  "SHA1", "SHA224", "SHA256", "SHA384",
  "SHA512", "MD5", "SHA3-256", "SHA3-384", "SHA3-512", "SM3"
]

const H_MAC_SHA1_SIZE   = 20;
const H_MAC_SHA224_SIZE = 28;
const H_MAC_SHA256_SIZE = 32;
const H_MAC_SHA384_SIZE = 48;
const H_MAC_SHA512_SIZE = 64;
const H_MAC_SHA3_256_SIZE = 32;
const H_MAC_SHA3_384_SIZE = 48;
const H_MAC_SHA3_512_SIZE = 64;
const H_MAC_SM3_SIZE    = 32;
const H_MAC_MD5_SIZE    = 16;

function getMacSize(algName: string): number {
  switch (algName) {
    case "SHA1":
      return H_MAC_SHA1_SIZE;
    case "SHA224":
      return H_MAC_SHA224_SIZE;
    case "SHA256":
      return H_MAC_SHA256_SIZE;
    case "SHA384":
      return H_MAC_SHA384_SIZE;
    case "SHA512":
      return H_MAC_SHA512_SIZE;
    case "SHA3-256":
      return H_MAC_SHA3_256_SIZE;
    case "SHA3-384":
      return H_MAC_SHA3_384_SIZE;
    case "SHA3-512":
      return H_MAC_SHA3_512_SIZE;
    case "SM3":
      return H_MAC_SM3_SIZE;
    case "MD5":
      return H_MAC_MD5_SIZE;
    default:
      return 0
  }
}

interface macInfo {
  dataRes: cryptoFramework.DataBlob,
  macObj: cryptoFramework.Mac
}

async function genSymKey(algName: string): Promise<cryptoFramework.SymKey> {
  try {
    let aesGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey: cryptoFramework.SymKey = await aesGenerator.generateSymKey();

    return symKey;
  } catch (error) {
    console.error(`genSymKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function convertSymKey(algName: string, dataKey: cryptoFramework.DataBlob) {
  try {
    let generator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey: cryptoFramework.SymKey = await generator.convertKey(dataKey);

    return symKey;
  } catch (error) {
    console.error(`convertSymKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createData(dataLen: number): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function doHmacSync(algName: string, message: cryptoFramework.DataBlob, key: cryptoFramework.SymKey): macInfo {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
    mac.initSync(key);
    mac.updateSync(message);
    let dataRes: cryptoFramework.DataBlob = mac.doFinalSync();

    return {dataRes: dataRes, macObj: mac};
  } catch (error) {
    console.error(`doHmac “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doHmacPromise(algName: string,
  message: cryptoFramework.DataBlob, key: cryptoFramework.SymKey): Promise<macInfo> {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
    await mac.init(key);
    await mac.update(message);
    let dataRes: cryptoFramework.DataBlob = await mac.doFinal();

    return {dataRes: dataRes, macObj: mac};
  } catch (error) {
    console.error(`doHmacPromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function macInitCallback(algName: string, key: cryptoFramework.SymKey): Promise<cryptoFramework.Mac> {
  let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);

  return new Promise<cryptoFramework.Mac>((resolve, reject) => {
    mac.init(key, (err) => {
      if (err) {
        reject(err);
      } else {
        resolve(mac);
      }
    });
  });
}

async function macUpdateCallback(mac: cryptoFramework.Mac,
  message: cryptoFramework.DataBlob): Promise<cryptoFramework.Mac> {
  return new Promise<cryptoFramework.Mac>((resolve, reject) => {
    mac.update(message, (err) => {
      if (err) {
        reject(err);
      } else {
        resolve(mac);
      }
    });
  });
}

async function macDoFinalCallback(mac: cryptoFramework.Mac): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    mac.doFinal((err, data) => {
      if (err) {
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function doHmacCallback(algName: string,
  message: cryptoFramework.DataBlob, key: cryptoFramework.SymKey): Promise<macInfo> {
  try {
    let mac: cryptoFramework.Mac = await macInitCallback(algName, key);
    await macUpdateCallback(mac, message);
    let dataRes: cryptoFramework.DataBlob = await macDoFinalCallback(mac);

    return {dataRes: dataRes, macObj: mac};
  } catch (error) {
    console.error(`doHmacCallback “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doHmacNoMessageSync(algName: string, key: cryptoFramework.SymKey): macInfo {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
    mac.initSync(key);
    let dataRes: cryptoFramework.DataBlob = mac.doFinalSync();

    return {dataRes: dataRes, macObj: mac};
  } catch (error) {
    console.error(`doHmac “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doHmacSyncSpilt(algName: string, message: cryptoFramework.DataBlob, key: cryptoFramework.SymKey, blockSize: number): macInfo {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
    mac.initSync(key);
    let msgLen:number = message.data.byteLength;
    let iterate: number = msgLen / blockSize;
    let rem: number = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = message.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      mac.updateSync(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = message.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        mac.updateSync(updateText);
      }
    }
    let dataRes: cryptoFramework.DataBlob = mac.doFinalSync();

    return {dataRes: dataRes, macObj: mac};
  } catch (error) {
    console.error(`doHmac “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

export {
  H_MAC_SPEC,
  macInfo,
  getMacSize,
  doHmacSync,
  doHmacPromise,
 	doHmacCallback,
  doHmacNoMessageSync,
  doHmacSyncSpilt,
  genSymKey,
  convertSymKey,
  createData
}