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
import * as rsa from '../pkcs1Topkcs8/pkcs1topkcs8';

function genGcmOrCcmParamsSpec(iv: number[], aad: number[], tag: number[], algName: string): cryptoFramework.GcmParamsSpec {
  let dataIv = new Uint8Array(iv);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  let dataAad = new Uint8Array(aad);
  let aadBlob: cryptoFramework.DataBlob = { data: dataAad };
  let dataTag = new Uint8Array(tag);
  let tagBlob: cryptoFramework.DataBlob = { data: dataTag };
  let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: algName
  };
  return gcmParamsSpec;
}

function genCcmParamsSpec(iv: number[], aad: number[], tag: number[], algName: string): cryptoFramework.CcmParamsSpec {
  let dataIv = new Uint8Array(iv);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  let dataAad = new Uint8Array(aad);
  let aadBlob: cryptoFramework.DataBlob = { data: dataAad };
  let dataTag = new Uint8Array(tag);
  let tagBlob: cryptoFramework.DataBlob = { data: dataTag };
  let gcmParamsSpec: cryptoFramework.CcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: algName
  };
  return gcmParamsSpec;
}

function genIvParamsSpec(iv: number[]): cryptoFramework.IvParamsSpec {
  let dataIv = new Uint8Array(iv);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  let ivParamsSpec: cryptoFramework.IvParamsSpec = {
    algName: "IvParamsSpec",
    iv: ivBlob
  };
  return ivParamsSpec;
}

interface dataSpec {
  data: cryptoFramework.DataBlob;
  paramSpec: cryptoFramework.IvParamsSpec
}

interface dataGcmOrCCMSpec {
  data: cryptoFramework.DataBlob|null;
  paramSpec: cryptoFramework.GcmParamsSpec|cryptoFramework.CcmParamsSpec
}

