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
import { buffer, HashMap } from '@kit.ArkTS';

enum asyncType {
  TYPE_IS_SYNC = 0,
  TYPE_IS_PROMISE = 1,
  TYPE_IS_CALLBACK = 2,
}

function stringToUint8Array(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

function decToHexString(data: cryptoFramework.DataBlob): string {
  let arr: string = "";
  for (let i = 0; i < data.data.length; ++i) {
    let tmp: string = "";
    let num: number = data.data[i];
    tmp = num.toString(16);
    if(tmp.length == 1) {
      tmp = "0" + tmp;
    }
    arr += tmp;
  }
  return arr;
}

function convertToUint8Array(str: string): number[] {
  let tmp: number[] = [];
  let j: number = 0;
  for (let i = 0; i < str.length; i++) {
    tmp[j] = Number("0x" + str.substring(i, i+2));
    j++;
    i++;
  }

  return tmp;
}

function compareDataBlob(a: cryptoFramework.DataBlob, b: cryptoFramework.DataBlob): boolean {
  let buf1 = buffer.from(a.data);
  let buf2 = buffer.from(b.data);
  if (buf1.compare(buf2, 0, a.data.byteLength, 0, b.data.byteLength) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareNumber(a: number[], b: number[]): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, b.length, 0, a.length) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareString(a: string, b: string): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, b.length, 0, a.length) == 0) {
    return true;
  } else {
    return false;
  }
}

async function createData(dataLen: number): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);
    rawData.data[0] = 0;

    return rawData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createFullData(dataLen: number): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function doScryptCallback(kdf: cryptoFramework.Kdf,
  spec: cryptoFramework.ScryptSpec): Promise<cryptoFramework.DataBlob> {
  return new Promise((resolve, reject) => {
    kdf.generateSecret(spec, (err, rawData) => {
      if (err) {
        reject(err);
      } else {
        resolve(rawData);
      }
    });
  });
}

interface OH_MF_INFO {
  algName: string;
  mdSize: number;
}

let OH_MD_SPEC: OH_MF_INFO[] = [
  {algName: "SHA1", mdSize: 20},
  {algName: "SHA224", mdSize: 28},
  {algName: "SHA256", mdSize: 32},
  {algName: "SHA384", mdSize: 48},
  {algName: "SHA512", mdSize: 64},
  {algName: "SHA3-256", mdSize: 32},
  {algName: "SHA3-384", mdSize: 48},
  {algName: "SHA3-512", mdSize: 64},
  {algName: "MD5", mdSize: 16},
]

class MdMap {
  map: HashMap<string, number> = new HashMap();
  constructor(isInit: boolean = true) {
    if (isInit) {
      this.map.set("SHA1", 20);
      this.map.set("SHA224", 28);
      this.map.set("SHA256", 32);
      this.map.set("SHA384", 48);
      this.map.set("SHA512", 64);
      this.map.set("SHA3-256", 32);
      this.map.set("SHA3-384", 48);
      this.map.set("SHA3-512", 64);
      this.map.set("MD5", 16);
      this.map.set("SM3", 32);
    }
  }
  getMdSize(algName: string): number {
    return this.map.get(algName)
  }
}

