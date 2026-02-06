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
import * as commonUtil from '../common/commonUtils';


let secp256k1_pri: string =
  '-----BEGIN EC PRIVATE KEY-----\n'                                   +
  'MHQCAQEEIMNZ1zD4VpQ9YT8dEEEevb8xF93SQcAqtFoIjjPrKQEvoAcGBSuBBAAK\n' +
  'oUQDQgAEE2ZWHaFctn8fKwe8Hk5YfyaQcrsaK28Ws5ctj6Wzm/A4EKBCvGHzoLjl\n' +
  'ZFLBwwyq963uKx9Q6wtXG0UUtWtlgg==\n'                                 +
  '-----END EC PRIVATE KEY-----'

let secp256k1_pub: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MFYwEAYHKoZIzj0CAQYFK4EEAAoDQgAEE2ZWHaFctn8fKwe8Hk5YfyaQcrsaK28W\n' +
  's5ctj6Wzm/A4EKBCvGHzoLjlZFLBwwyq963uKx9Q6wtXG0UUtWtlgg==\n'         +
  '-----END PUBLIC KEY-----'

let secp256k1_pri_r: string =
  '-----BEGIN EC PRIVATE KEY-----\n'                                   +
  'MHQCAQEEICvQUphUD5uZZR+gJ1ktUWyzojDNI3kdF2BD3DEMYbmEoAcGBSuBBAAK\n' +
  'oUQDQgAEbCF9QXGxw4JaNnROgPmWNGt3jxjTJmoBjJJqt0sJ3GVyUp18VxjWsDM8\n' +
  'ckr9HdSEu4R6H0gYqIGDM37WokimFg==\n'                                 +
  '-----END EC PRIVATE KEY-----'

let ECC_BrainPoolP256r1_pri: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIGIAgEAMBQGByqGSM49AgEGCSskAwMCCAEBBwRtMGsCAQEEIGn/p90K60k4LH9b\n' +
  'FF3/yZ2D3NzGSbSeMUzygmUpSYbdoUQDQgAEbSPSZ++4cYdElfLyEuGZ4/qGvLq/\n' +
  'nRPaorO+4B/HuE2aIto9qJ1VCTcRvr4K9xk1J5QbMTnsF4/TFLLN4gRkFA==\n'     +
  '-----END PRIVATE KEY-----\n'

let ECC_BrainPoolP256r1_pub: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEHA0IABG0j0mfvuHGHRJXy8hLhmeP6hry6\n' +
  'v50T2qKzvuAfx7hNmiLaPaidVQk3Eb6+CvcZNSeUGzE57BeP0xSyzeIEZBQ=\n'     +
  '-----END PUBLIC KEY-----\n'

let secp256k1_pub_r: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MFYwEAYHKoZIzj0CAQYFK4EEAAoDQgAEbCF9QXGxw4JaNnROgPmWNGt3jxjTJmoB\n' +
  'jJJqt0sJ3GVyUp18VxjWsDM8ckr9HdSEu4R6H0gYqIGDM37WokimFg==\n'         +
  '-----END PUBLIC KEY-----'


let ALICE_secp256k1: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIGEAgEAMBAGByqGSM49AgEGBSuBBAAKBG0wawIBAQQgHCRzy0IcEx6CeA6ogNNK\n' +
  'SOfuTlHy4fE/LNxkANUS4k+hRANCAASDBmwKklX4OcbZSJJX9mxm1Wr7TPTLpbyp\n' +
  'xKcKRm0XKNxVlrZU8WQCl66GtX2DDyX+0+XiC3hbaRWcYtg7P6WO\n'             +
  '-----END PRIVATE KEY-----\n'

let ALICE_secp256k1_PUB: string =
  '-----BEGIN PUBLIC KEY-----\n' +
  'MFYwEAYHKoZIzj0CAQYFK4EEAAoDQgAEgwZsCpJV+DnG2UiSV/ZsZtVq+0z0y6W8\n' +
  'qcSnCkZtFyjcVZa2VPFkApeuhrV9gw8l/tPl4gt4W2kVnGLYOz+ljg==\n' +
  '-----END PUBLIC KEY-----\n'

