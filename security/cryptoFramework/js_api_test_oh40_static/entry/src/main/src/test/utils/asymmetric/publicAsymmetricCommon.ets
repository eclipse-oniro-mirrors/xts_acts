/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import cryptoFramework from "@ohos.security.cryptoFramework";
import { BusinessError } from '@ohos.base';

function createAsyKeyGenerator(asyAlgoName: string): cryptoFramework.AsyKeyGenerator {
  try {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.log("rsaGenerator algName: " + rsaGenerator.algName);
    return rsaGenerator;
  } catch (err: BusinessError) {
    console.error("rsaGenerator error:" + err);
    throw err as Error;
  }
}

function createAsyKeyGeneratorBySpec(asyKeySpec: cryptoFramework.AsyKeySpec): cryptoFramework.AsyKeyGeneratorBySpec {
  try {
    let rsaGenerator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(asyKeySpec);
    console.log("rsaGenerator algName: " + rsaGenerator.algName);
    return rsaGenerator;
  } catch (err: BusinessError) {
    console.error("rsaGenerator error:" + err);
    throw err as Error;
  }
}

function createAsyCipher(cipherAlgoName: string): cryptoFramework.Cipher {
  try {
    let cipherGenerator: cryptoFramework.Cipher = cryptoFramework.createCipher(cipherAlgoName);
    console.log("cipherGenerator algName: " + cipherGenerator.algName);
    return cipherGenerator;
  } catch (err: BusinessError) {
    console.error("cipherGenerator error:" + err);
    throw err as Error;
  }
}

function createAsySign(signAlgoName: string): cryptoFramework.Sign {
  try {
    let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign(signAlgoName);
    console.log("signGenerator algName: " + signGenerator.algName);
    return signGenerator;
  } catch (err: BusinessError) {
    console.error("signGenerator error:" + err);
    throw err as Error;
  }
}

function createAsyVerify(verifyAlgoName: string): cryptoFramework.Verify {
  try {
    let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify(verifyAlgoName);
    console.log("verifyGenerator algName: " + verifyGenerator.algName);
    return verifyGenerator;
  } catch (err: BusinessError) {
    console.error("verifyGenerator error:" + err);
    throw err as Error;
  }
}

function createAsyKeyAgreement(ECDHAlgoName: string): cryptoFramework.KeyAgreement {
  try {
    let generator: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(ECDHAlgoName);
    console.log("createKeyAgreement algName: " + generator.algName);
    return generator;
  } catch (err: BusinessError) {
    console.error("createKeyAgreement error:" + err);
    throw err as Error;
  }
}

function createSymKeyGenerator(symAlgoName: string): cryptoFramework.SymKeyGenerator {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
    console.log("symKeyGenerator algName: " + symKeyGenerator.algName);
    return symKeyGenerator;
  } catch (err: BusinessError) {
    console.error("symKeyGenerator error:" + err);
    throw err as Error;
  }
}

export {
  createAsyKeyGenerator,
  createAsyKeyGeneratorBySpec,
  createAsyCipher,
  createAsySign,
  createAsyVerify,
  createAsyKeyAgreement,
  createSymKeyGenerator,
};
