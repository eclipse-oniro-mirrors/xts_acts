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
import { BusinessError } from '@ohos.base';
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";
import {
  createAsyKeyGenerator,
  createAsyKeyGeneratorBySpec,
  createAsyCipher,
  createAsySign,
  createAsyVerify,
  createAsyKeyAgreement,
} from "./publicAsymmetricCommon";

async function generateAsyKeyPair(rsaGenerator: cryptoFramework.AsyKeyGenerator): Promise<cryptoFramework.KeyPair> {
  let pubKey: cryptoFramework.PubKey;
  let priKey: cryptoFramework.PriKey;
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    rsaGenerator
      .generateKeyPair()
      .then((rsaKeyPair: cryptoFramework.KeyPair) => {
        pubKey = rsaKeyPair.pubKey;
        let encodedPubKey = pubKey.getEncoded();
        console.log("encodedPubKey: " + encodedPubKey);
        priKey = rsaKeyPair.priKey;
        let encodedPriKey = priKey.getEncoded();
        console.log("encodedPriKey: " + encodedPriKey);
        resolve(rsaKeyPair);
      })
      .catch((err: Error) => {
        console.error("[Promise]generateSymKey failed. error is " + err);
        reject(err);
      });
  });
}

async function convertAsyKey(rsaGenerator: cryptoFramework.AsyKeyGenerator,
  pubKeyDataBlob: cryptoFramework.DataBlob, priKeyDataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    rsaGenerator
      .convertKey(pubKeyDataBlob, priKeyDataBlob)
      .then((convertKeyPair: cryptoFramework.KeyPair) => {
        console.log(
          "[Promise]convertKey success. convertKeyPair is " + convertKeyPair
        );
        resolve(convertKeyPair);
      })
      .catch((err: Error) => {
        console.error("[Promise]convertKey failed. error is " + err);
        reject(err);
      });
  });
}

async function initCipher(cipherGenerator: cryptoFramework.Cipher,
  mode: cryptoFramework.CryptoMode, key: cryptoFramework.Key, params: cryptoFramework.ParamsSpec | null): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipherGenerator
      .init(mode, key, params)
      .then(() => {
        console.log("[Promise]cipherGenerator init success! mode is : " + mode);
        resolve("init success");
      })
      .catch((err: Error) => {
        console.error(
          "[Promise]cipherGenerator init failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function doFinalCipher(cipherGenerator: cryptoFramework.Cipher,
  mode: cryptoFramework.CryptoMode, dataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    cipherGenerator
      .doFinal(dataBlob)
      .then((finalData: cryptoFramework.DataBlob|null) => {
        console.log(
          "[Promise]cipherGenerator doFinal success! mode is : " + mode
        );
        console.log(
          "[Promise]cipherGenerator doFinal success! dataBlob is : " + dataBlob
        );
        if (finalData === null) {
          reject(new Error('[Promise]cipherGenerator doFinal failed!'));
        } else {
          resolve(finalData);
        }
      })
      .catch((err: Error) => {
        console.log(
          "[Promise]cipherGenerator doFinal faailed dataBlob is : " + dataBlob
        );
        console.error(
          "[Promise]cipherGenerator doFinal failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function initSign(signGenerator: cryptoFramework.Sign, priKey: cryptoFramework.PriKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    signGenerator
      .init(priKey)
      .then(() => {
        console.log("[Promise]signGenerator init success!");
        resolve("init success");
      })
      .catch((err: Error) => {
        console.error("[Promise]signGenerator init failed. error is " + err);
        reject(err);
      });
  });
}

async function updateSign(signGenerator: cryptoFramework.Sign, dataBlob: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    signGenerator
      .update(dataBlob)
      .then(() => {
        console.log("[Promise]signGenerator update success!");
        resolve("update success");
      })
      .catch((err: Error) => {
        console.error("[Promise]signGenerator update failed. error is " + err);
        reject(err);
      });
  });
}

async function signForSign(signGenerator: cryptoFramework.Sign,
  dataBlob: cryptoFramework.DataBlob|null): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    signGenerator
      .sign(dataBlob)
      .then((signOutput: cryptoFramework.DataBlob) => {
        console.log("[Promise]signGenerator sign success!");
        resolve(signOutput);
      })
      .catch((err: Error) => {
        console.error("[Promise]signGenerator sign failed. error is " + err);
        reject(err);
      });
  });
}