let BOB_secp256k1: string =
  '-----BEGIN PRIVATE KEY-----\n' +
  'MIGEAgEAMBAGByqGSM49AgEGBSuBBAAKBG0wawIBAQQgChCkFvWtOcrXLmXVGqkR\n' +
  '0gdntyytjGzEKue5t+IL2lihRANCAAQFQoIckey+Vyh3QwJWUUfKXNbbjWe94yZE\n' +
  'AWGvI2BfqtWqigZF5VSb5aIXtTPRmwiN0cp30cd77YE5Z+e5bJHU\n' +
  '-----END PRIVATE KEY-----\n'

let BOB_secp256k1_PUB: string =
  '-----BEGIN PUBLIC KEY-----\n' +
  'MFYwEAYHKoZIzj0CAQYFK4EEAAoDQgAEBUKCHJHsvlcod0MCVlFHylzW241nveMm\n' +
  'RAFhryNgX6rVqooGReVUm+WiF7Uz0ZsIjdHKd9HHe+2BOWfnuWyR1A==\n' +
  '-----END PUBLIC KEY-----\n'

let secret: number[] = [
  0xaf, 0x43, 0xb5, 0x27, 0x90, 0x08, 0x2f, 0xd8, 0x7a, 0xfb, 0x1d, 0x14, 0xb8, 0x83, 0xc1, 0x2d,
  0x12, 0xbb, 0x9e, 0x55, 0x40, 0x80, 0xd1, 0xf8, 0xe5, 0x27, 0x92, 0x06, 0x76, 0xe3, 0x1f, 0x3e
]

let secp256k1_pri_number: number[] = [
  0x30,0x2e,0x02,0x01,0x01,0x04,0x20,0xc3,0x59,0xd7,0x30,0xf8,0x56,0x94,0x3d,0x61,
  0x3f,0x1d,0x10,0x41,0x1e,0xbd,0xbf,0x31,0x17,0xdd,0xd2,0x41,0xc0,0x2a,0xb4,0x5a,
  0x08,0x8e,0x33,0xeb,0x29,0x01,0x2f,0xa0,0x07,0x06,0x05,0x2b,0x81,0x04,0x00,0x0a
]

let secp256k1_pub_number: number[] = [
  0x30,0x56,0x30,0x10,0x06,0x07,0x2a,0x86,0x48,0xce,0x3d,0x02,0x01,0x06,0x05,0x2b,
  0x81,0x04,0x00,0x0a,0x03,0x42,0x00,0x04,0x13,0x66,0x56,0x1d,0xa1,0x5c,0xb6,0x7f,
  0x1f,0x2b,0x07,0xbc,0x1e,0x4e,0x58,0x7f,0x26,0x90,0x72,0xbb,0x1a,0x2b,0x6f,0x16,
  0xb3,0x97,0x2d,0x8f,0xa5,0xb3,0x9b,0xf0,0x38,0x10,0xa0,0x42,0xbc,0x61,0xf3,0xa0,
  0xb8,0xe5,0x64,0x52,0xc1,0xc3,0x0c,0xaa,0xf7,0xad,0xee,0x2b,0x1f,0x50,0xeb,0x0b,
  0x57,0x1b,0x45,0x14,0xb5,0x6b,0x65,0x82
]

let secp256k1_pub_number_r: number[] = [
  0x30,0x56,0x30,0x10,0x06,0x07,0x2a,0x86,0x48,0xce,0x3d,0x02,0x01,0x06,0x05,0x2b,
  0x81,0x04,0x00,0x0a,0x03,0x42,0x00,0x04,0x2d,0xe2,0x00,0xdf,0xd8,0x3d,0x2f,0xac,
  0xe4,0xdc,0x9e,0xd6,0x9a,0x76,0x92,0x77,0x1c,0x67,0x3e,0x8f,0x38,0xd4,0x15,0xc9,
  0xe4,0x80,0x2c,0xdf,0x1e,0x4e,0x83,0x12,0xe5,0x33,0xaf,0xf7,0xf9,0xaa,0x53,0x24,
  0xf0,0xa6,0xad,0xca,0xa4,0x9c,0x1f,0xe7,0xcd,0x06,0xe4,0x6c,0xf8,0xc1,0xbd,0x0f,
  0xe2,0x76,0x3e,0xf6,0x47,0xe0,0xc1,0x5e
]

