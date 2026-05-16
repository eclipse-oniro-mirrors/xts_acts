/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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


interface macInfo {
  dataRes: cryptoFramework.DataBlob,
  macObj: cryptoFramework.Mac
}

let stressTimeout: number = 1000 * 3;
let intervalTime: number = 1000;

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

async function convertSymKey(algName: string, data: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.convertKeySync(data);

    return syncSymKey;
  } catch (error) {
    console.error('convertSymKey error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function doMacPromise(spec: cryptoFramework.MacSpec,
  symKey: cryptoFramework.SymKey, msg: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
    await mac.init(symKey);
    if (msg.data.byteLength != 0) {
      await mac.update(msg);
    }
    let secret: cryptoFramework.DataBlob = await mac.doFinal();

    return secret;
  } catch (error) {
    console.error(`doMacPromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doMacSync(spec: cryptoFramework.MacSpec,
  symKey: cryptoFramework.SymKey, msg: cryptoFramework.DataBlob): cryptoFramework.DataBlob {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
    mac.initSync(symKey);
    mac.updateSync(msg);
    let secret: cryptoFramework.DataBlob = mac.doFinalSync();

    return secret;
  } catch (error) {
    console.error(`doMacSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doCmacSyncSpilt(spec: cryptoFramework.MacSpec, message: cryptoFramework.DataBlob,
  key: cryptoFramework.SymKey, blockSize: number): macInfo {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
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
    console.error(`doCmacSyncSpilt “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doCmacPromiseSpilt(spec: cryptoFramework.MacSpec, message: cryptoFramework.DataBlob,
  key: cryptoFramework.SymKey, blockSize: number): Promise<macInfo> {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(spec);
    await mac.init(key);
    let msgLen:number = message.data.byteLength;
    let iterate: number = msgLen / blockSize;
    let rem: number = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = message.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await mac.update(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = message.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        await mac.update(updateText);
      }
    }
    let dataRes: cryptoFramework.DataBlob = await mac.doFinal();

    return {dataRes: dataRes, macObj: mac};
  } catch (error) {
    console.error(`doCmacSyncSpilt “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doInitMacCallback(mac: cryptoFramework.Mac,
  symKey: cryptoFramework.SymKey): Promise<string> {
  return new Promise((resolve, reject) => {
    mac.init(symKey, (err) => {
      if (err) {
        reject(err)
      } else {
        resolve("init success")
      }
    });
  });
}

async function doUpdateMacCallback(mac: cryptoFramework.Mac,
  msg: cryptoFramework.DataBlob): Promise<string> {
  return new Promise((resolve, reject) => {
    mac.update(msg, (err) => {
      if (err) {
        reject(err.message);
      } else {
        resolve("update success")
      }
    });
  });
}

async function doFinalMacCallback(mac: cryptoFramework.Mac): Promise<cryptoFramework.DataBlob> {
  return new Promise((resolve, reject) => {
    mac.doFinal((err, rawData) => {
      if (err) {
        reject(err)
      } else {
        resolve(rawData)
      }
    });
  });
}

let C_MAC_SPEC = [
  "AES128", "AES256"
]

let aes256_key: number[] = [
  0x6c, 0xde, 0x14, 0xf5, 0xd5, 0x2a, 0x4a, 0xdf,
  0x12, 0x39, 0x1e, 0xbf, 0x36, 0xf9, 0x6a, 0x46,
  0x48, 0xd0, 0xb6, 0x51, 0x89, 0xfc, 0x24, 0x85,
  0xa8, 0x8d, 0xdf, 0x7e, 0x80, 0x14, 0xc8, 0xce,
]

let secret_null: number[] = [
  194,6,94,204,1,39,154,98,110, 206,167,157,166,197,163,95
]

interface vectorInfo {
  index:number;
  vectorSource: string;
  cipherName: string;
  key: number[];
  msg: number[];
  secret: number[];
}

let vectors: vectorInfo[] = [
  {
    index: 0,
    vectorSource: "RFC4493",
    cipherName: "AES128",
    key: [
      0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c
    ],
    msg: [],
    secret: [
      0xbb, 0x1d, 0x69, 0x29, 0xe9, 0x59, 0x37, 0x28, 0x7f, 0xa3, 0x7d, 0x12, 0x9b, 0x75, 0x67, 0x46
    ]
  },
  {
    index: 1,
    vectorSource: "RFC4493",
    cipherName: "AES128",
    key: [
      0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c
    ],
    msg: [
      0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a
    ],
    secret: [
      0x07, 0x0a, 0x16, 0xb4, 0x6b, 0x4d, 0x41, 0x44, 0xf7, 0x9b, 0xdd, 0x9d, 0xd0, 0x4a, 0x28, 0x7c
    ]
  },
  {
    index: 2,
    vectorSource: "RFC4493",
    cipherName: "AES128",
    key: [
      0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c
    ],
    msg: [
      0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
      0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
      0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11
    ],
    secret: [
      0xdf, 0xa6, 0x67, 0x47, 0xde, 0x9a, 0xe6, 0x30, 0x30, 0xca, 0x32, 0x61, 0x14, 0x97, 0xc8, 0x27
    ]
  },
  {
    index: 3,
    vectorSource: "RFC4493",
    cipherName: "AES128",
    key: [
      0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c
    ],
    msg: [
      0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
      0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
      0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, 0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
      0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17, 0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10,
    ],
    secret: [
      0x51, 0xf0, 0xbe, 0xbf, 0x7e, 0x3b, 0x9d, 0x92, 0xfc, 0x49, 0x74, 0x17, 0x79, 0x36, 0x3c, 0xfe
    ]
  },
  {
    index: 4,
    vectorSource: "nistspecialpublication800-38b.pdf",
    cipherName: "AES256",
    key: [
      0x60, 0x3d, 0xeb, 0x10, 0x15, 0xca, 0x71, 0xbe, 0x2b, 0x73, 0xae, 0xf0, 0x85, 0x7d, 0x77, 0x81,
      0x1f, 0x35, 0x2c, 0x07, 0x3b, 0x61, 0x08, 0xd7, 0x2d, 0x98, 0x10, 0xa3, 0x09, 0x14, 0xdf, 0xf4
    ],
    msg: [
      0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a
    ],
    secret: [
      0x28, 0xa7, 0x02, 0x3f, 0x45, 0x2e, 0x8f, 0x82, 0xbd, 0x4b, 0xf2, 0x8d, 0x8c, 0x37, 0xc3, 0x5c
    ]
  },
]


export {
  macInfo,
  aes256_key,
  genSymKey,
  convertSymKey,
  doMacPromise,
  doCmacPromiseSpilt,
  doMacSync,
  doCmacSyncSpilt,
  doInitMacCallback,
  doUpdateMacCallback,
  doFinalMacCallback,
  C_MAC_SPEC,
  secret_null,
  vectorInfo,
  vectors,
  stressTimeout,
  intervalTime
}