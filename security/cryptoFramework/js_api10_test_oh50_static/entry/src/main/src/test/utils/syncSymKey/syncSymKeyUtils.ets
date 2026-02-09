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
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { asyncType } from '../common/commonUtils';


const DES64_KEY_SIZE = 8

const DES64_WEAK_KEYS: number[][] = [
  // weak keys
  [0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01],
  [0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE],
  [0x1F, 0x1F, 0x1F, 0x1F, 0x0E, 0x0E, 0x0E, 0x0E],
  [0xE0, 0xE0, 0xE0, 0xE0, 0xF1, 0xF1, 0xF1, 0xF1],
  // semi-weak keys
  [0x01, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0xFE],
  [0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01],
  [0x1F, 0xE0, 0x1F, 0xE0, 0x0E, 0xF1, 0x0E, 0xF1],
  [0xE0, 0x1F, 0xE0, 0x1F, 0xF1, 0x0E, 0xF1, 0x0E],
  [0x01, 0xE0, 0x01, 0xE0, 0x01, 0xF1, 0x01, 0xF1],
  [0xE0, 0x01, 0xE0, 0x01, 0xF1, 0x01, 0xF1, 0x01],
  [0x1F, 0xFE, 0x1F, 0xFE, 0x0E, 0xFE, 0x0E, 0xFE],
  [0xFE, 0x1F, 0xFE, 0x1F, 0xFE, 0x0E, 0xFE, 0x0E],
  [0x01, 0x1F, 0x01, 0x1F, 0x01, 0x0E, 0x01, 0x0E],
  [0x1F, 0x01, 0x1F, 0x01, 0x0E, 0x01, 0x0E, 0x01],
  [0xE0, 0xFE, 0xE0, 0xFE, 0xF1, 0xFE, 0xF1, 0xFE],
  [0xFE, 0xE0, 0xFE, 0xE0, 0xFE, 0xF1, 0xFE, 0xF1]
]

const DES64_MODE = [
  "ECB", "CBC", "CFB", "OFB"
]

const DES64_PADDING = [
  "NoPadding", "PKCS7", "PKCS5"
]

function createSymKeySync(algName: string): cryptoFramework.DataBlob {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.generateSymKeySync();
    let encodedKey: cryptoFramework.DataBlob = syncSymKey.getEncoded();

    return encodedKey;
  } catch (error: BusinessError) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function createSymKey(algName: string): cryptoFramework.SymKey {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.generateSymKeySync();

    return syncSymKey;
  } catch (error: BusinessError) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createSymKeyPromise(algName: string): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();

    return symKey;
  } catch (error: BusinessError) {
    console.error('Promise error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createSymKeyCallback(algName: string): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    return new Promise<cryptoFramework.SymKey>((resolve, reject) => {
      symKeyGenerator.generateSymKey((err: BusinessError<void>|null, symKey: cryptoFramework.SymKey|undefined) => {
        if (err || symKey === undefined) { // success: error is null, failed: data is undefined
          reject(err as Error);
        } else {
          resolve(symKey as cryptoFramework.SymKey)
        }
      })
    })
  } catch (error: BusinessError) {
    console.error('callback error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function generateSymKey(algName: string, type: asyncType): Promise<cryptoFramework.SymKey> {
  let symKey: cryptoFramework.SymKey;
  if (type == asyncType.TYPE_IS_SYNC) {
    symKey = createSymKey(algName);
  } else if (type == asyncType.TYPE_IS_PROMISE) {
    symKey = await createSymKeyPromise(algName);
  } else {
    symKey = await createSymKeyCallback(algName);
  }

  return symKey;
}

function convertSymKeySync(algName: string, data: cryptoFramework.DataBlob): cryptoFramework.SymKey {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.convertKeySync(data);

    return syncSymKey;
  } catch (error: BusinessError) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertSymKeyPromise(algName: string, data: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = await symKeyGenerator.convertKey(data);

    return syncSymKey;
  } catch (error: BusinessError) {
    console.error('promise error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertSymKeyCallback(algName: string, data: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    return new Promise<cryptoFramework.SymKey>((resolve, reject) => {
      symKeyGenerator.convertKey(data, (err: BusinessError<void>|null, symKey: cryptoFramework.SymKey|undefined) => {
        if (err || symKey === undefined) { // success: error is null, failed: data is undefined
          reject(err as Error);
        } else {
          resolve(symKey as cryptoFramework.SymKey)
        }
      })
    })
  } catch (error: BusinessError) {
    console.error('callback error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertSymKey(algName: string, data: cryptoFramework.DataBlob, type: asyncType): Promise<cryptoFramework.SymKey> {
  let symKey: cryptoFramework.SymKey;
  if (type == asyncType.TYPE_IS_SYNC) {
    symKey = convertSymKeySync(algName, data);
  } else if (type == asyncType.TYPE_IS_PROMISE) {
    symKey = await convertSymKeyPromise(algName, data);
  } else {
    symKey = await convertSymKeyCallback(algName, data);
  }

  return symKey;
}

function generateRandom(len: int): cryptoFramework.DataBlob {
  let rand = cryptoFramework.createRandom();
  let generateRandSync = rand.generateRandomSync(len);
  return generateRandSync;
}

function genGcmParamsSpec(): cryptoFramework.GcmParamsSpec {
  let ivBlob = generateRandom(12);
  let arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
  let dataAad = new Uint8Array(arr);
  let aadBlob: cryptoFramework.DataBlob = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: cryptoFramework.DataBlob = {
    data: dataTag
  };
  let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec"
  };
  return gcmParamsSpec;
}