function tagEncryptDecryptMessageSync(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey, data: cryptoFramework.DataBlob,
                                   paramsSpec: cryptoFramework.GcmParamsSpec|cryptoFramework.CcmParamsSpec): dataGcmOrCCMSpec {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
    }
    let updateOutput = cipher.updateSync(data);
    if (isEnc) {
      let authTag = cipher.doFinalSync(null);
      if (authTag === null) {
        throw new Error("[TEST] Tag Error");
      } else {
        paramsSpec.authTag = authTag;
      }
    }
    return {data:updateOutput, paramSpec:paramsSpec} as dataGcmOrCCMSpec;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function encryptDecryptMessageSync(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey, data: cryptoFramework.DataBlob,
                                    paramsSpec: cryptoFramework.IvParamsSpec): dataSpec {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
    }
    let updateOutput = cipher.doFinalSync(data);
    if (updateOutput === null) {
      throw new Error("[TEST] DoFinal Failed.");
    } else {
      return {data:updateOutput, paramSpec:paramsSpec} as dataSpec;
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function createSymKeySync(algName: string): cryptoFramework.SymKey {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.generateSymKeySync();

    return syncSymKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertSymKeyPromise(algName: string, symKeyBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = await symKeyGenerator.convertKey(symKeyBlob);

    return syncSymKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createSymKeyPromise(algName: string): Promise<cryptoFramework.SymKey> {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = await symKeyGenerator.generateSymKey();

    return syncSymKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createAsymKeySync(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName)
    let keyPair: cryptoFramework.KeyPair;
    if (algName === "RSA1024") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str1024, rsa.priKeyPkcs1Str1024);
    } else if (algName === "RSA2048") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str2048, rsa.priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str3072, rsa.priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str4096, rsa.priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      keyPair = await generator.convertPemKey(rsa.pubKeyPkcs1Str8192, rsa.priKeyPkcs1Str8192);
    } else {
      keyPair = await generator.generateKeyPair();
    }

    return keyPair;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function encryptDecryptAsymMessageSync(algName: string, keyPair: cryptoFramework.KeyPair,
  data: cryptoFramework.DataBlob, isEnc: Boolean): cryptoFramework.DataBlob {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null);
    }
    let encryptCipher = cipher.doFinalSync(data);
    if (encryptCipher === null) {
      throw new Error("[TEST] DoFinal Failed.");
    } else {
      return encryptCipher;
    }
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function encryptDecryptAsymOAaepMessageSync(algName: string, keyPair: cryptoFramework.KeyPair,
  data: cryptoFramework.DataBlob, isEnc: Boolean): cryptoFramework.DataBlob {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, keyPair.pubKey, null)
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, keyPair.priKey, null)
    }
    let pSource = new Uint8Array([1, 2, 3, 4]);
    cipher.setCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR, pSource);
    let pS: string | Uint8Array = cipher.getCipherSpec(cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR);
    console.log("##################### pS:" + pS);
    let encryptCipher = cipher.doFinalSync(data);

    if (encryptCipher === null) {
      throw new Error("[TEST] DoFinal Failed.");
    } else {
      return encryptCipher;
    }
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function gcmEncOrDecMessageSync(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey, blockSize: int, dataLen: number,
                                data: cryptoFramework.DataBlob, paramSpec: cryptoFramework.GcmParamsSpec): dataGcmOrCCMSpec {
  try {
    let cipherText1 = new Uint8Array();
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
    }
    for(let dataSize = 0; dataSize < dataLen / blockSize; dataSize++) {
      let tmp = data.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
      let doFinalText: cryptoFramework.DataBlob = { data:tmp };
      let encryptCipher = cipher.updateSync(doFinalText);
      if (encryptCipher === null) {
        throw new Error("[TEST] DoFinal Failed.");
      }
      let mergeText = new Uint8Array(cipherText1.length + encryptCipher.data.length);
      mergeText.set(cipherText1);
      mergeText.set(encryptCipher.data, cipherText1.length);
      cipherText1 = mergeText;
    }
    let authTag1 = cipher.doFinalSync(null);
    if (authTag1 === null) {
      throw new Error("[TEST] DoFinal Failed.");
    } else {
      paramSpec.authTag = authTag1;
    }

    return {data:{data: cipherText1}, paramSpec} as dataGcmOrCCMSpec;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function gcmEncOrDecMessagePromise(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey, blockSize: int, dataLen: number,
                                data: cryptoFramework.DataBlob, paramSpec: cryptoFramework.GcmParamsSpec): Promise<dataGcmOrCCMSpec> {
  try {
    let cipherText1 = new Uint8Array();
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramSpec);
    } else {
      await cipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramSpec);
    }
    for(let dataSize = 0; dataSize < dataLen / blockSize; dataSize++) {
      let tmp = data.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
      let doFinalText: cryptoFramework.DataBlob = { data:tmp };
      let encryptCipher = await cipher.update(doFinalText);
      if (encryptCipher === null) {
        throw new Error("[TEST] Update Failed.")
      }
      let mergeText = new Uint8Array(cipherText1.length + encryptCipher.data.length);
      mergeText.set(cipherText1);
      mergeText.set(encryptCipher.data, cipherText1.length);
      cipherText1 = mergeText;
    }
    let authTag1 = await cipher.doFinal(null);
    if (authTag1 === null) {
      throw new Error("[TEST] DoFinal Failed.");
    }
    paramSpec.authTag = authTag1;

    return {data:{data: cipherText1}, paramSpec} as dataGcmOrCCMSpec;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function gcmEncOrDecNullSync(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey,
                         paramsSpec: cryptoFramework.GcmParamsSpec): cryptoFramework.GcmParamsSpec {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      cipher.initSync(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
    } else {
      cipher.initSync(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
    }
    if (isEnc) {
      let authTag = cipher.doFinalSync(null);
      if (authTag === null) {
        throw new Error("[TEST] DoFinal Failed.");
      }
      paramsSpec.authTag = authTag;
    }
    return paramsSpec;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function gcmEncOrDecNullPromise(algName: string, isEnc: boolean, symKey: cryptoFramework.SymKey,
                             paramsSpec: cryptoFramework.GcmParamsSpec): Promise<cryptoFramework.GcmParamsSpec> {
  try {
    let cipher = cryptoFramework.createCipher(algName);
    if (isEnc) {
      await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, symKey, paramsSpec);
    } else {
      await cipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, symKey, paramsSpec);
    }
    if (isEnc) {
      let authTag = await cipher.doFinal(null);
      if (authTag === null) {
        throw new Error("[TEST] DoFinal Failed.");
      }
      paramsSpec.authTag = authTag;
    }
    return paramsSpec;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

let STREAM_CIPHER_SPEC = [
  [["AES"], ["ECB", "CBC"], ["0", "128", "192", "256"], ["NoPadding"]],
  [["3DES"], ["ECB", "CBC"], ["0", "192"], ["NoPadding"]],
  [["SM4"], ["ECB", "CBC"], ["0", "128"], ["NoPadding"]],
]

let MODE_OFB_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_GCM_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_CCM_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_CFB_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_CFB128_CIPHER_SEPC = [
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let MODE_ECB_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7"]],
]

let MODE_CBC_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7"]],
  [["3DES"], ["0", "192"], ["PKCS5", "PKCS7"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7"]],
]

let MODE_CTR_CIPHER_SEPC = [
  [["AES"], ["0", "128", "192", "256"], ["PKCS5", "PKCS7", "NoPadding"]],
  [["SM4"], ["0", "128"], ["PKCS5", "PKCS7", "NoPadding"]],
]

let ASY_CIPHER_SPEC = [
  [["RSA512"], ["NoPadding", "PKCS1"], ["64", "53"]],
  [["RSA768"], ["NoPadding", "PKCS1"], ["96", "85"]],
  [["RSA1024"], ["NoPadding", "PKCS1"], ["128", "117"]],
  [["RSA2048"], ["NoPadding", "PKCS1"], ["256", "245"]],
  [["RSA3072"], ["NoPadding", "PKCS1"], ["384", "373"]],
  [["RSA4096"], ["NoPadding", "PKCS1"], ["512", "501"]],
  [["RSA8192"], ["NoPadding", "PKCS1"], ["1024", "1013"]],
  [["RSA"], ["NoPadding", "PKCS1"], ["256", "245"]],
];

let ASY_CIPHER_OAEP_SPEC = [
  [["RSA512"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256"], ["30"]],
  [["RSA512"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256"], ["22"]],
  [["RSA512"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256"], ["6"]],

  [["RSA768"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["62"]],
  [["RSA768"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["54"]],
  [["RSA768"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["38"]],
  [["RSA768"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384"], ["30"]],

  [["RSA1024"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["94"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["86"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["70"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["62"]],
  [["RSA1024"], ["PKCS1_OAEP"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["30"]],

  [["RSA2048"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["222"]],
  [["RSA2048"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["214"]],
  [["RSA2048"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["198"]],
  [["RSA2048"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["190"]],
  [["RSA2048"], ["PKCS1_OAEP"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["158"]],
  [["RSA2048"], ["PKCS1_OAEP"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["126"]],
]

let ASY_RSA3072_CIPHER_OAEP_SPEC = [
  [["RSA3072"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["350"]],
  [["RSA3072"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["342"]],
  [["RSA3072"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["326"]],
  [["RSA3072"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["318"]],
  [["RSA3072"], ["PKCS1_OAEP"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["286"]],
  [["RSA3072"], ["PKCS1_OAEP"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["254"]],
]

let ASY_RSA4096_CIPHER_OAEP_SPEC = [
  [["RSA4096"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["478"]],
  [["RSA4096"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["470"]],
  [["RSA4096"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["454"]],
  [["RSA4096"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["446"]],
  [["RSA4096"], ["PKCS1_OAEP"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["414"]],
  [["RSA4096"], ["PKCS1_OAEP"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["382"]],
]

let ASY_RSA8192_MD5_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PKCS1_OAEP"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["990"]],
]

let ASY_RSA8192_SHA1_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PKCS1_OAEP"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["982"]],
  ]

let ASY_RSA8192_SHA224_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PKCS1_OAEP"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["966"]],
]

let ASY_RSA8192_SHA256_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["958"]],
  ]

let ASY_RSA8192_SHA384_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PKCS1_OAEP"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["926"]],
  ]

let ASY_RSA8192_SHA512_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PKCS1_OAEP"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["894"]],
  [["RSA"], ["PKCS1_OAEP"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"], ["190"]],
];

let ASY_SM2_CIPHER_OAEP_SPEC = [
  [["SM2_256"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512", "SM3"]],
  [["SM2"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512", "SM3"]]
]

interface sm4GcmVector {
  index: number;
  key: number[];
  iv: number[];
  aad: number[];
  plainText: number[];
  authTag: number[];
  cipherText: number[]
}

let SM4_GCM_VECTOR: sm4GcmVector[] = [
  {
    index: 0,
    key: [
      0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10
    ],
    iv: [
      0x00, 0x00, 0x12, 0x34, 0x56, 0x78, 0x00, 0x00, 0x00, 0x00, 0xAB, 0xCD
    ],
    aad: [
      0xFE, 0xED, 0xFA, 0xCE, 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED, 0xFA, 0xCE, 0xDE, 0xAD, 0xBE, 0xEF,
      0xAB, 0xAD, 0xDA, 0xD2
    ],
    plainText: [
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xBB, 0xBB, 0xBB, 0xBB, 0xBB, 0xBB, 0xBB, 0xBB,
      0xCC, 0xCC, 0xCC, 0xCC, 0xCC, 0xCC, 0xCC, 0xCC, 0xDD, 0xDD, 0xDD, 0xDD, 0xDD, 0xDD, 0xDD, 0xDD,
      0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
      0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA
    ],
    authTag: [
      0x83, 0xDE, 0x35, 0x41, 0xE4, 0xC2, 0xB5, 0x81, 0x77, 0xE0, 0x65, 0xA9, 0xBF, 0x7B, 0x62, 0xEC
    ],
    cipherText: [
      0x17, 0xF3, 0x99, 0xF0, 0x8C, 0x67, 0xD5, 0xEE, 0x19, 0xD0, 0xDC, 0x99, 0x69, 0xC4, 0xBB, 0x7D,
      0x5F, 0xD4, 0x6F, 0xD3, 0x75, 0x64, 0x89, 0x06, 0x91, 0x57, 0xB2, 0x82, 0xBB, 0x20, 0x07, 0x35,
      0xD8, 0x27, 0x10, 0xCA, 0x5C, 0x22, 0xF0, 0xCC, 0xFA, 0x7C, 0xBF, 0x93, 0xD4, 0x96, 0xAC, 0x15,
      0xA5, 0x68, 0x34, 0xCB, 0xCF, 0x98, 0xC3, 0x97, 0xB4, 0x02, 0x4A, 0x26, 0x91, 0x23, 0x3B, 0x8D,
    ]
  },
];

export {
  genGcmOrCcmParamsSpec,
  genCcmParamsSpec,
  genIvParamsSpec,
  createSymKeySync,
  createSymKeyPromise,
  convertSymKeyPromise,
  gcmEncOrDecNullPromise,
  gcmEncOrDecNullSync,
  createAsymKeySync,
  encryptDecryptMessageSync,
  tagEncryptDecryptMessageSync,
  dataSpec,
  dataGcmOrCCMSpec,
  encryptDecryptAsymMessageSync,
  encryptDecryptAsymOAaepMessageSync,
  gcmEncOrDecMessageSync,
  gcmEncOrDecMessagePromise,
  ASY_CIPHER_SPEC,
  ASY_CIPHER_OAEP_SPEC,
  ASY_RSA3072_CIPHER_OAEP_SPEC,
  ASY_RSA4096_CIPHER_OAEP_SPEC,
  ASY_RSA8192_MD5_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA1_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA224_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA256_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA384_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA512_CIPHER_OAEP_SPEC,
  ASY_SM2_CIPHER_OAEP_SPEC,
  STREAM_CIPHER_SPEC,
  MODE_ECB_CIPHER_SEPC,
  MODE_CBC_CIPHER_SEPC,
  MODE_CTR_CIPHER_SEPC,
  MODE_OFB_CIPHER_SEPC,
  MODE_CFB_CIPHER_SEPC,
  MODE_CFB128_CIPHER_SEPC,
  MODE_GCM_CIPHER_SEPC,
  MODE_CCM_CIPHER_SEPC,
  SM4_GCM_VECTOR,
}