let secp256k1_pri_number_r: number[] = [
  0x30,0x2e,0x02,0x01,0x01,0x04,0x20,0xfb,0xb3,0x2e,0x12,0xe3,0xa7,0x84,0x12,0x3f,
  0xc6,0xf5,0x73,0x31,0x74,0x54,0xcf,0xba,0xd4,0xfe,0x84,0x9a,0x4a,0xfb,0xdf,0xfc,
  0x3d,0x3a,0x20,0xe8,0xe0,0x31,0x4f,0xa0,0x07,0x06,0x05,0x2b,0x81,0x04,0x00,0x0a
]

let ECC_BrainPoolP192r1_pri_number: number[] = [
  0x30,0x2a,0x02,0x01,0x01,0x04,0x18,0x38,0x86,0x6a,0x11,0xbd,0x0c,0x86,0x3a,0x36,
  0x5a,0x8d,0xc4,0xbe,0xaf,0x40,0x0e,0x2d,0x77,0x40,0x08,0xfe,0x0a,0x03,0x7d,0xa0,
  0x0b,0x06,0x09,0x2b,0x24,0x03,0x03,0x02,0x08,0x01,0x01,0x03
]

let ECC_BrainPoolP192r1_pub_number: number[] = [
  0x30,0x4a,0x30,0x14,0x06,0x07,0x2a,0x86,0x48,0xce,0x3d,0x02,0x01,0x06,0x09,0x2b,
  0x24,0x03,0x03,0x02,0x08,0x01,0x01,0x03,0x03,0x32,0x00,0x04,0xc2,0xdb,0x73,0xcf,
  0x10,0x5a,0xe6,0xc0,0x1e,0xfe,0xbf,0x74,0xeb,0x06,0x25,0x94,0x08,0xe5,0xea,0xcc,
  0x40,0xd2,0x8d,0xc9,0xc2,0x43,0x09,0x43,0xf8,0x3d,0xf6,0xec,0x37,0x18,0x2b,0x64,
  0x9f,0xad,0x56,0x85,0x36,0x86,0x38,0x43,0x31,0x31,0x90,0x94
]

let rawData: number[] = [
  0x30,0x46,0x02,0x21,0x00,0xab,0x97,0xcb,0x49,0xb9,0x8c,0x88,0xa3,0xd5,0xca,0x17,
  0xda,0x23,0xfd,0xb1,0x59,0x04,0xed,0x1d,0xad,0xe0,0xa1,0xcc,0xdc,0x11,0x5e,0x87,
  0x0b,0xd5,0xf1,0x35,0xb9,0x02,0x21,0x00,0xf2,0xb5,0x85,0x78,0x73,0x7a,0xa0,0x81,
  0x64,0x51,0xde,0x70,0x80,0x0a,0x17,0x76,0x52,0x4a,0x5d,0x66,0x65,0x9e,0x12,0xb1,
  0x8b,0xab,0x59,0x07,0x4f,0x48,0x5c,0xa3
]

let msgData: number[] = [
  0x7c,0x11,0x85,0x5a,0x93,0xd7,0x88,0x14,0xdd,0xe7,0x7f,0x74,0x43,0xd3,0xa2,0x29,
  0xd5,0x13,0x11,0x50,0xbb,0xcc,0x72,0xfd,0x58,0x92,0xa2,0x83,0x54,0x4b,0xce,0xb3,
  0x11,0xde,0xfd,0x0d,0x6c,0x71,0x5d,0xc3,0x6b,0x8c,0x6b,0xb5,0xb4,0x8e,0xe1,0xc1,
  0xe6,0xab,0xdd,0x4c,0x8d,0x6d,0xab,0x20,0xee,0x6d,0x9c,0xc7,0xd0,0x1d,0xc3,0x60
]

let rawData_r: number[] = [
  0x30,0x45,0x02,0x21,0x00,0xf4,0xbb,0xcb,0x86,0x80,0x35,0xd2,0xff,0x20,0x4d,0x79,
  0x6a,0x06,0xd3,0xe7,0x9d,0xca,0xf4,0xa6,0x52,0x67,0x3f,0x1b,0xfb,0x1f,0x1f,0x09,
  0x8f,0x7c,0x0a,0x45,0xf8,0x02,0x20,0x26,0x15,0x6e,0x57,0x70,0x91,0x41,0x5a,0x1f,
  0x41,0x99,0x26,0x94,0x59,0x0e,0xd2,0xe2,0x19,0xac,0xa6,0x5f,0xdb,0x21,0xe0,0x70,
  0x9f,0xcb,0xfd,0x35,0xee,0x6f,0x4e
]

