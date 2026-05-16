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

async function genKeyPair(isSpec: boolean, spec: cpFw.AsyKeySpec, algName: string): Promise<cpFw.KeyPair> {
  try {
    if (!isSpec) {
      let generate: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
      let keyPair: cpFw.KeyPair = await generate.generateKeyPair();
      return keyPair;
    } else {
      let generate: cpFw.AsyKeyGeneratorBySpec = cpFw.createAsyKeyGeneratorBySpec(spec);
      let keyPair: cpFw.KeyPair = await generate.generateKeyPair();
      return keyPair;
    }
  } catch (err: BusinessError) {
    console.error("Promise genKeyPair: catch error:" + err + "errCode: " + err.code);
    throw err as Error;
  }
}

async function genPubKey(spec: cpFw.AsyKeySpec): Promise<cpFw.PubKey> {
  try {
    return await cpFw.createAsyKeyGeneratorBySpec(spec).generatePubKey();
  } catch (err: BusinessError) {
    console.log("Promise genPubKey failed. catch error " + err);
    throw err as Error;
  }
}

async function genPriKey(spec: cpFw.AsyKeySpec): Promise<cpFw.PriKey> {
  try {
    return await cpFw.createAsyKeyGeneratorBySpec(spec).generatePriKey();
  } catch (err: BusinessError) {
    console.log("Promise genPriKey failed. catch error " + err);
    throw err as Error;
  }
}

async function convertKey(algName: string): Promise<boolean> {
  try {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Promise convertKey: createAsyKeyGenerator succeed.");
    let spec: cpFw.AsyKeySpec = {
      algName: "ECC",
      specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
    };
    let keyPair: cpFw.KeyPair = await genKeyPair(false, spec, algName);
    console.log("Promise convertKey: generatePriKey succeed.");
    await generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded());
    console.log("Promise convertKey: success.");
    return true;
  } catch (err: BusinessError) {
    console.log("Promise convertKey failed. catch error " + err);
    throw err as Error;
  }
}

async function convertDHKey(algName: string): Promise<boolean> {
  try {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Promise convertKey: createAsyKeyGenerator succeed.");
    let spec: cpFw.AsyKeySpec = {
      algName: "ECC",
      specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
    };
    let keyPair: cpFw.KeyPair = await genKeyPair(false, spec, algName);
    console.log("Promise convertKey: generatePriKey succeed.");
    let keyPairNew: cpFw.KeyPair = await generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded());
    console.log("Promise convertKey: success.");
    if (keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_L_NUM) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_L_NUM)
      || keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_P_BN)
      || keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_G_BN)
      || keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_SK_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_SK_BN)
      || keyPairNew.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_PK_BN) == keyPair.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.DH_PK_BN)) {
      return true;
    } else {
      return false;
    }
  } catch (err: BusinessError) {
    console.log("Promise convertKey failed. catch error " + err);
    throw err as Error;
  }
}

async function convertX25519Key(algName: string): Promise<boolean> {
  try {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Promise convertKey: createAsyKeyGenerator succeed.");
    let spec: cpFw.AsyKeySpec = {
      algName: "ECC",
      specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
    };
    let keyPair: cpFw.KeyPair = await genKeyPair(false, spec, algName);
    console.log("Promise convertKey: generatePriKey succeed.");
    let keyPairNew: cpFw.KeyPair = await generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded());
    console.log("Promise convertKey: success.");
    if (keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_SK_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_SK_BN)
      || keyPairNew.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_PK_BN) == keyPair.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.X25519_PK_BN)) {
      return true;
    } else {
      return false;
    }
  } catch (err: BusinessError) {
    console.log("Promise convertKey failed. catch error " + err);
    throw err as Error;
  }
}

async function convertEd25519Key(algName: string): Promise<boolean> {
  try {
    let generator: cpFw.AsyKeyGenerator = cpFw.createAsyKeyGenerator(algName);
    console.log("Promise convertKey: createAsyKeyGenerator succeed.");
    let spec: cpFw.AsyKeySpec = {
      algName: "ECC",
      specType: cpFw.AsyKeySpecType.COMMON_PARAMS_SPEC
    };
    let keyPair: cpFw.KeyPair = await genKeyPair(false, spec, algName);
    console.log("Promise convertKey: generatePriKey succeed.");
    let keyPairNew: cpFw.KeyPair = await generator.convertKey(keyPair.pubKey.getEncoded(), keyPair.priKey.getEncoded());
    console.log("Promise convertKey: success.");
    if (keyPairNew.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_SK_BN) == keyPair.priKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_SK_BN)
      || keyPairNew.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_PK_BN) == keyPair.pubKey.getAsyKeySpec(cpFw.AsyKeySpecItem.ED25519_PK_BN)) {
      return true;
    } else {
      return false;
    }
  } catch (err: BusinessError) {
    console.log("Promise convertKey failed. catch error " + err);
    throw err as Error;
  }
}

export {
  genKeyPair, genPubKey, genPriKey, convertKey, convertDHKey, convertX25519Key, convertEd25519Key
}