class KeyLenMap {
  // 对称算法
  HMAC_KEY_LEN: number = 0;
  RC2_KEY_LEN: number = 0; // 1~128
  RC4_KEY_LEN: number = 0; // 1~128
  BF_KEY_LEN: number = 0; // 4~56
  CAST_KEY_LEN: number = 0; // 5~16
  AES_128_KEY_LEN: number = 128;
  AES_192_KEY_LEN: number = 192;
  AES_256_KEY_LEN: number = 256;
  DES_64_KEY_LEN: number = 64;
  DES3_64_KEY_LEN: number = 192;
  SM4_128_KEY_LEN: number = 128;
  CHACHA20_KEY_LEN: number = 256;
  // 非对称算法
  RSA_512_KEY_LEN: number = 512;
  RSA_768_KEY_LEN: number = 768;
  RSA_1024_KEY_LEN: number = 1024;
  RSA_2048_KEY_LEN: number = 2048;
  RSA_3072_KEY_LEN: number = 3072;
  RSA_4096_KEY_LEN: number = 4096;
  RSA_8192_KEY_LEN: number = 8192;
  RSA_OTHER_KEY_LEN: number = 0;
  ECC_192_KEY_LEN: number = 192;
  ECC_224_KEY_LEN: number = 224;
  ECC_256_KEY_LEN: number = 256;
  ECC_384_KEY_LEN: number = 384;
  ECC_521_KEY_LEN: number = 521;
  ECC_BPP_160R1_KEY_LEN: number = 160;
  ECC_BPP_160T1_KEY_LEN: number = 160;
  ECC_BPP_192R1_KEY_LEN: number = 192;
  ECC_BPP_192T1_KEY_LEN: number = 192;
  ECC_BPP_224R1_KEY_LEN: number = 224;
  ECC_BPP_224T1_KEY_LEN: number = 224;
  ECC_BPP_256R1_KEY_LEN: number = 256;
  ECC_BPP_256T1_KEY_LEN: number = 256;
  ECC_BPP_320R1_KEY_LEN: number = 320;
  ECC_BPP_320T1_KEY_LEN: number = 320;
  ECC_BPP_384R1_KEY_LEN: number = 384;
  ECC_BPP_384T1_KEY_LEN: number = 384;
  ECC_BPP_512R1_KEY_LEN: number = 512;
  ECC_BPP_512T1_KEY_LEN: number = 512;
  ECC_SECP_256K1_KEY_LEN: number = 256;
  DSA_1024_KEY_LEN: number = 1024;
  DSA_2048_KEY_LEN: number = 2048;
  DSA_3072_KEY_LEN: number = 3072;
  SM2_256_KEY_LEN: number = 256;
  ED25519_KEY_LEN: number = 256;
  X25519_KEY_LEN: number = 256;
  DH_MODP1536_KEY_LEN: number = 1536;
  DH_MODP2048_KEY_LEN: number = 2048;
  DH_MODP3072_KEY_LEN: number = 3072;
  DH_MODP4096_KEY_LEN: number = 4096;
  DH_MODP6144_KEY_LEN: number = 6144;
  DH_MODP8192_KEY_LEN: number = 8192;
  DH_FFDHE_2048_KEY_LEN: number = 2048;
  DH_FFDHE_3072_KEY_LEN: number = 3072;
  DH_FFDHE_4096_KEY_LEN: number = 4096;
  DH_FFDHE_6144_KEY_LEN: number = 6144;
  DH_FFDHE_8192_KEY_LEN: number = 8192;