function parityCheck(data: Uint8Array): boolean {
  let count = 0;
  for (let num of data) {
    let tmp = num;
    while (num) {
      let n = num % 2;
      if (n == 1) {
        count += 1;
      }
      num = num >> 1;
    }
    if (count % 2 == 0) {
      let zero = "";
      let i: number = 8 - tmp.toString(2).length;
      while (i) {
        zero += "0";
        i--;
      }
      console.info("################# parity check failed, num=" + "0b" + zero + tmp.toString(2));
      return false;
    } else {
      count = 0;
    }
  }

  return true;
}

function doEncryptSync(cipher: cryptoFramework.Cipher, symKey:cryptoFramework.SymKey,
  spec: cryptoFramework.IvParamsSpec|null, data: cryptoFramework.DataBlob,
  isEncrypt: cryptoFramework.CryptoMode): cryptoFramework.DataBlob {
  cipher.initSync(isEncrypt, symKey, spec);
  let cipherText: cryptoFramework.DataBlob|null = cipher.doFinalSync(data);
  if (cipherText === null) {
    throw new Error("[TEST] DoFinal Failed.");
  }

  return cipherText;
}

async function doEncryptPromise(cipher: cryptoFramework.Cipher, symKey:cryptoFramework.SymKey,
  spec: cryptoFramework.IvParamsSpec|null, data: cryptoFramework.DataBlob,
  isEncrypt: cryptoFramework.CryptoMode): Promise<cryptoFramework.DataBlob> {
  await cipher.init(isEncrypt, symKey, spec);
  let cipherText: cryptoFramework.DataBlob|null = await cipher.doFinal(data);
  if (cipherText === null) {
    throw new Error("[TEST] DoFinal Failed.");
  }

  return cipherText;
}

async function initCallback(cipher: cryptoFramework.Cipher, symKey:cryptoFramework.SymKey,
  spec: cryptoFramework.IvParamsSpec|null, isEncrypt: cryptoFramework.CryptoMode): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipher.init(isEncrypt, symKey, spec, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        reject(err as Error)
      } else {
        resolve("success");
      }
    })
  })
}

async function finalCallback(cipher: cryptoFramework.Cipher,
  data: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    cipher.doFinal(data, (err: BusinessError<void>|null, cipherText: cryptoFramework.DataBlob|null|undefined) => {
      if (err || cipherText === undefined || cipherText === null) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        resolve(cipherText as cryptoFramework.DataBlob);
      }
    })
  })
}

async function doEncryptCallback(cipher: cryptoFramework.Cipher, symKey:cryptoFramework.SymKey,
  spec: cryptoFramework.IvParamsSpec|null, data: cryptoFramework.DataBlob,
  isEncrypt: cryptoFramework.CryptoMode): Promise<cryptoFramework.DataBlob> {
  await initCallback(cipher, symKey, spec, isEncrypt);
  let cipherText: cryptoFramework.DataBlob = await finalCallback(cipher, data);

  return cipherText;
}

