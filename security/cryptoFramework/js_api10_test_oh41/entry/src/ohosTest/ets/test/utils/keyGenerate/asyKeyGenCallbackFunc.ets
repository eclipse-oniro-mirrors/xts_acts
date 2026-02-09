/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import cpFw from '@ohos.security.cryptoFramework';
import { BusinessError } from '@ohos.base';

async function genKeyPair(spec: cpFw.AsyKeySpec | string): Promise<cpFw.KeyPair> {
  return new Promise((resolve, reject) => {
    if (typeof spec == "string") {
      cpFw.createAsyKeyGenerator(spec).generateKeyPair((err, keyPair) => {
        if (err) {
          console.log("Callback genKeyPair failed. catch error " + err);
          reject(err);
        } else {
          resolve(keyPair);
        }
      });
    } else {
      cpFw.createAsyKeyGeneratorBySpec(spec).generateKeyPair((err, keyPair) => {
        if (err) {
          console.log("Callback genKeyPair failed. catch error " + err);
          reject(err);
        } else {
          resolve(keyPair);
        }
      });
    }
  });
}

async function genPubKey(spec: cpFw.AsyKeySpec): Promise<cpFw.PubKey> {
  return new Promise((resolve, reject) => {
    cpFw.createAsyKeyGeneratorBySpec(spec).generatePubKey((err, pubKey) => {
      if (err) {
        console.log("Callback genPubKey failed. catch error " + err);
        reject(err);
      } else {
        resolve(pubKey);
      }
    });
  });
}

async function genPriKey(spec: cpFw.AsyKeySpec): Promise<cpFw.PriKey> {
  return new Promise((resolve, reject) => {
    cpFw.createAsyKeyGeneratorBySpec(spec).generatePriKey((err, priKey) => {
      if (err) {
        console.log("Callback genPriKey failed. catch error " + err);
        reject(err);
      } else {
        resolve(priKey);
      }
    });
  });
}

async function convertKey(algName: string): Promise<boolean> {
  return new Promise(async (resolve, reject) => {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Callback convertKey: createAsyKeyGenerator succeed.");
    let keyPair: cpFw.KeyPair = await genKeyPair(algName);
    console.log("Callback convertKey: generatePriKey succeed.");
    generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded(), (err) => {
      if (err) {
        console.log("Callback convertKey failed. catch error " + err);
        reject(err);
      } else {
        resolve(true);
      }
    });
  });
}

async function convertDHKey(algName: string): Promise<boolean> {
  return new Promise(async (resolve, reject) => {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Callback convertKey: createAsyKeyGenerator succeed.");
    let keyPair: cpFw.KeyPair = await genKeyPair(algName);
    console.log("Callback convertKey: generatePriKey succeed.");
    generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded(), (err, keyPairNew) => {
      if (err) {
        console.log("Callback convertKey failed. catch error " + err);
        reject(err);
      } else if (keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_L_NUM) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_L_NUM)
        || keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN)
        || keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN)
        || keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_SK_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_SK_BN)
        || keyPairNew.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_PK_BN) == keyPair.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_PK_BN)) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
}

async function convertX25519Key(algName: string): Promise<boolean> {
  return new Promise(async (resolve, reject) => {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Callback convertKey: createAsyKeyGenerator succeed.");
    let keyPair: cpFw.KeyPair = await genKeyPair(algName);
    console.log("Callback convertKey: generatePriKey succeed.");
    generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded(), (err, keyPairNew) => {
      if (err) {
        console.log("Callback convertKey failed. catch error " + err);
        reject(err);
      } else if (keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_SK_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_SK_BN)
        || keyPairNew.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_PK_BN) == keyPair.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_PK_BN)) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
}

async function convertEd25519Key(algName: string): Promise<boolean> {
  return new Promise(async (resolve, reject) => {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Callback convertKey: createAsyKeyGenerator succeed.");
    let keyPair: cpFw.KeyPair = await genKeyPair(algName);
    console.log("Callback convertKey: generatePriKey succeed.");
    generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded(), (err, keyPairNew) => {
      if (err) {
        console.log("Callback convertKey failed. catch error " + err);
        reject(err);
      } else if (keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_SK_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_SK_BN)
        || keyPairNew.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_PK_BN) == keyPair.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_PK_BN)) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
}

export {
  genKeyPair, genPubKey, genPriKey, convertKey, convertDHKey, convertX25519Key, convertEd25519Key
}