  map: HashMap<string, number> = new HashMap<string, number>();
  constructor(isInit: boolean = true) {
    if (isInit) {
      this.map.set("HMAC", this.HMAC_KEY_LEN);
      this.map.set("HMAC", this.HMAC_KEY_LEN);
      this.map.set("RC2", this.RC2_KEY_LEN);
      this.map.set("RC4", this.RC4_KEY_LEN);
      this.map.set("Blowfish", this.BF_KEY_LEN);
      this.map.set("CAST", this.CAST_KEY_LEN);
      this.map.set("AES128", this.AES_128_KEY_LEN);
      this.map.set("AES192", this.AES_192_KEY_LEN);
      this.map.set("AES256", this.AES_256_KEY_LEN);
      this.map.set("DES64", this.DES_64_KEY_LEN);
      this.map.set("3DES192", this.DES3_64_KEY_LEN);
      this.map.set("SM4_128", this.SM4_128_KEY_LEN);
      this.map.set("ChaCha20", this.CHACHA20_KEY_LEN);
      // 非对称算法
      this.map.set("RSA512", this.RSA_512_KEY_LEN);
      this.map.set("RSA768", this.RSA_768_KEY_LEN);
      this.map.set("RSA1024", this.RSA_1024_KEY_LEN);
      this.map.set("RSA2048", this.RSA_2048_KEY_LEN);
      this.map.set("RSA3072", this.RSA_3072_KEY_LEN);
      this.map.set("RSA4096", this.RSA_4096_KEY_LEN);
      this.map.set("RSA8192", this.RSA_8192_KEY_LEN);
      this.map.set("RSA", this.RSA_OTHER_KEY_LEN);
      this.map.set("ECC192", this.ECC_192_KEY_LEN);
      this.map.set("ECC224", this.ECC_224_KEY_LEN);
      this.map.set("ECC256", this.ECC_256_KEY_LEN);
      this.map.set("ECC384", this.ECC_384_KEY_LEN);
      this.map.set("ECC521", this.ECC_521_KEY_LEN);
      this.map.set("ECC_BrainPoolP160r1", this.ECC_BPP_160R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP160t1", this.ECC_BPP_160T1_KEY_LEN);
      this.map.set("ECC_BrainPoolP192r1", this.ECC_BPP_192R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP192t1", this.ECC_BPP_192T1_KEY_LEN);
      this.map.set("ECC_BrainPoolP224r1", this.ECC_BPP_224R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP224t1", this.ECC_BPP_224T1_KEY_LEN);
      this.map.set("ECC_BrainPoolP256r1", this.ECC_BPP_256R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP256t1", this.ECC_BPP_256T1_KEY_LEN);
      this.map.set("ECC_BrainPoolP320r1", this.ECC_BPP_320R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP320t1", this.ECC_BPP_320T1_KEY_LEN);
      this.map.set("ECC_BrainPoolP384r1", this.ECC_BPP_384R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP384t1", this.ECC_BPP_384T1_KEY_LEN);
      this.map.set("ECC_BrainPoolP512r1", this.ECC_BPP_512R1_KEY_LEN);
      this.map.set("ECC_BrainPoolP512t1", this.ECC_BPP_512T1_KEY_LEN);
      this.map.set("ECC_Secp256k1", this.ECC_SECP_256K1_KEY_LEN);
      this.map.set("DSA1024", this.DSA_1024_KEY_LEN);
      this.map.set("DSA2048", this.DSA_2048_KEY_LEN);
      this.map.set("DSA3072", this.DSA_3072_KEY_LEN);
      this.map.set("SM2_256", this.SM2_256_KEY_LEN);
      this.map.set("Ed25519", this.ED25519_KEY_LEN);
      this.map.set("X25519", this.X25519_KEY_LEN);
      this.map.set("DH_modp1536", this.DH_MODP1536_KEY_LEN);
      this.map.set("DH_modp2048", this.DH_MODP2048_KEY_LEN);
      this.map.set("DH_modp3072", this.DH_MODP3072_KEY_LEN);
      this.map.set("DH_modp4096", this.DH_MODP4096_KEY_LEN);
      this.map.set("DH_modp6144", this.DH_MODP6144_KEY_LEN);
      this.map.set("DH_modp8192", this.DH_MODP8192_KEY_LEN);
      this.map.set("DH_ffdhe2048", this.DH_FFDHE_2048_KEY_LEN);
      this.map.set("DH_ffdhe3072", this.DH_FFDHE_3072_KEY_LEN);
      this.map.set("DH_ffdhe4096", this.DH_FFDHE_4096_KEY_LEN);
      this.map.set("DH_ffdhe6144", this.DH_FFDHE_6144_KEY_LEN);
      this.map.set("DH_ffdhe8192", this.DH_FFDHE_8192_KEY_LEN);
    }
  }
  getKeyLen(algName: string): number {
    return this.map.get(algName)
  }
}

let SYM_ALGORITHM_NAMES: string[] = [
  "AES128", "AES192", "AES256", "DES64", "3DES192", "SM4_128", "ChaCha20"
];

let ASY_ALGORITHM_NAMES_1: string[] = [
  "RSA512", "RSA768", "RSA1024", "RSA2048", "RSA3072", "RSA4096", "RSA8192",
  "DSA1024", "DSA2048", "DSA3072", "SM2_256",
];

let ASY_ALGORITHM_NAMES_2: string[] = [
  "ECC_BrainPoolP224r1", "ECC_BrainPoolP224t1", "ECC_BrainPoolP256r1", "ECC_BrainPoolP256t1",
  "ECC_BrainPoolP320r1", "ECC_BrainPoolP320t1", "ECC_BrainPoolP384r1", "ECC_BrainPoolP384t1",
  "ECC_BrainPoolP512r1", "ECC_BrainPoolP512t1"
];

let ASY_ALGORITHM_NAMES_3: string[] = [
  "ECC224", "ECC256", "ECC384", "ECC521", "ECC192",
  "DH_modp1536", "DH_modp2048", "DH_modp3072", "DH_modp4096",
  "DH_modp6144", "DH_modp8192"
];

let ASY_ALGORITHM_NAMES_4: string[] = [
  "DH_ffdhe2048", "DH_ffdhe3072",
  "DH_ffdhe4096", "DH_ffdhe6144", "DH_ffdhe8192"
];

let ASY_ALGORITHM_NAMES_5: string[] = [
  "Ed25519", "X25519", "ECC_BrainPoolP160r1", "ECC_BrainPoolP160t1", "ECC_BrainPoolP192r1", "ECC_BrainPoolP192t1",
];

export {
  stringToUint8Array,
  decToHexString,
  convertToUint8Array,
  compareDataBlob,
  createData,
  createFullData,
  compareNumber,
  compareString,
  doScryptCallback,
  asyncType,
  OH_MF_INFO,
  OH_MD_SPEC,
  MdMap,
  KeyLenMap,
  SYM_ALGORITHM_NAMES,
  ASY_ALGORITHM_NAMES_1,
  ASY_ALGORITHM_NAMES_2,
  ASY_ALGORITHM_NAMES_3,
  ASY_ALGORITHM_NAMES_4,
  ASY_ALGORITHM_NAMES_5
}