/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { doScryptCallback } from '../common/commonUtils';

let stressTimeout: int = 1000 * 3;
let intervalTime: int = 1000;
let keyLens: int[] = [
  1, 16, 32, 64, 128, 256, 512, 1024, 3072, 4096, 8192
]

enum CallbackType {
  TYPE_IS_SYNC = 0,
  TYPE_IS_PROMISE = 1,
  TYPE_IS_CALLBACK = 2,
}

interface secretResult {
  ret: boolean;
  code: number;
  secret:cryptoFramework.DataBlob;
}

async function doScryptKdfPromise(spec: cryptoFramework.KdfSpec): Promise<cryptoFramework.DataBlob> {
  try {
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("SCRYPT");

    let secret: cryptoFramework.DataBlob = await kdf.generateSecret(spec);

    return secret;
  } catch (error) {
    console.error(`doScryptKdfPromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doScryptKdfSync(spec: cryptoFramework.KdfSpec): cryptoFramework.DataBlob {
  try {
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("SCRYPT");

    let secret: cryptoFramework.DataBlob = kdf.generateSecretSync(spec);

    return secret;
  } catch (error) {
    console.error(`doScryptKdfSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doScryptKdfCallback(kdf: cryptoFramework.Kdf,
  spec: cryptoFramework.ScryptSpec): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    kdf.generateSecret(spec, (err: BusinessError<void>|null, rawData: cryptoFramework.DataBlob|undefined) => {
      if (err || rawData === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        resolve(rawData as cryptoFramework.DataBlob);
      }
    });
  });
}

async function  doScryptKdfTaskPool(maxMemory: long, n: long, r: long, p: long,
  keySize: int, passphrase:string|Uint8Array, salt: Uint8Array, type: CallbackType): Promise<secretResult> {
  let code: number = 0;
  let secret: cryptoFramework.DataBlob;
  try {
    let spec: cryptoFramework.ScryptSpec = {
      algName: "SCRYPT",
      passphrase: passphrase,
      salt: salt,
      n: n,
      r: r,
      p: p,
      maxMemory: maxMemory, // SCRYPT_MAX_MEM
      keySize: keySize
    }
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf("SCRYPT");
    if (type == 0) {
      secret = kdf.generateSecretSync(spec);
    } else if (type == 1) {
      secret = await kdf.generateSecret(spec);
    } else {
      secret  = await doScryptCallback(kdf, spec);
    }
    console.info("################ keySize:" + secret.data.length)
    let ret: boolean = secret.data.length == keySize ? true: false;
    console.info("################## data:" + secret.data)
    return {ret:ret, code: code, secret: secret} as secretResult;
  } catch (error) {
    console.error(`doScryptKdfTaskPool “${error}“, error code: ${error.code}`);
    code = error.code as number;
    let secret: cryptoFramework.DataBlob = {data: new Uint8Array()} as cryptoFramework.DataBlob;
    return {ret:false, code: code, secret: secret} as secretResult;
  }
}

interface vectorKdfInfo {
  index: number;
  vectorSource: string;
  passphrase: string;
  salt: string;
  n: long;
  r: long;
  p: long;
  keySize: int;
  secret: number[];
}

let vectors: vectorKdfInfo[] = [
  {
    index: 0,
    vectorSource: "RFC7914",
    passphrase: "password",
    salt: "NaCl",
    n: 1024,
    r: 8,
    p: 16,
    keySize: 64,
    secret: [
      0xfd, 0xba, 0xbe, 0x1c, 0x9d, 0x34, 0x72, 0x00, 0x78, 0x56, 0xe7, 0x19, 0x0d, 0x01, 0xe9, 0xfe,
      0x7c, 0x6a, 0xd7, 0xcb, 0xc8, 0x23, 0x78, 0x30, 0xe7, 0x73, 0x76, 0x63, 0x4b, 0x37, 0x31, 0x62,
      0x2e, 0xaf, 0x30, 0xd9, 0x2e, 0x22, 0xa3, 0x88, 0x6f, 0xf1, 0x09, 0x27, 0x9d, 0x98, 0x30, 0xda,
      0xc7, 0x27, 0xaf, 0xb9, 0x4a, 0x83, 0xee, 0x6d, 0x83, 0x60, 0xcb, 0xdf, 0xa2, 0xcc, 0x06, 0x40,
    ]
  },
  {
    index: 1,
    vectorSource: "RFC7914",
    passphrase: "pleaseletmein",
    salt: "SodiumChloride",
    n: 16384,
    r: 8,
    p: 1,
    keySize: 64,
    secret: [
      0x70, 0x23, 0xbd, 0xcb, 0x3a, 0xfd, 0x73, 0x48, 0x46, 0x1c, 0x06, 0xcd, 0x81, 0xfd, 0x38, 0xeb,
      0xfd, 0xa8, 0xfb, 0xba, 0x90, 0x4f, 0x8e, 0x3e, 0xa9, 0xb5, 0x43, 0xf6, 0x54, 0x5d, 0xa1, 0xf2,
      0xd5, 0x43, 0x29, 0x55, 0x61, 0x3f, 0x0f, 0xcf, 0x62, 0xd4, 0x97, 0x05, 0x24, 0x2a, 0x9a, 0xf9,
      0xe6, 0x1e, 0x85, 0xdc, 0x0d, 0x65, 0x1e, 0x40, 0xdf, 0xcf, 0x01, 0x7b, 0x45, 0x57, 0x58, 0x87,
    ]
  }
]


export {
  stressTimeout,
  intervalTime,
  CallbackType,
  secretResult,
  doScryptKdfPromise,
  doScryptKdfSync,
  doScryptKdfCallback,
  doScryptCallback,
  doScryptKdfTaskPool,
  keyLens,
  vectorKdfInfo,
  vectors,
}