async function initVerify(verifyGenerator: cryptoFramework.Verify, pubKey: cryptoFramework.PubKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    verifyGenerator
      .init(pubKey)
      .then(() => {
        console.log("[Promise]verifyGenerator init success!");
        resolve("init success");
      })
      .catch((err: Error) => {
        console.error("[Promise]verifyGenerator init failed. error is " + err);
        reject(err);
      });
  });
}

async function updateVerify(verifyGenerator: cryptoFramework.Verify,
  dataBlob: cryptoFramework.DataBlob): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    verifyGenerator
      .update(dataBlob)
      .then(() => {
        console.log("[Promise]verifyGenerator update success!");
        resolve("update success");
      })
      .catch((err: Error) => {
        console.error(
          "[Promise]verifyGenerator update failed. error is " + err
        );
        reject(err);
      });
  });
}

async function verifyForVerify(verifyGenerator: cryptoFramework.Verify,
  dataBlob: cryptoFramework.DataBlob|null, signDataBlob: cryptoFramework.DataBlob): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    verifyGenerator
      .verify(dataBlob, signDataBlob)
      .then((verifyOutput: boolean) => {
        console.log("[Promise]signGenerator sign success!");
        resolve(verifyOutput);
      })
      .catch((err: Error) => {
        console.error("[Promise]signGenerator sign failed. error is " + err);
        reject(err);
      });
  });
}