let msgData_r: number[] = [
  0x2b,0x05,0x64,0xe3,0xe2,0x7a,0x13,0x8e,0x73,0x81,0x6a,0x0a,0xc0,0x0e,0x11,0x01,
  0xe7,0x1b,0x5c,0x3d,0x20,0xa2,0xe6,0x45,0x19,0xdf,0x42,0x0e,0x21,0x33,0x1d,0x69,
  0x80,0x0f,0x1d,0x4f,0x17,0x33,0x3d,0x54,0x17,0xdf,0xf7,0x6c,0xcc,0xc1,0x4b,0x0f,
  0x63,0xfd,0x25,0x00,0x67,0x95,0xf3,0xd0,0x53,0xfe,0xbd,0x6f,0xe0,0xde,0xb0,0xe9
]

let demo_sig: number[] = [
  0x30, 0x45, 0x02, 0x20, 0x54, 0x59, 0xee, 0x9a, 0x62, 0x3f, 0xce, 0xec, 0xc0, 0x8e, 0xa2, 0xc4,
  0x66, 0x36, 0xdb, 0xcf, 0xcd, 0x7f, 0xa1, 0x1f, 0xf3, 0x1b, 0xbb, 0x5d, 0xd2, 0x93, 0x25, 0xab,
  0x85, 0xb6, 0xfb, 0xfb, 0x02, 0x21, 0x00, 0xe1, 0x92, 0x08, 0xa1, 0x10, 0x52, 0x95, 0xff, 0x30,
  0x63, 0x06, 0xf6, 0xc3, 0x7b, 0x9c, 0x69, 0x35, 0x2f, 0xdd, 0x27, 0x87, 0x2e, 0x3a, 0xb7, 0x25,
  0x31, 0x9f, 0x02, 0xcb, 0x79, 0x95, 0xad
]

let demo_msg: number[] = [
  0x74, 0x68, 0x69, 0x73, 0x20, 0x69, 0x73, 0x20, 0x74, 0x65, 0x73, 0x74, 0x0a
]

let digestSpec: string[] = [
  "SHA1", "SHA224", "SHA256", "SHA384", "SHA512"
]

async function vectorTest(algName: string): Promise<boolean> {
  try {
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair_ALICE: cryptoFramework.KeyPair = await generator.convertPemKey(ALICE_secp256k1_PUB, ALICE_secp256k1);
    let keyPair_BOB: cryptoFramework.KeyPair = await generator.convertPemKey(BOB_secp256k1_PUB, BOB_secp256k1);

    let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
    let secret_a: cryptoFramework.DataBlob = await agreement.generateSecret(keyPair_ALICE.priKey, keyPair_BOB.pubKey);
    let secret_b: cryptoFramework.DataBlob = await agreement.generateSecret(keyPair_BOB.priKey, keyPair_ALICE.pubKey);
    let ret: boolean = commonUtil.compareDataBlob(secret_a, secret_b);
    ret = ret && commonUtil.compareDataBlob(secret_a, {data: new Uint8Array(secret)});
    return ret;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createAsyKeyPromise(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function createAsyKeySync(algName: string): cryptoFramework.KeyPair {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = asyKeyGenerator.generateKeyPairSync();

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createAsyKeyCallback(algName: string): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    asyKeyGenerator.generateKeyPair((err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
      if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        resolve(keyPair as cryptoFramework.KeyPair);
      }
    });
  });
}

async function convertAsyKeyPromise(algName: string, pubKeyData: cryptoFramework.DataBlob|null,
  priKeyData: cryptoFramework.DataBlob|null): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = await asyKeyGenerator.convertKey(pubKeyData, priKeyData);

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function convertAsyKeySync(algName: string, pubKeyData: cryptoFramework.DataBlob|null,
  priKeyData: cryptoFramework.DataBlob|null): cryptoFramework.KeyPair {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = asyKeyGenerator.convertKeySync(pubKeyData, priKeyData);

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertAsyKeyCallback(algName: string, pubKeyData: cryptoFramework.DataBlob|null,
  priKeyData: cryptoFramework.DataBlob|null): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    asyKeyGenerator.convertKey(pubKeyData, priKeyData, (err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
      if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        resolve(keyPair as cryptoFramework.KeyPair);
      }
    });
  });
}

