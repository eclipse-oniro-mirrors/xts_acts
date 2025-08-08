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

let ECDH_SPEC = [
  "ECC_BrainPoolP160r1", "ECC_BrainPoolP160t1", "ECC_BrainPoolP192r1", "ECC_BrainPoolP192t1",
  "ECC_BrainPoolP224r1", "ECC_BrainPoolP224t1", "ECC_BrainPoolP256r1", "ECC_BrainPoolP256t1",
  "ECC_BrainPoolP320r1", "ECC_BrainPoolP320t1", "ECC_BrainPoolP384r1", "ECC_BrainPoolP384t1",
  "ECC_BrainPoolP512r1", "ECC_BrainPoolP512t1", "ECC", "ECC224", "ECC256", "ECC384", "ECC521",
]

let X25519_SPEC = ["X25519"]

let DH_SPEC = [
  "DH_modp1536", "DH_modp2048", "DH_modp3072", "DH_modp4096",
  "DH_modp6144", "DH_modp8192", "DH_ffdhe2048", "DH_ffdhe3072",
  "DH_ffdhe4096", "DH_ffdhe6144", "DH_ffdhe8192", "DH",
]


function eccKeyAgreement(algName: string, pubKey: cryptoFramework.PubKey, priKey: cryptoFramework.PriKey) {
  try {
    let agreeObj: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
    let secret: cryptoFramework.DataBlob = agreeObj.generateSecretSync(priKey, pubKey);

    return secret;
  } catch (error) {
    console.error(`eccKeyAgreement “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function generateKey(algName: string) {
  try {
    let keyObj = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair = await keyObj.generateKeyPair();

    return keyPair;
  } catch (error) {
    console.error(`generateKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

export {
  eccKeyAgreement,
  generateKey,
  ECDH_SPEC,
  X25519_SPEC,
  DH_SPEC
}