async function generateAsySecret(generator: cryptoFramework.KeyAgreement,
  priKey: cryptoFramework.PriKey, pubKey: cryptoFramework.PubKey): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    generator
      .generateSecret(priKey, pubKey)
      .then((output: cryptoFramework.DataBlob) => {
        console.log("[Promise]generateSecret success!");
        resolve(output);
      })
      .catch((err: Error) => {
        console.error("[Promise]generateSecret failed. error is " + err);
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalProcess(asyAlgoName: string, cipherAlgoName: string): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob;
  let globalRsaKeyPair: cryptoFramework.KeyPair;
  let globalText: string = "This is a cipher test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    let cipherGeneratorDecrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);

    generateAsyKeyPair(rsaGenerator)
      .then<string>((rsaKeyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = rsaKeyPair;
        return initCipher(
          cipherGeneratorEncrypt,
          encryptMode,
          globalRsaKeyPair.pubKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[promise] encryptAndDecryptNormalProcess encryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalCipherText = finalOutput;
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalRsaKeyPair.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[promise] encryptAndDecryptNormalProcess decryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        let decryptData = uInt8ArrayToString(finalOutput.data);
        if (decryptData == globalText) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[promise] encryptAndDecryptNormalProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAndVerifyNormalProcess(asyAlgoName: string, signVerifyAlgoName: string): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair;
  let globalSignBlob: cryptoFramework.DataBlob;
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(asyAlgoName);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    generateAsyKeyPair(rsaGenerator)
      .then<string>((rsaKeyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = rsaKeyPair;
        let encodedPubKey = rsaKeyPair.pubKey.getEncoded();
        let encodedPriKey = rsaKeyPair.priKey.getEncoded();
        convertAsyKey(rsaGenerator, encodedPubKey, encodedPriKey);
        return initSign(signGenerator, globalRsaKeyPair.priKey);
      })
      .then<string>((initSignOut: string) => {
        console.log(
          "[promise] signAndVerifyNormalProcess initSignOut:" + initSignOut
        );
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateSignOut: string) => {
        console.log(
          "[promise] signAndVerifyNormalProcess updateSignOut:" + updateSignOut
        );
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalSignBlob = finalOutput;
        console.log("signOutput: " + uInt8ArrayToShowStr(globalSignBlob.data));
        return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
      })
      .then<string>((initVerifyOut: string) => {
        console.log(
          "[promise] signAndVerifyNormalProcess updateSignOut:" + initVerifyOut
        );
        return updateVerify(verifyGenerator, input);
      })
      .then((updateVerifyOut: string) => {
        console.log(
          "[promise] signAndVerifyNormalProcess updateVerifyOut:" +
            updateVerifyOut
        );
        let result = verifyForVerify(verifyGenerator, input, globalSignBlob);
        resolve(result);
      })
      .catch((err: Error) => {
        console.error("[promise] signAndVerifyNormalProcess catch err:" + err);
        reject(err);
      });
  });
}

async function keyAgreementProcess(ECDHAlgoName: string): Promise<boolean> {
  let globalKeyPair: cryptoFramework.KeyPair;

  return new Promise<boolean>((resolve, reject) => {
    let eccGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator("ECC521");
    let globalECDHData: cryptoFramework.KeyAgreement = createAsyKeyAgreement(ECDHAlgoName);
    // if (globalECDHData.code != null) {
    //   reject(globalECDHData);
    // }
    generateAsyKeyPair(eccGenerator)
      .then<cryptoFramework.DataBlob>((keyPair: cryptoFramework.KeyPair) => {
        globalKeyPair = keyPair;
        return generateAsySecret(
          globalECDHData,
          globalKeyPair.priKey,
          globalKeyPair.pubKey
        );
      })
      .then((result: cryptoFramework.DataBlob) => {
        if (result != null) {
          console.warn("result data is " + uInt8ArrayToShowStr(result.data));
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error("[promise] keyAgreementProcess catch err.code:" + err);
        reject(err);
      });
  });
}

async function keyAgreementGetAlgNameProcess(ECDHAlgoName: string): Promise<void> {
  let globalRsaKeyPair: cryptoFramework.KeyPair;

  return new Promise<void>((resolve, reject) => {
    let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator(ECDHAlgoName);
    let globalECDHData: cryptoFramework.KeyAgreement = createAsyKeyAgreement(ECDHAlgoName);
    generateAsyKeyPair(rsaGenerator)
      .then<cryptoFramework.DataBlob>((rsaKeyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = rsaKeyPair;
        return generateAsySecret(
          globalECDHData,
          globalRsaKeyPair.priKey,
          globalRsaKeyPair.pubKey
        );
      })
      .then((result: cryptoFramework.DataBlob) => {
        console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
        console.log("[Promise]: globalECDHData.algName 1: " + ECDHAlgoName);
        console.log(
          "[Promise]: globalECDHData.algName 2: " + globalECDHData.algName
        );
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error("[promise] keyAgreementProcess catch err:" + err);
        reject(err);
      });
  });
}

async function keyAgreementBySpecProcess(asyKeySpec: cryptoFramework.AsyKeySpec,
  ECDHAlgoName: string): Promise<boolean> {
  let globalKeyPair: cryptoFramework.KeyPair;

  return new Promise<boolean>((resolve, reject) => {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let globalECDHData: cryptoFramework.KeyAgreement = createAsyKeyAgreement(ECDHAlgoName);
    specGenerator.generateKeyPair()
      .then<cryptoFramework.DataBlob>((keyPair: cryptoFramework.KeyPair) => {
        globalKeyPair = keyPair;
        return generateAsySecret(
          globalECDHData,
          globalKeyPair.priKey,
          globalKeyPair.pubKey
        );
      })
      .then((result: cryptoFramework.DataBlob) => {
        if (result.data != null) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[promise] keyAgreementBySpecProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function encryptAndDecryptBySpecProcess(asyKeyPairSpec: cryptoFramework.KeyPair,
  cipherAlgoName: string): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob;
  let globalText: string = "This is a cipher test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<boolean>((resolve, reject) => {
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    let cipherGeneratorDecrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[promise] encryptAndDecryptBySpecProcess encryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalCipherText = finalOutput;
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          asyKeyPairSpec.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[promise] encryptAndDecryptBySpecProcess decryptMode initCipherOut:" +
            initCipherOut
        );
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        let decryptData = uInt8ArrayToString(finalOutput.data);
        if (decryptData == globalText) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[promise] encryptAndDecryptBySpecProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function encryptInitSetAndGetSpecProcess(asyKeyPairSpec: cryptoFramework.KeyPair,
  cipherAlgoName: string): Promise<boolean> {
  let globalCipherText: cryptoFramework.DataBlob;
  let globalText: string = "This is a cipher test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  let pSource: Uint8Array = new Uint8Array([1, 2, 3, 4]);
  return new Promise<boolean>((resolve, reject) => {
    let cipherGeneratorEncrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    let cipherGeneratorDecrypt: cryptoFramework.Cipher = createAsyCipher(cipherAlgoName);
    initCipher(cipherGeneratorEncrypt, encryptMode, asyKeyPairSpec.pubKey, null)
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[promise] encryptInitSetAndGetSpecProcess encryptMode initCipherOut:" +
            initCipherOut
        );
        cipherGeneratorEncrypt.setCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
          pSource
        );
        cipherGeneratorEncrypt.getCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
        );
        return doFinalCipher(cipherGeneratorEncrypt, encryptMode, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalCipherText = finalOutput;
        return initCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          asyKeyPairSpec.priKey,
          null
        );
      })
      .then<cryptoFramework.DataBlob>((initCipherOut: string) => {
        console.log(
          "[promise] encryptInitSetAndGetSpecProcess decryptMode initCipherOut:" +
            initCipherOut
        );
        cipherGeneratorDecrypt.setCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
          pSource
        );
        cipherGeneratorDecrypt.getCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR
        );
        return doFinalCipher(
          cipherGeneratorDecrypt,
          decryptMode,
          globalCipherText
        );
      })
      .then((finalOutput: cryptoFramework.DataBlob) => {
        let decryptData = uInt8ArrayToString(finalOutput.data);
        if (decryptData == globalText) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[promise] encryptInitSetAndGetSpecProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function signAndVerifyBySpecProcess(asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair;
  let globalSignBlob: cryptoFramework.DataBlob;
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  return new Promise<boolean>((resolve, reject) => {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    specGenerator.generateKeyPair()
      .then<string>((keyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = keyPair;
        return initSign(signGenerator, globalRsaKeyPair.priKey);
      })
      .then<string>((initSignOut: string) => {
        console.log(
          "[promise] signAndVerifyBySpecProcess initSignOut:" + initSignOut
        );
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateSignOut: string) => {
        console.log(
          "[promise] signAndVerifyBySpecProcess updateSignOut:" + updateSignOut
        );
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalSignBlob = finalOutput;
        return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
      })
      .then<string>((initVerifyOut: string) => {
        console.log(
          "[promise] signAndVerifyBySpecProcess initVerifyOut:" + initVerifyOut
        );
        return updateVerify(verifyGenerator, input);
      })
      .then((updateVerifyOut: string) => {
        console.log(
          "[promise] signAndVerifyBySpecProcess updateVerifyOut:" +
            updateVerifyOut
        );
        resolve(verifyForVerify(verifyGenerator, input, globalSignBlob));
      })
      .catch((err: Error) => {
        console.error("[promise] signAndVerifyBySpecProcess catch err:" + err);
        reject(err);
      });
  });
}

async function signAndVerifySetAndGetSpecProcess(
  asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string,
  itemType: cryptoFramework.SignSpecItem,
  itemValue: int | Uint8Array
): Promise<boolean> {
  let globalRsaKeyPair: cryptoFramework.KeyPair;
  let globalSignBlob: cryptoFramework.DataBlob;
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  return new Promise<boolean>((resolve, reject) => {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    specGenerator.generateKeyPair()
      .then<string>((keyPair: cryptoFramework.KeyPair) => {
        globalRsaKeyPair = keyPair;
        return initSign(signGenerator, globalRsaKeyPair.priKey);
      })
      .then<string>((initSignOut: string) => {
        console.log(
          "[promise] signAndVerifySetAndGetSpecProcess initSignOut:" +
            initSignOut
        );
        signGenerator.setSignSpec(itemType, itemValue);
        verifyGenerator.setVerifySpec(itemType, itemValue);
        return updateSign(signGenerator, input);
      })
      .then<cryptoFramework.DataBlob>((updateSignOut: string) => {
        console.log(
          "[promise] signAndVerifySetAndGetSpecProcess updateSignOut:" +
            updateSignOut
        );
        return signForSign(signGenerator, input);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob) => {
        globalSignBlob = finalOutput;
        return initVerify(verifyGenerator, globalRsaKeyPair.pubKey);
      })
      .then<string>((initVerifyOut: string) => {
        console.log(
          "[promise] signAndVerifySetAndGetSpecProcess initVerifyOut:" +
            initVerifyOut
        );
        return updateVerify(verifyGenerator, input);
      })
      .then<boolean>((updateVerifyOut: string) => {
        console.log(
          "[promise] signAndVerifySetAndGetSpecProcess updateVerifyOut:" +
            updateVerifyOut
        );
        return verifyForVerify(verifyGenerator, input, globalSignBlob);
      })
      .then((finalStatus: boolean) => {
        console.log(
          "[promise] signAndVerifySetAndGetSpecProcess finalStatus:" +
            finalStatus
        );
        let signSpec: string | int = signGenerator.getSignSpec(itemType);
        let verifySpec: string | int = verifyGenerator.getVerifySpec(itemType);
        if (verifySpec == itemValue && signSpec == itemValue) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[promise] signAndVerifySetAndGetSpecProcess catch err:" + err
        );
        reject(err);
      });
  });
}

async function updateAbnormalParameterProcess(
  asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string,
  updateType: int
): Promise<void> {
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  try {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let keyPair: cryptoFramework.KeyPair = await specGenerator.generateKeyPair();
    switch (updateType) {
      case 1:
        await initSign(signGenerator, keyPair.priKey);
        await updateSign(signGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      case 2:
        await initSign(signGenerator, keyPair.priKey);
        await updateSign(signGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      case 3:
        await initSign(signGenerator, keyPair.priKey);
        await updateSign(signGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      default:
        await updateSign(signGenerator, input);
        break;
    }
  } catch (err: BusinessError) {
    console.error("[Promise] updateAbnormalParameterProcess catch err: " + err);
    throw err as Error;
  }
}

async function verifyUpdateAbnormalParameterProcess(
  asyKeySpec: cryptoFramework.AsyKeySpec,
  signVerifyAlgoName: string,
  updateType: int
): Promise<void> {
  let globalText: string = "This is a sign test";
  let input: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
  try {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = createAsyKeyGeneratorBySpec(asyKeySpec);
    let signGenerator: cryptoFramework.Sign = createAsySign(signVerifyAlgoName);
    let verifyGenerator: cryptoFramework.Verify = createAsyVerify(signVerifyAlgoName);
    let keyPair: cryptoFramework.KeyPair = await specGenerator.generateKeyPair();
    await initSign(signGenerator, keyPair.priKey);
    await updateSign(signGenerator, input);
    await signForSign(signGenerator, input);
    switch (updateType) {
      case 1:
        await initVerify(verifyGenerator, keyPair.pubKey);
        await updateVerify(verifyGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      case 2:
        await initVerify(verifyGenerator, keyPair.pubKey);
        await updateVerify(verifyGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      case 3:
        await initVerify(verifyGenerator, keyPair.pubKey);
        await updateVerify(verifyGenerator, {data: new Uint8Array()} as cryptoFramework.DataBlob);
        break;
      default:
        await updateVerify(verifyGenerator, input);
        break;
    }
  } catch (err: BusinessError) {
    console.error("[Promise] verifyUpdateAbnormalParameterProcess catch err: " + err);
    throw err as Error;
  }
}

async function generateSpecKeyPair(asyKeySpec: cryptoFramework.AsyKeyGenerator
  |cryptoFramework.AsyKeyGeneratorBySpec): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    asyKeySpec
      .generateKeyPair()
      .then((asyKeyPair: cryptoFramework.KeyPair) => {
        console.info("Security_CryptoFramework asyKeyPair = " + asyKeyPair);
        resolve(asyKeyPair);
      })
      .catch((err: Error) => {
        console.error(
          "[Promise] generateSpecAsyKeyPair failed. error is " + err
        );
        reject(err);
      });
  });
}

async function keyGenerationBySpecProcess(asyKeySpec: cryptoFramework.AsyKeySpec): Promise<boolean> {
  let pubkey: bigint | string | int;
  let prikey: bigint | string | int;
  return new Promise<boolean>((resolve, reject) => {
    let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(asyKeySpec);
    generateSpecKeyPair(specGenerator)
      .then<cryptoFramework.KeyPair>((keypair: cryptoFramework.KeyPair) => {
        let pubEncoded: cryptoFramework.DataBlob = keypair.pubKey.getEncoded();
        let priEncoded: cryptoFramework.DataBlob = keypair.priKey.getEncoded();
        pubkey = keypair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_PK_BN
        );
        prikey = keypair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_SK_BN
        );
        console.log("keyGenerationBySpecProcess keypair.pubKey " + pubkey);
        console.log("keyGenerationBySpecProcess keypair.priKey " + prikey);
        let rsaGenerator: cryptoFramework.AsyKeyGenerator = createAsyKeyGenerator("DSA2048");
        return convertAsyKey(rsaGenerator, pubEncoded, priEncoded);
      })
      .then((conKeyPair: cryptoFramework.KeyPair) => {
        let conPrikey: bigint | string | int = conKeyPair.priKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_SK_BN
        );
        let conPubkey: bigint | string | int = conKeyPair.pubKey.getAsyKeySpec(
          cryptoFramework.AsyKeySpecItem.DSA_PK_BN
        );
        if (pubkey == conPubkey && prikey == conPrikey) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error("[promise] keyGenerationBySpecProcess catch err:" + err);
        reject(err);
      });
  });
}

export {
  encryptAndDecryptNormalProcess,
  signAndVerifyNormalProcess,
  keyAgreementProcess,
  keyAgreementGetAlgNameProcess,
  encryptAndDecryptBySpecProcess,
  keyAgreementBySpecProcess,
  encryptInitSetAndGetSpecProcess,
  signAndVerifyBySpecProcess,
  signAndVerifySetAndGetSpecProcess,
  updateAbnormalParameterProcess,
  verifyUpdateAbnormalParameterProcess,
  keyGenerationBySpecProcess
};