// function showBigIntInfo(bnName: string, bnValue: bigint | string | number): void {
//   if (typeof bnValue === 'string') {
//     console.error('type is string');
//     return;
//   }
//   if (typeof bnValue === 'number') {
//     console.error('type is number');
//     return;
//   }
//   console.info(bnName + ':');
//   console.info('. Decimal: ' + bnValue.toString());
//   console.info('. Hexadecimal: ' + bnValue.toString(16));
//   console.info('. Length (bits): ' + bnValue.toString(2).length);
// }

function showEccSpecDetailInfo(key: cryptoFramework.PubKey | cryptoFramework.PriKey, keyType: string): void {
  console.info('show detail of ' + keyType + ':');
  try {
    // let p = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN);
    // showBigIntInfo('--- p', p);
    // let a = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_A_BN);
    // showBigIntInfo('--- a', a);
    // let b = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_B_BN);
    // showBigIntInfo('--- b', b);
    // let gX = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
    // showBigIntInfo('--- gX', gX);
    // let gY = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN);
    // showBigIntInfo('--- gY', gY);
    // let n = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_N_BN);
    // showBigIntInfo('--- n', n);
    // let h = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_H_NUM);
    // console.warn('--- h: ' + h);
    // let fieldType = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR);
    // console.warn('--- field type: ' + fieldType);
    // let fieldSize = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM);
    // console.warn('--- field size: ' + fieldSize);
    // let curveName = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
    // console.warn('--- curve name: ' + curveName);
    // if (keyType == 'priKey') {
    //   let sk = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_SK_BN);
    //   showBigIntInfo('--- sk', sk);
    // } else if (keyType == 'pubKey') {
    //   let pkX = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
    //   showBigIntInfo('--- pkX', pkX);
    //   let pkY = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
    //   showBigIntInfo('--- pkY', pkY);
    // }
  } catch (e) {
    console.error(`getAsyKeySpec failed, ${e.code}, ${e.message}`);
  }
}

async function doSignVerifyPromise(algName: string, keyPair: cryptoFramework.KeyPair,
  msg: cryptoFramework.DataBlob): Promise<boolean> {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    await sign.init(keyPair.priKey);
    let rawData: cryptoFramework.DataBlob = await sign.sign(msg);

    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    await verify.init(keyPair.pubKey);
    let ret: boolean = await verify.verify(msg, rawData);

    return ret;
  } catch (error) {
    console.error(`doSignVerify “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doSignPromise(algName: string, keyPair: cryptoFramework.KeyPair,
  msg: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    await sign.init(keyPair.priKey);
    let rawData: cryptoFramework.DataBlob = await sign.sign(msg);

    return rawData;
  } catch (error) {
    console.error(`doSignVerify “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doAgreementPromise(algName: string, pubKey: cryptoFramework.PubKey,
  priKey: cryptoFramework.PriKey): Promise<cryptoFramework.DataBlob> {
  try {
    let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
    let secret: cryptoFramework.DataBlob = await agreement.generateSecret(priKey, pubKey);

    return secret;
  } catch (error) {
    console.error(`doAgreementPromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doAgreementCallback(algName: string, pubKey: cryptoFramework.PubKey,
  priKey: cryptoFramework.PriKey): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
    agreement.generateSecret(priKey, pubKey, (err: BusinessError<void>|null, secret: cryptoFramework.DataBlob|undefined) => {
      if (err || secret === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error)
      } else {
        resolve(secret as cryptoFramework.DataBlob)
      }
    });
  });
}

function doAgreementSync(algName: string, pubKey: cryptoFramework.PubKey,
  priKey: cryptoFramework.PriKey): cryptoFramework.DataBlob {
  try {
    let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
    let secret: cryptoFramework.DataBlob = agreement.generateSecretSync(priKey, pubKey);

    return secret;
  } catch (error) {
    console.error(`doSignVerify “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doSignInitCallback(sign: cryptoFramework.Sign, keyPair: cryptoFramework.KeyPair): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    sign.init(keyPair.priKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        reject(err as Error)
      } else {
        resolve("init success")
      }
    });
  });
}

async function doSignSignCallback(sign: cryptoFramework.Sign,
  msg: cryptoFramework.DataBlob|null): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    sign.sign(msg, (err: BusinessError<void>|null, rawData: cryptoFramework.DataBlob|undefined) => {
      if (err || rawData === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error)
      } else {
        resolve(rawData as cryptoFramework.DataBlob)
      }
    });
  });
}

