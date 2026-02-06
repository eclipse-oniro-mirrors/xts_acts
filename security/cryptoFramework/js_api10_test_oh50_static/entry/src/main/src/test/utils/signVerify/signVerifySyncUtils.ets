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
import * as dsa from '../pkcs8/pkcs8Utils';


let RSA_PKCS1_CIPHER_SPEC = [
  [["RSA512"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256"]],
  [["RSA768"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["RSA1024"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["RSA2048"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["RSA3072"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["RSA4096"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["RSA8192"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["RSA"], ["PKCS1"], ["MD5", "SHA1", "SHA224", "SHA256"]],
];

let RSA_PSS_CIPHER_SPEC = [
  [["RSA512"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256"]],
  [["RSA512"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256"]],
  [["RSA512"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256"]],

  [["RSA768"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA768"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA768"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA768"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384"]],

  [["RSA1024"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA1024"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA1024"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA1024"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA1024"], ["PSS"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],

  [["RSA2048"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA2048"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA2048"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA2048"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA2048"], ["PSS"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA2048"], ["PSS"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA3072_CIPHER_OAEP_SPEC = [
  [["RSA3072"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA3072"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA3072"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA3072"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA3072"], ["PSS"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA3072"], ["PSS"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA4096_CIPHER_OAEP_SPEC = [
  [["RSA4096"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA4096"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA4096"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA4096"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA4096"], ["PSS"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA4096"], ["PSS"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA8192_MD5_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PSS"], ["MD5"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA8192_SHA1_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PSS"], ["SHA1"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA8192_SHA224_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PSS"], ["SHA224"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA8192_SHA256_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA8192_SHA384_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PSS"], ["SHA384"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
]

let ASY_RSA8192_SHA512_CIPHER_OAEP_SPEC = [
  [["RSA8192"], ["PSS"], ["SHA512"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
  [["RSA"], ["PSS"], ["SHA256"], ["MGF1_MD5", "MGF1_SHA1", "MGF1_SHA224", "MGF1_SHA256", "MGF1_SHA384", "MGF1_SHA512"]],
];

let ASY_SM2_CIPHER_SPEC = [
  [["SM2_256"], ["SM3"]],
  [["SM2"], ["SM3"]]
]

let ECDSA_SPEC = [
  [["ECC224"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC256"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC384"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC521"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP160r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP160t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP192r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP192t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP224r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP224t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP256r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP256t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP320r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP320t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP384r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP384t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP512r1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC_BrainPoolP512t1"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["ECC"], ["SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
]

let DSA_SPEC = [
  [["DSA1024"], ["NoHash", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["DSA2048"], ["NoHash", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["DSA3072"], ["NoHash", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
  [["DSA"], ["NoHash", "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"]],
]

function doSignSync(algName: string, priKey: cryptoFramework.PriKey, msg: cryptoFramework.DataBlob): cryptoFramework.DataBlob {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    sign.initSync(priKey);
    let dataSign = sign.signSync(msg);

    return dataSign;
  } catch (error) {
    console.error(`doSignSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doSignPromise(algName: string, priKey: cryptoFramework.PriKey, msg: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    await sign.init(priKey);
    let dataSign = await sign.sign(msg);

    return dataSign;
  } catch (error) {
    console.error(`doSignSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doSignWithUpdateSync(algName: string, priKey: cryptoFramework.PriKey, msg: cryptoFramework.DataBlob,
                              blockSize: int): cryptoFramework.DataBlob {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    sign.initSync(priKey);
    let msgLen: int = msg.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      sign.updateSync(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        sign.updateSync(updateText);
      }
    }
    let dataSign = sign.signSync(null);

    return dataSign;
  } catch (error) {
    console.error(`doSignWithUpdateSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doSignWithUpdatePromise(algName: string, priKey: cryptoFramework.PriKey, msg: cryptoFramework.DataBlob,
                              blockSize: int): Promise<cryptoFramework.DataBlob> {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    await sign.init(priKey);
    let msgLen: int = msg.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await sign.update(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        await sign.update(updateText);
      }
    }
    let dataSign = await sign.sign(null);

    return dataSign;
  } catch (error) {
    console.error(`doSignWithUpdateSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doVerifySync(algName: string, pubKey: cryptoFramework.PubKey, msg: cryptoFramework.DataBlob,
                      dataSign: cryptoFramework.DataBlob): boolean {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    verify.initSync(pubKey);
    let ret = verify.verifySync(msg, dataSign);

    return ret;
  } catch (error) {
    console.error(`doVerifySync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doVerifyPromise(algName: string, pubKey: cryptoFramework.PubKey, msg: cryptoFramework.DataBlob,
                      dataSign: cryptoFramework.DataBlob): Promise<boolean> {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    await verify.init(pubKey);
    let ret = await verify.verify(msg, dataSign);

    return ret;
  } catch (error) {
    console.error(`doVerifySync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doVerifyWithUpdateSync(algName: string, pubKey: cryptoFramework.PubKey, msg: cryptoFramework.DataBlob,
                                dataSign: cryptoFramework.DataBlob, blockSize: int): boolean {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    verify.initSync(pubKey);
    let msgLen: int = msg.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      verify.updateSync(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        verify.updateSync(updateText);
      }
    }
    let ret = verify.verifySync(null, dataSign);

    return ret;
  } catch (error) {
    console.error(`doVerifyWithUpdateSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doVerifyWithUpdatePromise(algName: string, pubKey: cryptoFramework.PubKey, msg: cryptoFramework.DataBlob,
                                dataSign: cryptoFramework.DataBlob, blockSize: int): Promise<boolean> {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    await verify.init(pubKey);
    let msgLen: int = msg.data.byteLength;
    let iterate: int = msgLen / blockSize;
    let rem: int = msgLen % blockSize;
    if (rem != 0) {
      iterate = (msgLen - rem) / blockSize;
    }
    for(let index = 0; index < iterate; index++) {
      let tmp = msg.data.subarray(blockSize * index, blockSize * (index + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await verify.update(updateText);
      if (rem != 0 && index + 1 == iterate) {
        let tmp = msg.data.subarray(blockSize * (index + 1), msgLen);
        let updateText: cryptoFramework.DataBlob = { data:tmp };
        await verify.update(updateText);
      }
    }
    let ret = await verify.verify(null, dataSign);

    return ret;
  } catch (error) {
    console.error(`doVerifyWithUpdateSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function generateSignKey(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let key = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair;
    let pubKey: cryptoFramework.DataBlob;
    let priKey: cryptoFramework.DataBlob;
    switch (algName) {
      case "RSA1024":
        keyPair = await key.convertPemKey(rsa.pubKeyPkcs1Str1024, rsa.priKeyPkcs1Str1024);
        break;
      case "RSA2048":
        keyPair = await key.convertPemKey(rsa.pubKeyPkcs1Str2048, rsa.priKeyPkcs1Str2048);
        break;
      case "RSA3072":
        keyPair = await key.convertPemKey(rsa.pubKeyPkcs1Str3072, rsa.priKeyPkcs1Str3072);
        break;
      case "RSA4096":
        keyPair = await key.convertPemKey(rsa.pubKeyPkcs1Str4096, rsa.priKeyPkcs1Str4096);
        break;
      case "RSA8192":
        keyPair = await key.convertPemKey(rsa.pubKeyPkcs1Str8192, rsa.priKeyPkcs1Str8192);
        break;
      case "DSA1024":
        pubKey = {data: new Uint8Array(dsa.keys.key_1024.pub)};
        priKey = {data: new Uint8Array(dsa.keys.key_1024.pri)};
        keyPair = await key.convertKey(pubKey, priKey)
        break;
      case "DSA2048":
        pubKey = {data: new Uint8Array(dsa.keys.key_2048.pub)};
        priKey = {data: new Uint8Array(dsa.keys.key_2048.pri)};
        keyPair = await key.convertKey(pubKey, priKey)
        break;
      case "DSA3072":
        pubKey = {data: new Uint8Array(dsa.keys.key_3072.pub)};
        priKey = {data: new Uint8Array(dsa.keys.key_3072.pri)};
        keyPair = await key.convertKey(pubKey, priKey)
        break;
      default:
        keyPair = await key.generateKeyPair();
        break;
    }

    return keyPair;
  } catch (error) {
    console.error(`doVerifyWithUpdateSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}


export {
  ASY_RSA8192_SHA512_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA384_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA256_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA224_CIPHER_OAEP_SPEC,
  ASY_RSA8192_SHA1_CIPHER_OAEP_SPEC,
  ASY_RSA8192_MD5_CIPHER_OAEP_SPEC,
  ASY_RSA4096_CIPHER_OAEP_SPEC,
  ASY_RSA3072_CIPHER_OAEP_SPEC,
  RSA_PKCS1_CIPHER_SPEC,
  RSA_PSS_CIPHER_SPEC,
  ECDSA_SPEC,
  DSA_SPEC,
  ASY_SM2_CIPHER_SPEC,
  generateSignKey,
  doSignSync,
  doSignPromise,
  doSignWithUpdateSync,
  doSignWithUpdatePromise,
  doVerifySync,
  doVerifyPromise,
  doVerifyWithUpdateSync,
  doVerifyWithUpdatePromise
}