async function doCipher(algName: string, mode: string, padding: string, spec: cryptoFramework.IvParamsSpec|null,
  symKey:cryptoFramework.SymKey, data: cryptoFramework.DataBlob, isEncrypt: cryptoFramework.CryptoMode,
  type: asyncType): Promise<cryptoFramework.DataBlob> {
  try {
    let cipherText: cryptoFramework.DataBlob;
    let alg: string = algName + "|" + mode + "|" + padding;
    let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(alg);
    if (type == asyncType.TYPE_IS_SYNC) {
      cipherText = doEncryptSync(cipher, symKey, spec, data, isEncrypt);
    } else if (type == asyncType.TYPE_IS_PROMISE) {
      cipherText = await doEncryptPromise(cipher, symKey, spec, data, isEncrypt);
    } else {
      cipherText = await doEncryptCallback(cipher, symKey, spec, data, isEncrypt);
    }

    return cipherText;
  } catch (error: BusinessError) {
    console.error('doCipher error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function doUpdatePromise(cipher: cryptoFramework.Cipher, symKey:cryptoFramework.SymKey,
  spec: cryptoFramework.IvParamsSpec|null, data: cryptoFramework.DataBlob, blockSize: int,
  isEncrypt: cryptoFramework.CryptoMode): Promise<cryptoFramework.DataBlob> {
  let dataLen: number = data.data.byteLength;
  let cipherText = new Uint8Array();
  await cipher.init(isEncrypt, symKey, spec);
  for(let dataSize = 0; dataSize < dataLen / blockSize; dataSize++) {
    let tmp = data.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
    let doFinalText: cryptoFramework.DataBlob = { data:tmp };
    let encryptCipher: cryptoFramework.DataBlob|null = await cipher.update(doFinalText);
    if (encryptCipher) {
      let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
      mergeText.set(cipherText);
      mergeText.set(encryptCipher.data, cipherText.length);
      cipherText = mergeText;
    }
  }
  let finalText: cryptoFramework.DataBlob|null = await cipher.doFinal(null);
  if (finalText) {
    let mergeText = new Uint8Array(cipherText.length + finalText.data.length);
    mergeText.set(cipherText);
    mergeText.set(finalText.data, cipherText.length);
    cipherText = mergeText;
  }

  return {data: cipherText} as cryptoFramework.DataBlob;
}

function doUpdateSync(cipher: cryptoFramework.Cipher, symKey:cryptoFramework.SymKey,
  spec: cryptoFramework.IvParamsSpec|null, data: cryptoFramework.DataBlob, blockSize: int,
  isEncrypt: cryptoFramework.CryptoMode): cryptoFramework.DataBlob {
  let dataLen: number = data.data.byteLength;
  let cipherText = new Uint8Array();
  cipher.initSync(isEncrypt, symKey, spec);
  for(let dataSize = 0; dataSize < dataLen / blockSize; dataSize++) {
    let tmp = data.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
    let doFinalText: cryptoFramework.DataBlob = { data:tmp };
    let encryptCipher: cryptoFramework.DataBlob|null = cipher.updateSync(doFinalText);
    if (encryptCipher) {
      let mergeText = new Uint8Array(cipherText.length + encryptCipher.data.length);
      mergeText.set(cipherText);
      mergeText.set(encryptCipher.data, cipherText.length);
      cipherText = mergeText;
    }
  }
  let finalText: cryptoFramework.DataBlob|null = cipher.doFinalSync(null);
  if (finalText) {
    let mergeText = new Uint8Array(cipherText.length + finalText.data.length);
    mergeText.set(cipherText);
    mergeText.set(finalText.data, cipherText.length);
    cipherText = mergeText;
  }

  return {data: cipherText} as cryptoFramework.DataBlob;
}


export {
  DES64_KEY_SIZE,
  DES64_WEAK_KEYS,
  DES64_PADDING,
  DES64_MODE,
  createSymKeySync,
  convertSymKeySync,
  genGcmParamsSpec,
  generateSymKey,
  convertSymKey,
  generateRandom,
  parityCheck,
  doCipher,
  doUpdatePromise,
  doUpdateSync,
}