async function doVerifyInitCallback(verify: cryptoFramework.Verify, keyPair: cryptoFramework.KeyPair): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    verify.init(keyPair.pubKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        reject(err as Error)
      } else {
        resolve("init success")
      }
    });
  });
}

async function doVerifyVerifyCallback(verify: cryptoFramework.Verify,
  msg: cryptoFramework.DataBlob|null, rawData: cryptoFramework.DataBlob): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    verify.verify(msg, rawData, (err: BusinessError<void>|null, ret: boolean|undefined) => {
      if (err || ret === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error)
      } else {
        resolve(ret as boolean)
      }
    });
  });
}

function doSignVerifySync(algName: string, keyPair: cryptoFramework.KeyPair,
  msg: cryptoFramework.DataBlob): boolean {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    sign.initSync(keyPair.priKey);
    let rawData: cryptoFramework.DataBlob = sign.signSync(msg);

    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    verify.initSync(keyPair.pubKey);
    let ret: boolean = verify.verifySync(msg, rawData);

    return ret;
  } catch (error) {
    console.error(`doSignVerify “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doSignSync(algName: string, keyPair: cryptoFramework.KeyPair,
  msg: cryptoFramework.DataBlob): cryptoFramework.DataBlob {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    sign.initSync(keyPair.priKey);
    let rawData: cryptoFramework.DataBlob = sign.signSync(msg);

    return rawData;
  } catch (error) {
    console.error(`doSignSync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doVerifySync(algName: string, keyPair: cryptoFramework.KeyPair,
  msg: cryptoFramework.DataBlob, rawData: cryptoFramework.DataBlob): boolean {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    verify.initSync(keyPair.pubKey);
    let ret: boolean = verify.verifySync(msg, rawData);

    return ret;
  } catch (error) {
    console.error(`doVerifySync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doVerifyPromise(algName: string, keyPair: cryptoFramework.KeyPair,
  msg: cryptoFramework.DataBlob, rawData: cryptoFramework.DataBlob): Promise<boolean> {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    await verify.init(keyPair.pubKey);
    let ret: boolean = await verify.verify(msg, rawData);

    return ret;
  } catch (error) {
    console.error(`doVerifySync “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doVerifyUpdateCallback(verify: cryptoFramework.Verify, msg: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    verify.update(msg, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        resolve("update success")
      }
    });
  });
}

async function doSignUpdatePromise(algName: string, priKey: cryptoFramework.PriKey, msg: cryptoFramework.DataBlob,
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
    console.error(`doSignUpdatePromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doSignUpdateCallback(sign: cryptoFramework.Sign, msg: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    sign.update(msg, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        resolve("update success")
      }
    });
  });
}

function doSignUpdateSync(algName: string, priKey: cryptoFramework.PriKey, msg: cryptoFramework.DataBlob,
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
    console.error(`doSignUpdatePromise “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

export {
  createAsyKeyPromise,
  createAsyKeyCallback,
  createAsyKeySync,
  convertAsyKeyPromise,
  convertAsyKeySync,
  convertAsyKeyCallback,
  doSignUpdatePromise,
  doSignUpdateSync,
  doSignUpdateCallback,
  secp256k1_pri,
  secp256k1_pub,
  ECC_BrainPoolP256r1_pri,
  ECC_BrainPoolP256r1_pub,
  secp256k1_pri_r,
  secp256k1_pub_r,
  secp256k1_pub_number,
  secp256k1_pri_number,
  secp256k1_pri_number_r,
  secp256k1_pub_number_r,
  ECC_BrainPoolP192r1_pri_number,
  ECC_BrainPoolP192r1_pub_number,
  doSignVerifyPromise,
  doSignVerifySync,
  doAgreementPromise,
  doAgreementSync,
  doAgreementCallback,
  doVerifyInitCallback,
  doVerifyUpdateCallback,
  doVerifyVerifyCallback,
  doSignSignCallback,
  doSignInitCallback,
  doSignPromise,
  doSignSync,
  doVerifySync,
  doVerifyPromise,
  digestSpec,
  rawData,
  msgData,
  rawData_r,
  msgData_r,
  vectorTest,
  demo_sig,
  demo_msg,
  showEccSpecDetailInfo
}